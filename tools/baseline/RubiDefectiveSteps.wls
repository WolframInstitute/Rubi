#!/usr/bin/env wolframscript
(* Locate the first defective Rubi rewrite step without editing any rules.
   Usage: wolframscript -file tools/baseline/RubiDefectiveSteps.wls RESULT_ROOT *)

$HistoryLength = 0
$LoadShowSteps = True
$LoadElementaryFunctionRules = True

Get[FileNameJoin[{Directory[], "tools", "baseline", "AuditWrongAnswers.wls"}]]
Get[FileNameJoin[{Directory[], "Rubi", "Rubi.m"}]]

expandSubst[u_, v_, w_] := D[w, v] * (D[u /. {Defer[Rubi`Int] -> Integrate, Rubi`Int -> Integrate}, v] /. v -> w)

expandedDerivative[expression_, variable_] := With[{expanded = ReleaseHold[expression /. {Defer[Rubi`Int] -> Integrate, Rubi`Int -> Integrate, Defer[Subst][u_, v_, w_] :> expandSubst[u, v, w]}]},
	D[expanded, variable]
]

numericResidual[integrand_, residual_, variable_, key_String] := With[{parameters = DeleteCases[DeleteDuplicates[Cases[{integrand, residual}, symbol_Symbol /; Context[symbol] === "Global`", Infinity]], variable]},
	With[{values = Function[attempt,
		Quiet @ N[{integrand, residual} /. Thread[Join[{variable}, parameters] -> sampleValues[key, Length[parameters] + 1, attempt]], 50]
	] /@ {17, 18, 19}},
		With[{scales = Cases[values, {i_ ? NumberQ, r_ ? NumberQ} :> Abs[r] / Max[1, Abs[i], Abs[r]]]},
			Which[
				Count[scales, value_ /; value > 10^-20] >= 2,
					<|"Status" -> "defective-rule", "Scales" -> scales|>,
				Length[scales] >= 2 && Max[scales] < 10^-20,
					<|"Status" -> "valid", "Scales" -> scales|>,
				True,
					<|"Status" -> "undecided", "Scales" -> scales|>
			]
		]
	]
]

checkResidual[integrand_, residual_, variable_, key_String] := With[{simplified = TimeConstrained[Simplify[residual], 60, $Aborted]},
	If[ simplified === 0,
		<|"Status" -> "valid", "Method" -> "Simplify"|>,
		Join[<|"Method" -> "three-complex-50-digit"|>, numericResidual[integrand, residual, variable, key]]
	]
]

stepMetadata[steps_] := Cases[
	steps,
	Rubi`RubiRule[condition_, lhs_, rhs_, number_] :> <|
		"Condition" -> inputFormString[condition],
		"LeftHandSide" -> inputFormString[lhs],
		"RightHandSide" -> inputFormString[rhs],
		"Number" -> number
	|>,
	Infinity
]

stepAudit[row_Association] := With[{integrand = ToExpression[row["integrand"]], variable = ToExpression[row["variable"]]},
	With[{steps = MemoryConstrained[TimeConstrained[Rubi`Steps[Rubi`Int[integrand, variable], Rubi`RubiPrintInformation -> False], 300, $Aborted], 3 * 1024^3, $Aborted]},
		If[ steps === $Aborted,
			<|"DefectClassification" -> "undecided", "Reason" -> "step extraction exceeded 300 seconds or 3 GiB"|>
			,
			With[{rules = stepMetadata[steps], intermediates = Cases[steps, Rubi`RubiIntermediateResult[HoldComplete[expression_]] :> HoldComplete[expression], Infinity]},
				If[ Length[rules] =!= Length[intermediates],
					<|"DefectClassification" -> "undecided", "Reason" -> "rule and intermediate counts differ", "RuleCount" -> Length[rules], "IntermediateCount" -> Length[intermediates]|>
					,
					Catch[
						Do[
							With[{residual = expandedDerivative[intermediates[[index]], variable] - integrand},
								With[{checked = checkResidual[integrand, residual, variable, row["key"]]},
									If[ checked["Status"] =!= "valid",
										Throw[
											Join[
												<|
													"DefectClassification" -> checked["Status"],
													"DefectiveStep" -> index,
													"DefectiveRule" -> rules[[index]],
													"DefectiveResidual" -> inputFormString[residual],
													"DefectCheck" -> checked
												|>
											]
										]
									]
								]
							],
							{index, Length[rules]}
						];
						<|"DefectClassification" -> "no-defective-step-found", "Reason" -> "every intermediate derivative matched the original integrand"|>
					]
				]
			]
		]
	]
]

defectMarkdown[rows_List] := StringJoin[
	"# First defective Rubi rewrite steps\n\n",
	"Counts: ", inputFormString[Counts[#["DefectClassification"]& /@ rows]], "\n\n",
	StringRiffle[
		Function[row, StringJoin[
			"## ", row["DefectClassification"], ": ", row["key"], "\n\n",
			"- Integrand: `", row["integrand"], "`\n",
			If[IntegerQ[row["DefectiveStep"]], StringJoin[
				"- Step: `", ToString[row["DefectiveStep"]], "`; Rubi rule: `", ToString[row["DefectiveRule"]["Number"]], "`\n",
				"- LHS: `", row["DefectiveRule"]["LeftHandSide"], "`\n",
				"- RHS: `", row["DefectiveRule"]["RightHandSide"], "`\n",
				"- Residual: `", row["DefectiveResidual"], "`\n",
				"- Check: `", inputFormString[row["DefectCheck"]], "`\n",
				"- Reason: ", Lookup[row, "Reason", "first failing derivative identity"], "\n"
			], ""]
		]] /@ rows,
		"\n\n"
	]
]

runDefectAudit[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "Rubi"}], output = FileNameJoin[{resultRoot, "Rubi", "defective-steps.wl"}]},
	With[{rows = Select[ReadList[FileNameJoin[{methodRoot, "wrong-rule-groups.wl"}], Expression], StringContainsQ[#["key"], "1.2.2.2"] || StringContainsQ[#["key"], "7.3.6"]&], completed = readCompleted[output]},
		Print["Defect-step audit pending=", Count[rows, row_ /; ! TrueQ[completed[row["key"]]]]];
		Scan[
			Function[row,
				If[ ! TrueQ[completed[row["key"]]],
					Print["Step-auditing ", row["key"]];
					appendRow[output, Join[row, stepAudit[row]]];
					ClearSystemCache[]
				]
			],
			rows
		];
		With[{audited = ReadList[output, Expression]},
			Export[FileNameJoin[{methodRoot, "defective-steps.md"}], defectMarkdown[audited], "Text"];
			Print["Defect-step results: ", Counts[#["DefectClassification"]& /@ audited]]
		]
	]
]

runDefectArguments[_, resultRoot_String] := runDefectAudit[resultRoot]

runDefectArguments[___] := (
	Print["Defect-step arguments: RESULT_ROOT"];
	Exit[2]
)

MemoryConstrained[
	runDefectArguments @@ $ScriptCommandLine,
	4 * 1024^3,
	Print["Defect-step memory limit exceeded"];
	Exit[12]
]
