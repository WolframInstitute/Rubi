#!/usr/bin/env wolframscript
(* Check the two shared W15/Rubi secant failures against the suite optimum and branch-safe real samples.
   Usage: wolframscript -file tools/baseline/SecantBranchCheck.wls RESULT_ROOT *)

$HistoryLength = 0

Get[FileNameJoin[{Directory[], "tools", "baseline", "AuditWrongAnswers.wls"}]]

safeX = Range[-19, 19, 2] / 20

safeSamplePoint[attempt_Integer] := With[{index = If[attempt <= 10, attempt, attempt - 6], xValue = safeX[[If[attempt <= 10, attempt, attempt - 6]]]},
	<|
		"Variable" -> xValue,
		"Rules" -> {x -> xValue, e -> 0, f -> 1, a -> 2, b -> 1, c -> 1, n -> 1/2, p -> 1/3}
	|>
]

safeAudit[row_Association, answerText_String] := Block[{samplePoint},
	samplePoint[_, _, _, attempt_Integer] := safeSamplePoint[attempt];
	auditRow[Join[row, <|"answer" -> answerText|>]]
]

branchRow[row_Association] := Module[{originalOptimal, optimalSafe, w15Safe, rubiSafe},
	originalOptimal = auditRow[Join[row, <|"answer" -> row["optimal"]|>]];
	optimalSafe = safeAudit[row, row["optimal"]];
	w15Safe = safeAudit[row, row["answer"]];
	rubiSafe = safeAudit[row, row["RubiAnswer"]];
	Join[
		row,
		<|
			"OptimalOriginalClassification" -> originalOptimal["Classification"],
			"OptimalSafeClassification" -> optimalSafe["Classification"],
			"W15SafeClassification" -> w15Safe["Classification"],
			"RubiSafeClassification" -> rubiSafe["Classification"],
			"OptimalSafeReason" -> optimalSafe["Reason"],
			"W15SafeReason" -> w15Safe["Reason"],
			"RubiSafeReason" -> rubiSafe["Reason"],
			"OptimalSafeSamples" -> optimalSafe["Samples"],
			"W15SafeSamples" -> w15Safe["Samples"],
			"RubiSafeSamples" -> rubiSafe["Samples"]
		|>
	]
]

branchMarkdown[rows_List] := StringJoin[
	"# Secant branch-cut check\n\n",
	"Safe real samples use |x| < 1, e=0, f=1, a=2, b=c=1, n=1/2 and p=1/3, so Sec[x] > 0 and a + b (c Sec[x])^n > 0.\n\n",
	StringRiffle[
		Function[row, StringJoin[
			"## ", row["key"], "\n\n",
			"- Optimal, original samples: `", row["OptimalOriginalClassification"], "`\n",
			"- Optimal, safe samples: `", row["OptimalSafeClassification"], "` -", row["OptimalSafeReason"], "\n",
			"- W15, safe samples: `", row["W15SafeClassification"], "` -", row["W15SafeReason"], "\n",
			"- Rubi, safe samples: `", row["RubiSafeClassification"], "` -", row["RubiSafeReason"], "\n"
		]] /@ rows,
		"\n\n"
	]
]

runBranchCheck[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}], output = FileNameJoin[{resultRoot, "W15", "secant-branch-check.wl"}]},
	With[{rows = Select[ReadList[FileNameJoin[{methodRoot, "wrong-rubi-comparison.wl"}], Expression], StringContainsQ[#["key"], "4.5.7"] && MemberQ[{464, 465}, #["index"]]&], completed = readCompleted[output]},
		If[ Length[rows] =!= 2,
			Print["Expected secant rows 464 and 465, found ", Length[rows]];
			Exit[3]
		];
		Scan[
			Function[row,
				If[ ! TrueQ[completed[row["key"]]],
					Print["Branch-checking ", row["key"]];
					appendRow[output, branchRow[row]];
					ClearSystemCache[]
				]
			],
			rows
		];
		With[{checked = ReadList[output, Expression]},
			Export[FileNameJoin[{methodRoot, "secant-branch-check.md"}], branchMarkdown[checked], "Text"];
			Print[<|"Key" -> #["key"], "OptimalOriginal" -> #["OptimalOriginalClassification"], "OptimalSafe" -> #["OptimalSafeClassification"], "W15Safe" -> #["W15SafeClassification"], "RubiSafe" -> #["RubiSafeClassification"]|>& /@ checked]
		]
	]
]

runBranchArguments[_, resultRoot_String] := runBranchCheck[resultRoot]

runBranchArguments[___] := (
	Print["Secant branch-check arguments: RESULT_ROOT"];
	Exit[2]
)

MemoryConstrained[
	runBranchArguments @@ $ScriptCommandLine,
	4 * 1024^3,
	Print["Secant branch-check memory limit exceeded"];
	Exit[12]
]
