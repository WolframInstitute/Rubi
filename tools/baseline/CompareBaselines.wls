#!/usr/bin/env wolframscript
(* Produce the W15-versus-Rubi section comparison after both aggregations complete.
   Usage: wolframscript -file tools/baseline/CompareBaselines.wls RESULT_ROOT *)

sections[resultRoot_String, method_String] := Association[#["section"] -> #& /@ Get[FileNameJoin[{resultRoot, method, "summary.wl"}]]["sections"]]

percent[value_] := ToString[NumberForm[N[value], {5, 2}]]

comparisonRows[resultRoot_String] := With[{w15 = sections[resultRoot, "W15"], rubi = sections[resultRoot, "Rubi"]},
	If[ Keys[w15] =!= Keys[rubi],
		Print["W15 and Rubi section keys differ"];
		Exit[3]
	];
	Map[
		Function[section,
			With[{a = w15[section], b = rubi[section]},
				If[ a["problems"] =!= b["problems"],
					Print["Corpus size differs in ", section];
					Exit[4]
				];
				<|
					"section" -> section,
					"problems" -> a["problems"],
					"W15APercent" -> a["APercent"],
					"RubiAPercent" -> b["APercent"],
					"W15FPercent" -> a["FPercent"],
					"RubiFPercent" -> b["FPercent"],
					"W15Wrong" -> a["wrong"],
					"RubiWrong" -> b["wrong"],
					"W15Unverified" -> a["unverified"],
					"RubiUnverified" -> b["unverified"]
				|>
			]
		],
		Keys[w15]
	]
]

markdownTable[rows_List] := StringJoin[
	"# W15 versus Rubi on 85,842 integrals\n\n",
	"F excludes unverified rows in both methods.\n\n",
	"| section | N | W15 A% | Rubi A% | W15 F% | Rubi F% | W15 wrong | Rubi wrong | W15 unverified | Rubi unverified |\n",
	"| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |\n",
	StringRiffle[
		Function[row, StringJoin[
			"| ", row["section"], " | ", ToString[row["problems"]],
			" | ", percent[row["W15APercent"]], " | ", percent[row["RubiAPercent"]],
			" | ", percent[row["W15FPercent"]], " | ", percent[row["RubiFPercent"]],
			" | ", ToString[row["W15Wrong"]], " | ", ToString[row["RubiWrong"]],
			" | ", ToString[row["W15Unverified"]], " | ", ToString[row["RubiUnverified"]], " |"
		]] /@ rows,
		"\n"
	],
	"\n"
]

tsvTable[rows_List] := With[{lines = Prepend[
	Function[row, {
		row["section"], row["problems"], percent[row["W15APercent"]], percent[row["RubiAPercent"]], percent[row["W15FPercent"]], percent[row["RubiFPercent"]],
		row["W15Wrong"], row["RubiWrong"], row["W15Unverified"], row["RubiUnverified"]
	}] /@ rows,
	{"section", "N", "W15 A%", "Rubi A%", "W15 F%", "Rubi F%", "W15 wrong", "Rubi wrong", "W15 unverified", "Rubi unverified"}
]},
	StringRiffle[StringRiffle[ToString /@ #, "\t"]& /@ lines, "\n"] <> "\n"
]

runComparison[resultRoot_String] := With[{rows = comparisonRows[resultRoot]},
	Export[FileNameJoin[{resultRoot, "W15-vs-Rubi.md"}], markdownTable[rows], "Text"];
	Export[FileNameJoin[{resultRoot, "W15-vs-Rubi.tsv"}], tsvTable[rows], "Text"];
	Print[markdownTable[rows]]
]

runComparisonArguments[_, resultRoot_String] := runComparison[resultRoot]

runComparisonArguments[___] := (
	Print["Baseline comparison arguments: RESULT_ROOT"];
	Exit[2]
)

runComparisonArguments @@ $ScriptCommandLine
