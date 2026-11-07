#!/usr/bin/env wolframscript
(* Strict second audit of W15 wrong-answer candidates.
   Usage: wolframscript -file tools/baseline/AuditWrongAnswers.wls RESULT_ROOT *)

$HistoryLength = 0

$auditAttempts = Join[Range[10], Range[17, 26]]
$minimumValidSamples = 8
$sampleTimeLimit = 60

inputFormString[expression_] := ToString[InputForm[expression], PageWidth -> Infinity]

samplePart[key_String, attempt_Integer, index_Integer, part_String, minimum_Integer, maximum_Integer] := minimum + Mod[
	Hash[StringToByteArray[StringJoin[key, ":", ToString[attempt], ":", ToString[index], ":", part], "UTF-8"], "SHA256"],
	maximum - minimum + 1
]

sampleValues[key_String, parameterCount_Integer, attempt_Integer] := With[{
	realValues = Table[
		samplePart[key, attempt, index, "real-numerator", 11, 113] / samplePart[key, attempt, index, "real-denominator", 37, 127],
		{index, parameterCount}
	]
},
	If[
		attempt > 16,
		realValues + I * Table[
			samplePart[key, attempt, index, "imaginary-numerator", 1, 19] / samplePart[key, attempt, index, "imaginary-denominator", 23, 61],
			{index, parameterCount}
		],
		realValues
	]
]

appendRow[output_String, row_Association] := With[{stream = OpenAppend[output]},
	WriteString[stream, inputFormString[row] <> "\n"];
	Close[stream]
]

readCompleted[output_String] /; ! FileExistsQ[output] := <||>

readCompleted[output_String] := With[{rows = ReadList[output, Expression]},
	If[ ! AllTrue[rows, AssociationQ],
		Print["Malformed wrong-answer audit resume data"];
		Exit[4]
	];
	Association[#["key"] -> True& /@ rows]
]

recoverAnswer[row_Association] /; StringQ[row["answer"]] := row["answer"]

recoverAnswer[row_Association] := With[{started = AbsoluteTime[], integrand = ToExpression[row["integrand"]], variable = ToExpression[row["variable"]]},
	With[{answer = MemoryConstrained[TimeConstrained[Integrate[integrand, variable], 180, $Aborted], 3 * 1024^3, $Aborted]},
		If[ answer === $Aborted,
			$Aborted
			,
			Print["Recovered ", row["key"], " in ", N[AbsoluteTime[] - started], " seconds"];
			inputFormString[answer]
		]
	]
]

samplePoint[key_String, parameters_List, variable_Symbol, attempt_Integer] := With[{values = sampleValues[key, Length[parameters] + 1, attempt]},
	<|"Variable" -> First[values], "Rules" -> Thread[Join[{variable}, parameters] -> values]|>
]

numericSample[integrand_, answer_, derivative_, optimal_, point_Association] := With[{rules = point["Rules"], variableValue = point["Variable"], delta = 10^-12},
	With[{
		integrandValue = Quiet @ N[integrand /. rules, 50],
		answerValue = Quiet @ N[answer /. rules, 50],
		derivativeValue = Quiet @ N[derivative /. rules, 50],
		optimalValue = Quiet @ N[optimal /. rules, 50],
		plusValue = Quiet @ N[integrand /. MapAt[# + delta&, rules, {1, 2}], 50],
		minusValue = Quiet @ N[integrand /. MapAt[# - delta&, rules, {1, 2}], 50]
	},
		<|
			"Point" -> inputFormString[rules],
			"DerivativeScale" -> If[NumberQ[integrandValue] && NumberQ[derivativeValue], N[Abs[derivativeValue - integrandValue] / Max[1, Abs[integrandValue], Abs[derivativeValue]], 8], Missing["NotNumeric"]],
			"AnswerOptimalDifference" -> If[NumberQ[answerValue] && NumberQ[optimalValue], N[answerValue - optimalValue, 20], Missing["NotNumeric"]],
			"IntegrandContinuityScale" -> If[NumberQ[plusValue] && NumberQ[minusValue] && NumberQ[integrandValue], N[Max[Abs[plusValue - integrandValue], Abs[minusValue - integrandValue]] / Max[1, Abs[integrandValue]], 8], Missing["NotNumeric"]],
			"RealDomainQ" -> NumberQ[integrandValue] && NumberQ[optimalValue] && Chop[Im[integrandValue], 10^-40] == 0 && Chop[Im[optimalValue], 10^-40] == 0,
			"FiniteQ" -> AllTrue[{integrandValue, answerValue, derivativeValue, optimalValue, plusValue, minusValue}, NumberQ]
		|>
	]
]

constantSpread[values_List] /; values === {} := Infinity

constantSpread[values_List] := With[{first = First[values]},
	N[Max[Abs[# - first] / Max[1, Abs[first], Abs[#]]& /@ values], 8]
]

classifySamples[samples_List] := With[{valid = Select[samples, TrueQ[#["FiniteQ"]] && NumberQ[#["IntegrandContinuityScale"]] && #["IntegrandContinuityScale"] < 10^-8 && NumberQ[#["DerivativeScale"]] && NumberQ[#["AnswerOptimalDifference"]]&]},
	With[{scales = #["DerivativeScale"]& /@ valid, differences = #["AnswerOptimalDifference"]& /@ valid},
		Which[
			Length[valid] < $minimumValidSamples,
				<|"Classification" -> "undecided", "Reason" -> "too few finite samples away from integrand discontinuities", "ValidSamples" -> Length[valid]|>,
			Count[scales, value_ /; value > 10^-20] >= 2,
				<|"Classification" -> "wrong-derivative", "Reason" -> "scaled derivative residual exceeds 10^-20 at two or more continuous samples", "ValidSamples" -> Length[valid], "MaximumDerivativeScale" -> Max[scales]|>,
			Max[scales] < 10^-20,
				With[{spread = constantSpread[differences]},
					If[ spread > 10^-20,
						<|"Classification" -> "different-constant", "Reason" -> "derivative matches but answer minus reference varies across continuous samples", "ValidSamples" -> Length[valid], "MaximumDerivativeScale" -> Max[scales], "ConstantSpread" -> spread|>,
						<|"Classification" -> "false-alarm", "Reason" -> "derivative and answer-minus-reference constant agree at all continuous samples", "ValidSamples" -> Length[valid], "MaximumDerivativeScale" -> Max[scales], "ConstantSpread" -> spread|>
					]
				],
			True,
				<|"Classification" -> "undecided", "Reason" -> "numeric derivative evidence is inconclusive", "ValidSamples" -> Length[valid], "MaximumDerivativeScale" -> Max[scales]|>
		]
	]
]

auditRow[row_Association] := With[{integrand = ToExpression[row["integrand"]], variable = ToExpression[row["variable"]], optimal = ToExpression[row["optimal"]]},
	With[{answerText = recoverAnswer[row]},
		If[ answerText === $Aborted,
			Join[row, <|"Classification" -> "undecided", "Reason" -> "answer recovery exceeded 180 seconds or 3 GiB", "ValidSamples" -> 0|>]
			,
			With[{answer = ToExpression[answerText], derivative = D[ToExpression[answerText], variable]},
				With[{residual = derivative - integrand, parameters = DeleteCases[DeleteDuplicates[Cases[{integrand, answer, optimal}, symbol_Symbol /; Context[symbol] === "Global`", Infinity]], variable]},
					With[{
						symbolicZero = TimeConstrained[FullSimplify[residual], 60, $Aborted],
						samples = Function[attempt, TimeConstrained[numericSample[integrand, answer, derivative, optimal, samplePoint[row["key"], parameters, variable, attempt]], $sampleTimeLimit, <|"FiniteQ" -> False, "Reason" -> "sample timeout"|>]] /@ $auditAttempts
					},
						Join[
							row,
							<|
								"answer" -> answerText,
								"DerivativeResidual" -> inputFormString[residual],
								"SymbolicZero" -> If[symbolicZero === $Aborted, Missing["Timeout"], symbolicZero === 0],
								"Samples" -> samples
							|>,
							classifySamples[samples]
						]
					]
				]
			]
		]
	]
]

boundedAuditRow[row_Association] := MemoryConstrained[
	TimeConstrained[auditRow[row], 600, $Aborted],
	3 * 1024^3,
	$Aborted
]

runRows[rows_List, output_String] := With[{completed = readCompleted[output]},
	Print["Wrong-answer audit pending=", Count[rows, row_ /; ! TrueQ[completed[row["key"]]]]];
	Scan[
		Function[row,
			If[ ! TrueQ[completed[row["key"]]],
				Print["Auditing ", row["key"]];
				With[{result = boundedAuditRow[row]},
					If[ result === $Aborted,
						appendRow[output, Join[row, <|"Classification" -> "undecided", "Reason" -> "strict audit exceeded 600 seconds or 3 GiB", "ValidSamples" -> 0|>]],
						appendRow[output, result]
					]
				];
				ClearSystemCache[]
			]
		],
		rows
	];
	With[{audited = ReadList[output, Expression]},
		Print["Wrong-answer audit complete: ", Counts[#["Classification"]& /@ audited]]
	]
]

runWrongAudit[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}]},
	runRows[Get[FileNameJoin[{methodRoot, "wrong.wl"}]], FileNameJoin[{methodRoot, "wrong-audit.wl"}]]
]

runOOMAudit[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}]},
	With[{keys = ReadList[FileNameJoin[{methodRoot, "verification-oom-rows.txt"}], String]},
		With[{rows = Select[Get[FileNameJoin[{methodRoot, "wrong-and-unverified.wl"}]], MemberQ[keys, #["key"]]&]},
			If[ Length[rows] =!= Length[keys],
				Print["Could not recover every OOM source row"];
				Exit[3]
			];
			Block[{$auditAttempts = {1, 2, 17, 18}, $minimumValidSamples = 3},
				runRows[rows, FileNameJoin[{methodRoot, "verification-oom-small-sample-audit.wl"}]]
			]
		]
	]
]

evaluateAt[expression_, sample_Association] := Quiet @ N[expression /. ToExpression[sample["Point"]], 50]

numericEvidence[expression_, sample_Association] := inputFormString[evaluateAt[expression, sample]]

wrongEvidence[row_Association] := With[{samples = Select[row["Samples"], TrueQ[#["FiniteQ"]] && NumberQ[#["DerivativeScale"]]&]},
	With[{sample = First[Select[samples, #["DerivativeScale"] > 10^-20&], Missing["NoFailingSample"]]},
		If[ sample === Missing["NoFailingSample"],
			Missing["NoFailingSample"]
			,
			With[{integrand = ToExpression[row["integrand"]], residual = ToExpression[row["DerivativeResidual"]]},
				<|
					"Type" -> "derivative-residual",
					"Point" -> sample["Point"],
					"IntegrandValue" -> numericEvidence[integrand, sample],
					"DerivativeValue" -> numericEvidence[integrand + residual, sample],
					"ResidualValue" -> numericEvidence[residual, sample]
				|>
			]
		]
	]
]

constantEvidence[row_Association] := With[{valid = Select[row["Samples"], TrueQ[#["FiniteQ"]] && NumberQ[#["AnswerOptimalDifference"]]&]},
	With[{first = First[valid], answer = ToExpression[row["answer"]], optimal = ToExpression[row["optimal"]]},
		With[{second = First[MaximalBy[valid, Abs[#["AnswerOptimalDifference"] - first["AnswerOptimalDifference"]]&], first]},
			<|"Type" -> "region-constant", "Points" -> <|
				"First" -> <|"Point" -> first["Point"], "AnswerValue" -> numericEvidence[answer, first], "OptimalValue" -> numericEvidence[optimal, first], "Difference" -> numericEvidence[answer - optimal, first]|>,
				"Second" -> <|"Point" -> second["Point"], "AnswerValue" -> numericEvidence[answer, second], "OptimalValue" -> numericEvidence[optimal, second], "Difference" -> numericEvidence[answer - optimal, second]|>
			|>|>
		]
	]
]

evidenceRow[row_Association] := Join[
	row,
	<|"Evidence" -> Switch[row["Classification"], "wrong-derivative", wrongEvidence[row], "different-constant", constantEvidence[row], _, Missing["NotApplicable"]]|>
]

runEvidence[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}]},
	With[{rows = evidenceRow /@ Get[FileNameJoin[{methodRoot, "wrong-audit-classified.wl"}]]},
		Put[rows, FileNameJoin[{methodRoot, "wrong-audit-evidence.wl"}]];
		With[{text = StringJoin[
			"# W15 wrong-answer second audit\n\n",
			"Counts: ", inputFormString[Counts[#["Classification"]& /@ rows]], "\n\n",
			StringRiffle[
				Function[row, StringJoin[
					"## ", row["Classification"], ": ", row["key"], "\n\n",
					"- Integrand: `", row["integrand"], "`\n",
					"- W15 answer: `", row["answer"], "`\n",
					"- Reason: ", row["Reason"], "\n",
					"- 50-digit evidence: `", inputFormString[row["Evidence"]], "`\n"
				]] /@ rows,
				"\n\n"
			]
		]},
			Export[FileNameJoin[{methodRoot, "wrong-audit-evidence.md"}], text, "Text"]
		];
		Print["Wrote wrong-answer evidence for ", Length[rows], " rows"]
	]
]

reclassifyFile[input_String, output_String] := With[{rows = ReadList[input, Expression]},
	With[{classified = If[KeyExistsQ[#, "Samples"], Join[#, classifySamples[#["Samples"]]], #]& /@ rows},
		Put[classified, output];
		Print["Reclassified ", Length[classified], " rows: ", Counts[#["Classification"]& /@ classified]]
	]
]

runAuditArguments[_, resultRoot_String] := runWrongAudit[resultRoot]

runAuditArguments[_, resultRoot_String, "evidence"] := runEvidence[resultRoot]

runAuditArguments[_, resultRoot_String, "reclassify"] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}]},
	reclassifyFile[FileNameJoin[{methodRoot, "wrong-audit.wl"}], FileNameJoin[{methodRoot, "wrong-audit-classified.wl"}]]
]

runAuditArguments[_, resultRoot_String, "reclassify-oom"] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}]},
	reclassifyFile[FileNameJoin[{methodRoot, "verification-oom-small-sample-audit.wl"}], FileNameJoin[{methodRoot, "verification-oom-small-sample-classified.wl"}]]
]

runAuditArguments[_, resultRoot_String, "oom"] := runOOMAudit[resultRoot]

runAuditArguments[___] := (
	Print["Wrong-answer audit arguments: RESULT_ROOT [oom]"];
	Exit[2]
)

If[ ExpandFileName[$InputFileName] === ExpandFileName[First[$ScriptCommandLine]],
	MemoryConstrained[
		runAuditArguments @@ $ScriptCommandLine,
		4 * 1024^3,
		Print["Wrong-answer audit shard memory limit exceeded"];
		Exit[12]
	]
]
