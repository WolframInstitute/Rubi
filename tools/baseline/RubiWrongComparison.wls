#!/usr/bin/env wolframscript
(* Compare Rubi on the 44 confirmed-failure W15 audit rows.
   Usage: wolframscript -file tools/baseline/RubiWrongComparison.wls RESULT_ROOT *)

$HistoryLength = 0
$LoadShowSteps = False
$LoadElementaryFunctionRules = True

Get[FileNameJoin[{Directory[], "tools", "baseline", "AuditWrongAnswers.wls"}]]
Get[FileNameJoin[{Directory[], "tools", "baseline", "Baseline.wl"}]]
Get[FileNameJoin[{Directory[], "Rubi", "Rubi.m"}]]

resolvedQ[answer_] := FreeQ[answer, Rubi`Int | Rubi`CannotIntegrate | Rubi`Unintegrable | Integrate]

unresolvedComparison[row_Association, answer_, reason_String, elapsed_] := Join[
	row,
	<|
		"RubiAnswer" -> If[answer === $Aborted, Missing["NotStored"], inputFormString[answer]],
		"RubiIntegrationTime" -> N[elapsed],
		"RubiGrade" -> "F",
		"RubiOutcome" -> "unresolved",
		"RubiClassification" -> "unresolved",
		"RubiReason" -> reason,
		"RubiValidSamples" -> 0,
		"RubiEvidence" -> Missing["NotApplicable"]
	|>
]

compareRow[row_Association] := With[{started = AbsoluteTime[], integrand = ToExpression[row["integrand"]], variable = ToExpression[row["variable"]], optimal = ToExpression[row["optimal"]]},
	With[{answer = MemoryConstrained[TimeConstrained[Rubi`Int[integrand, variable], 180, $Aborted], 3 * 1024^3, $Aborted], elapsed = AbsoluteTime[] - started},
		If[ answer === $Aborted || ! resolvedQ[answer],
			unresolvedComparison[row, answer, "Rubi integration was unresolved or exceeded 180 seconds or 3 GiB", elapsed]
			,
			With[{answerText = inputFormString[answer]},
				With[{audited = auditRow[Join[row, <|"answer" -> answerText|>]], grade = Baseline`BaselineGradeAnswer[answer, optimal]},
					With[{classification = audited["Classification"], outcome = Replace[audited["Classification"], {"false-alarm" -> "solved", ("wrong-derivative" | "different-constant") -> "wrong", _ -> "unverified"}]},
						Join[
							row,
							<|
								"RubiAnswer" -> answerText,
								"RubiIntegrationTime" -> N[elapsed],
								"RubiGrade" -> If[outcome === "solved", grade["Grade"], "F"],
								"RubiOutcome" -> outcome,
								"RubiClassification" -> classification,
								"RubiReason" -> audited["Reason"],
								"RubiValidSamples" -> audited["ValidSamples"],
								"RubiDerivativeResidual" -> audited["DerivativeResidual"],
								"RubiSamples" -> audited["Samples"],
								"RubiEvidence" -> Switch[classification, "wrong-derivative", wrongEvidence[audited], "different-constant", constantEvidence[audited], _, Missing["NotApplicable"]]
							|>
						]
					]
				]
			]
		]
	]
]

boundedCompareRow[row_Association] := MemoryConstrained[
	TimeConstrained[compareRow[row], 600, $Aborted],
	3 * 1024^3,
	$Aborted
]

comparisonMarkdown[rows_List] := StringJoin[
	"# Rubi on 44 W15 wrong-answer audit rows\n\n",
	"Rubi outcome counts: ", inputFormString[Counts[#["RubiOutcome"]& /@ rows]], "\n\n",
	"Rubi grade counts: ", inputFormString[Counts[#["RubiGrade"]& /@ rows]], "\n\n",
	StringRiffle[
		Function[row, StringJoin[
			"## ", row["key"], "\n\n",
			"- W15 classification: `", row["Classification"], "`\n",
			"- Integrand: `", row["integrand"], "`\n",
			"- W15 answer: `", row["answer"], "`\n",
			"- Rubi answer: `", inputFormString[row["RubiAnswer"]], "`\n",
			"- Rubi grade: `", row["RubiGrade"], "`; outcome: `", row["RubiOutcome"], "`; classification: `", row["RubiClassification"], "`\n",
			"- Rubi check: ", row["RubiReason"], "\n",
			"- Rubi 50-digit evidence: `", inputFormString[row["RubiEvidence"]], "`\n"
		]] /@ rows,
		"\n\n"
	]
]

runComparison[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}], output = FileNameJoin[{resultRoot, "W15", "wrong-rubi-comparison.wl"}]},
	With[{rows = Select[Get[FileNameJoin[{methodRoot, "wrong-audit-evidence.wl"}]], MemberQ[{"wrong-derivative", "different-constant"}, #["Classification"]]&], completed = readCompleted[output]},
		If[ Length[rows] =!= 44,
			Print["Expected 44 W15 comparison rows, found ", Length[rows]];
			Exit[3]
		];
		Print["Rubi comparison pending=", Count[rows, row_ /; ! TrueQ[completed[row["key"]]]]];
		Scan[
			Function[row,
				If[ ! TrueQ[completed[row["key"]]],
					Print["Comparing ", row["key"]];
					With[{result = boundedCompareRow[row]},
						If[ result === $Aborted,
							appendRow[output, unresolvedComparison[row, $Aborted, "Rubi comparison exceeded 600 seconds or 3 GiB", 600]],
							appendRow[output, result]
						]
					];
					ClearSystemCache[]
				]
			],
			rows
		];
		With[{compared = ReadList[output, Expression]},
			Export[FileNameJoin[{methodRoot, "wrong-rubi-comparison.md"}], comparisonMarkdown[compared], "Text"];
			Print["Rubi comparison complete: ", Counts[#["RubiOutcome"]& /@ compared]]
		]
	]
]

runComparisonArguments[_, resultRoot_String] := runComparison[resultRoot]

runComparisonArguments[___] := (
	Print["Rubi comparison arguments: RESULT_ROOT"];
	Exit[2]
)

MemoryConstrained[
	runComparisonArguments @@ $ScriptCommandLine,
	4 * 1024^3,
	Print["Rubi comparison shard memory limit exceeded"];
	Exit[12]
]
