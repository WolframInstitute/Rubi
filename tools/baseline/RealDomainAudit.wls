#!/usr/bin/env wolframscript
(* Classify the 44 W15 failure candidates by real-domain behavior with the suite optimum as control.
   Usage: wolframscript -file tools/baseline/RealDomainAudit.wls RESULT_ROOT *)

$HistoryLength = 0

$realAuditAttempts = Range[64]

Get[FileNameJoin[{Directory[], "tools", "baseline", "AuditWrongAnswers.wls"}]]

classifyRealSamples[samples_List] := With[{valid = Take[Select[samples, TrueQ[#["FiniteQ"]] && TrueQ[#["RealDomainQ"]] && NumberQ[#["IntegrandContinuityScale"]] && #["IntegrandContinuityScale"] < 10^-8 && NumberQ[#["DerivativeScale"]] && NumberQ[#["AnswerOptimalDifference"]]&], UpTo[20]]},
	With[{scales = #["DerivativeScale"]& /@ valid, differences = #["AnswerOptimalDifference"]& /@ valid},
		Which[
			Length[valid] < $minimumValidSamples,
				<|"Classification" -> "undecided", "Reason" -> "too few real continuous samples", "ValidSamples" -> Length[valid]|>,
			Count[scales, value_ /; value > 10^-20] >= 2,
				<|"Classification" -> "wrong-derivative", "Reason" -> "real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples", "ValidSamples" -> Length[valid], "MaximumDerivativeScale" -> Max[scales]|>,
			Max[scales] < 10^-20,
				With[{spread = constantSpread[differences]},
					If[ spread > 10^-20,
						<|"Classification" -> "different-constant", "Reason" -> "real-domain derivative matches but answer minus reference varies", "ValidSamples" -> Length[valid], "MaximumDerivativeScale" -> Max[scales], "ConstantSpread" -> spread|>,
						<|"Classification" -> "false-alarm", "Reason" -> "real-domain derivative and answer-minus-reference constant agree", "ValidSamples" -> Length[valid], "MaximumDerivativeScale" -> Max[scales], "ConstantSpread" -> spread|>
					]
				],
			True,
				<|"Classification" -> "undecided", "Reason" -> "real-domain numeric evidence is inconclusive", "ValidSamples" -> Length[valid], "MaximumDerivativeScale" -> Max[scales]|>
		]
	]
]

realSamplePoint[key_String, parameters_List, variable_Symbol, attempt_Integer] := With[{realAttempt = Mod[attempt - 1, 16] + 1, group = Floor[(attempt - 1) / 16] + 1},
	With[{baseValues = sampleValues[key, Length[parameters] + 1, realAttempt]},
		With[{signedValues = If[group >= 3, -baseValues, baseValues]},
			With[{values = If[EvenQ[group], MapAt[-#&, signedValues, 1], signedValues]},
				<|"Variable" -> First[values], "Rules" -> Thread[Join[{variable}, parameters] -> values]|>
			]
		]
	]
]

safeAudit[row_Association, answerText_String] := Block[{$auditAttempts = $realAuditAttempts, samplePoint, classifySamples},
	samplePoint[key_, parameters_, variable_, attempt_Integer] := realSamplePoint[key, parameters, variable, attempt];
	classifySamples[samples_List] := classifyRealSamples[samples];
	auditRow[Join[row, <|"answer" -> answerText|>]]
]

boundedRealAudit[row_Association, answerText_String, safeQ_] := MemoryConstrained[
	TimeConstrained[If[safeQ, safeAudit[row, answerText], auditRow[Join[row, <|"answer" -> answerText|>]]], 600, $Aborted],
	3 * 1024^3,
	$Aborted
]

realDomainClass[row_Association, optimalOriginal_Association, optimalSafe_Association, w15Safe_Association] := Which[
	optimalSafe["Classification"] === "false-alarm" && MemberQ[{"wrong-derivative", "different-constant"}, w15Safe["Classification"]],
		"a-wrong-real",
	optimalOriginal["Classification"] === "false-alarm" && optimalSafe["Classification"] === "false-alarm" && w15Safe["Classification"] === "false-alarm",
		"b-complex-or-out-of-region",
	optimalOriginal["Classification"] === "false-alarm" && optimalSafe["Reason"] === "too few real continuous samples" && w15Safe["Reason"] === "too few real continuous samples",
		"b-complex-or-out-of-region",
	optimalOriginal["Classification"] =!= "false-alarm" && w15Safe["Classification"] === "false-alarm",
		"c-false-alarm",
	optimalSafe["Classification"] =!= "false-alarm" && w15Safe["Classification"] === "false-alarm",
		"c-false-alarm",
	True,
		"undecided"
]

realDomainRow[row_Association] := Module[{optimalOriginal, optimalSafe, w15Safe},
	optimalOriginal = boundedRealAudit[row, row["optimal"], False];
	optimalSafe = boundedRealAudit[row, row["optimal"], True];
	w15Safe = boundedRealAudit[row, row["answer"], True];
	If[ optimalOriginal === $Aborted, optimalOriginal = <|"Classification" -> "undecided", "Reason" -> "original optimal audit exceeded its bound"|>];
	If[ optimalSafe === $Aborted, optimalSafe = <|"Classification" -> "undecided", "Reason" -> "safe optimal audit exceeded its bound", "ValidSamples" -> 0, "Samples" -> {}|>];
	If[ w15Safe === $Aborted, w15Safe = <|"Classification" -> "undecided", "Reason" -> "safe W15 audit exceeded its bound", "ValidSamples" -> 0, "Samples" -> {}|>];
	Join[
		row,
		<|
			"DomainClassification" -> realDomainClass[row, optimalOriginal, optimalSafe, w15Safe],
			"OptimalOriginalClassification" -> optimalOriginal["Classification"],
			"OptimalSafeClassification" -> optimalSafe["Classification"],
			"W15SafeClassification" -> w15Safe["Classification"],
			"OptimalSafeReason" -> optimalSafe["Reason"],
			"W15SafeReason" -> w15Safe["Reason"],
			"OptimalSafeSamples" -> optimalSafe["Samples"],
			"W15SafeSamples" -> w15Safe["Samples"]
		|>
	]
]

realDomainMarkdown[rows_List] := StringJoin[
	"# W15 real-domain audit\n\n",
	"Counts: ", inputFormString[Counts[#["DomainClassification"]& /@ rows]], "\n\n",
	StringRiffle[
		Function[row, StringJoin[
			"## ", row["DomainClassification"], ": ", row["key"], "\n\n",
			"- Original optimal classification: `", row["OptimalOriginalClassification"], "`\n",
			"- Safe optimal: `", row["OptimalSafeClassification"], "` - ", row["OptimalSafeReason"], "\n",
			"- Safe W15: `", row["W15SafeClassification"], "` - ", row["W15SafeReason"], "\n"
		]] /@ rows,
		"\n\n"
	]
]

runRealDomainAudit[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}], output = FileNameJoin[{resultRoot, "W15", "real-domain-audit.wl"}]},
	With[{rows = Select[Get[FileNameJoin[{methodRoot, "wrong-audit-evidence.wl"}]], MemberQ[{"wrong-derivative", "different-constant"}, #["Classification"]]&], completed = readCompleted[output]},
		If[ Length[rows] =!= 44,
			Print["Expected 44 real-domain rows, found ", Length[rows]];
			Exit[3]
		];
		Print["Real-domain audit pending=", Count[rows, row_ /; ! TrueQ[completed[row["key"]]]]];
		Scan[
			Function[row,
				If[ ! TrueQ[completed[row["key"]]],
					Print["Real-domain auditing ", row["key"]];
					appendRow[output, realDomainRow[row]];
					ClearSystemCache[]
				]
			],
			rows
		];
		With[{audited = ReadList[output, Expression]},
			Export[FileNameJoin[{methodRoot, "real-domain-audit.md"}], realDomainMarkdown[audited], "Text"];
			Print["Real-domain audit complete: ", Counts[#["DomainClassification"]& /@ audited]]
		]
	]
]

runRealDomainArguments[_, resultRoot_String] := runRealDomainAudit[resultRoot]

runRealDomainArguments[___] := (
	Print["Real-domain audit arguments: RESULT_ROOT"];
	Exit[2]
)

If[ ExpandFileName[$InputFileName] === ExpandFileName[First[$ScriptCommandLine]],
	MemoryConstrained[
		runRealDomainArguments @@ $ScriptCommandLine,
		4 * 1024^3,
		Print["Real-domain audit memory limit exceeded"];
		Exit[12]
	]
]
