#!/usr/bin/env wolframscript
(* Rerun affected Rubi rule files and compare every row with the saved baseline.
   Usage: wolframscript -file tools/baseline/SectionRegression.wls RESULT_ROOT LABEL *)

$HistoryLength = 0
$LoadShowSteps = False
$LoadElementaryFunctionRules = True

Get[FileNameJoin[{Directory[], "tools", "baseline", "Baseline.wl"}]]
Get[FileNameJoin[{Directory[], "Rubi", "Rubi.m"}]]

inputFormString[expression_] := ToString[InputForm[expression], PageWidth -> Infinity]

appendRow[output_String, row_Association] := With[{stream = OpenAppend[output]},
	WriteString[stream, inputFormString[row] <> "\n"];
	Close[stream]
]

readCompleted[output_String] /; ! FileExistsQ[output] := <||>
readCompleted[output_String] := Association[#["key"] -> True& /@ ReadList[output, Expression]]

readRecords[section_String, file_String] := Block[{Global`Int = Baseline`BaselineReferenceInt, Rubi`Int = Baseline`BaselineReferenceInt},
	DeleteCases[ReadList[FileNameJoin[{Directory[], "tests", "MathematicaSyntaxTestSuite", section, file}], Expression], Null]
]

fileList = {
	{"1 Algebraic functions", "1.1 Binomial products/1.1.1 Linear/1.1.1.2 (a+b x)^m (c+d x)^n.m"},
	{"1 Algebraic functions", "1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m"},
	{"1 Algebraic functions", "1.1 Binomial products/1.1.3 General/1.1.3.2 (c x)^m (a+b x^n)^p.m"},
	{"1 Algebraic functions", "1.2 Trinomial products/1.2.2 Quartic/1.2.2.1 (a+b x^2+c x^4)^p.m"},
	{"1 Algebraic functions", "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"},
	{"7 Inverse hyperbolic functions", "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m"},
	{"1 Algebraic functions", "1.1 Binomial products/1.1.1 Linear/1.1.1.7 P(x) (a+b x)^m (c+d x)^n (e+f x)^p (g+h x)^q.m"},
	{"9 Miscellaneous", "9.3 Miscellaneous integration rules.m"},
	{"1 Algebraic functions", "1.4 Miscellaneous/1.4.1 Algebraic function simplification.m"}
}

essentialRows[rows_List] := <|"key" -> #["key"], "outcome" -> #["outcome"], "grade" -> #["grade"], "gradeReason" -> Lookup[#, "gradeReason", ""], "verificationMethod" -> Lookup[#, "verificationMethod", ""]|>& /@ rows

baselineRows[resultRoot_String, section_String, file_String] := With[{methodRoot = FileNameJoin[{resultRoot, "Rubi"}], inventory = Get[FileNameJoin[{Directory[], "tests", "Abbasi", "generated", "native-inventory.wl"}]]},
	With[{sections = #["section"]& /@ inventory["files"]},
		With[{
			base = Catenate[Select[ReadList[#, Expression], #["section"] === section && #["file"] === file&]& /@ Sort[FileNames["shard-*.wl", methodRoot]]],
			legacyRepairs = If[FileNames["verification-repair-shard-*.wl", methodRoot] === {}, {}, Catenate[Select[ReadList[#, Expression], #["section"] === section && #["file"] === file&]& /@ Sort[FileNames["verification-repair-shard-*.wl", methodRoot]]]],
			repairs = If[FileNames["verification-repair-deterministic-shard-*.wl", methodRoot] === {}, {}, Catenate[Select[ReadList[#, Expression], #["section"] === section && #["file"] === file&]& /@ Sort[FileNames["verification-repair-deterministic-shard-*.wl", methodRoot]]]]
		},
			Print["Base count: ", Length[base], "; legacy repair count: ", Length[legacyRepairs], "; deterministic repair count: ", Length[repairs]];
			With[{canonicalBase = Baseline`BaselineCanonicalRow[#, sections]& /@ base, canonicalLegacy = Baseline`BaselineCanonicalRow[#, sections]& /@ legacyRepairs, canonicalRepairs = Baseline`BaselineCanonicalRow[#, sections]& /@ repairs},
				Print["Canonical row counts: ", Length[canonicalBase], " base, ", Length[canonicalLegacy], " legacy repairs, ", Length[canonicalRepairs], " deterministic repairs"];
				Join[Association[#["key"] -> #& /@ essentialRows[canonicalBase]], Association[#["key"] -> #& /@ essentialRows[canonicalLegacy]], Association[#["key"] -> #& /@ essentialRows[canonicalRepairs]]]
			]
		]
	]
]

fileOutput[resultRoot_String, label_String, section_String, file_String] := FileNameJoin[{resultRoot, "Rubi", "regressions", label, StringReplace[file, "/" -> "_"] <> ".wl"}]

memoryFailureRow[section_String, file_String, index_Integer, record_List] := With[{optimal = Baseline`BaselineOptimalAnswer[record]},
	<|
		"key" -> section <> "/" <> file <> "/" <> ToString[index],
		"section" -> section,
		"file" -> file,
		"index" -> index,
		"method" -> "Rubi",
		"answerSize" -> Missing["MemoryLimit"],
		"optimalSize" -> LeafCount[optimal],
		"integrationTime" -> Missing["MemoryLimit"],
		"correct" -> Indeterminate,
		"verificationTime" -> 0.,
		"verificationMethod" -> "not-applicable",
		"numericScales" -> "{}",
		"grade" -> "F",
		"outcome" -> "memory",
		"expressionType" -> Baseline`BaselineFunctionType[optimal],
		"answerType" -> Missing["MemoryLimit"],
		"gradeReason" -> "per-row 6 GiB regression memory limit",
		"workerMemoryLimitBytes" -> 6 * 1024^3,
		"answer" -> Missing["NotStored"]
	|>
]

resourceBoundQ[row_Association] := row["outcome"] === "memory" || (row["outcome"] === "unverified" && row["verificationMethod"] === "verification-timeout")
resourceBoundQ[_] = False

carriedForwardRow[key_String, before_Association] := <|
	"key" -> key,
	"outcome" -> before["outcome"],
	"grade" -> before["grade"],
	"gradeReason" -> "baseline resource-bound outcome carried forward for section comparison",
	"verificationMethod" -> before["verificationMethod"],
	"carriedForward" -> True
|>

runFile[resultRoot_String, label_String, section_String, file_String, before_Association] := With[{output = fileOutput[resultRoot, label, section, file]},
	CreateDirectory[DirectoryName[output], CreateIntermediateDirectories -> True];
	With[{completed = readCompleted[output]},
		MapIndexed[
			Function[{record, position},
				With[{index = First[position], key = section <> "/" <> file <> "/" <> ToString[First[position]]},
					If[ ! TrueQ[completed[key]],
						If[ resourceBoundQ[before[key]],
							appendRow[output, carriedForwardRow[key, before[key]]],
							appendRow[output, MemoryConstrained[Baseline`BaselineRunRecord[Baseline`RubiMethod, section, file, index, record], 6 * 1024^3, memoryFailureRow[section, file, index, record]]]
						];
						ClearSystemCache[]
					]
				]
			],
			readRecords[section, file]
		]
	]
]

failureQ[row_Association] := row["outcome"] === "wrong" || row["outcome"] === "unverified" || row["outcome"] === "timeout" || row["outcome"] === "memory" || row["outcome"] === "error" || row["outcome"] === "unresolved"

acceptedQ[row_Association] := MemberQ[{"A", "B", "C"}, row["grade"]]

compareFile[before_Association, section_String, file_String, resultRoot_String, label_String] := With[{after = ReadList[fileOutput[resultRoot, label, section, file], Expression], beforeSubset = Lookup[before, section <> "/" <> file <> "/" <> ToString[#], <||>]& /@ Range[Length[ReadList[fileOutput[resultRoot, label, section, file], Expression]]]},
	With[{
		newWrong = Select[after, Function[row, row["outcome"] === "wrong" && before[row["key"]]["outcome"] =!= "wrong"]],
		newFailures = Select[after, Function[row, failureQ[row] && ! failureQ[before[row["key"]]]]],
		changedRows = Select[after, Function[row, before[row["key"]]["outcome"] =!= row["outcome"] || before[row["key"]]["grade"] =!= row["grade"]]]
	},
		<|
			"section" -> section,
			"file" -> file,
			"rows" -> Length[after],
			"carriedForwardResourceRows" -> Count[after, row_ /; TrueQ[row["carriedForward"]]],
			"beforeOutcomes" -> Counts[Lookup[#, "outcome", Missing["NotAvailable"]]& /@ beforeSubset],
			"afterOutcomes" -> Counts[#["outcome"]& /@ after],
			"beforeAccepted" -> Count[beforeSubset, row_ /; acceptedQ[row]],
			"afterAccepted" -> Count[after, row_ /; acceptedQ[row]],
			"beforeFailing" -> Count[beforeSubset, row_ /; failureQ[row]],
			"afterFailing" -> Count[after, row_ /; failureQ[row]],
			"beforeWrong" -> Count[beforeSubset, row_ /; row["outcome"] === "wrong"],
			"afterWrong" -> Count[after, row_ /; row["outcome"] === "wrong"],
			"newWrong" -> Length[newWrong],
			"newFailures" -> Length[newFailures],
			"newWrongKeys" -> (#["key"]& /@ newWrong),
			"newFailureKeys" -> (#["key"]& /@ newFailures),
			"changedRows" -> ((<|"key" -> #["key"], "beforeOutcome" -> before[#["key"]]["outcome"], "afterOutcome" -> #["outcome"], "beforeGrade" -> before[#["key"]]["grade"], "afterGrade" -> #["grade"]|>)& /@ changedRows)
		|>
	]
]

comparisonMarkdown[comparisons_List] := StringJoin[
	"# Rubi rule-fix section regression\n\n",
	"Total new wrong: ", ToString[Total[#["newWrong"]& /@ comparisons]], "; total new failures: ", ToString[Total[#["newFailures"]& /@ comparisons]], "\n\n",
	StringRiffle[
		Function[row, StringJoin[
			"## ", row["section"], "/", row["file"], "\n\n",
			"- Rows: ", ToString[row["rows"]], "\n",
			"- Baseline resource-bound rows carried forward: ", ToString[row["carriedForwardResourceRows"]], "\n",
			"- Before outcomes: `", inputFormString[row["beforeOutcomes"]], "`\n",
			"- After outcomes: `", inputFormString[row["afterOutcomes"]], "`\n",
			"- Accepted: `", ToString[row["beforeAccepted"]], "` -> `", ToString[row["afterAccepted"]], "`\n",
			"- Failing: `", ToString[row["beforeFailing"]], "` -> `", ToString[row["afterFailing"]], "`\n",
			"- Wrong: `", ToString[row["beforeWrong"]], "` -> `", ToString[row["afterWrong"]], "`\n",
			"- New wrong: `", ToString[row["newWrong"]], "`; new failures: `", ToString[row["newFailures"]], "`\n",
			"- New wrong keys: `", inputFormString[row["newWrongKeys"]], "`\n",
			"- New failure keys: `", inputFormString[row["newFailureKeys"]], "`\n",
			"- Changed rows: `", inputFormString[row["changedRows"]], "`\n"
		]] /@ comparisons,
		"\n\n"
	]
]

comparisonOutput[resultRoot_String, label_String, section_String, file_String] := FileNameJoin[{resultRoot, "Rubi", "regressions", label, "comparison-" <> StringReplace[file, "/" -> "_"] <> ".wl"}]

runOneFile[resultRoot_String, label_String, index_Integer] /; 1 <= index <= Length[fileList] := With[{section = fileList[[index, 1]], file = fileList[[index, 2]]},
	With[{before = baselineRows[resultRoot, section, file]},
		Print["Baseline rows loaded for ", section, "/", file, ": ", Length[before]];
		runFile[resultRoot, label, section, file, before];
		Print["Integration file finished"];
		With[{comparison = compareFile[before, section, file, resultRoot, label]},
			Put[comparison, comparisonOutput[resultRoot, label, section, file]];
			Print[comparison];
			If[ comparison["newWrong"] + comparison["newFailures"] > 0, Exit[10]]
		]
	]
]

writeSummary[resultRoot_String, label_String] := With[{comparisons = Get[comparisonOutput[resultRoot, label, #[[1]], #[[2]]]]& /@ fileList},
	Put[comparisons, FileNameJoin[{resultRoot, "Rubi", "regressions", label, "summary.wl"}]];
	Export[FileNameJoin[{resultRoot, "Rubi", "regressions", label, "summary.md"}], comparisonMarkdown[comparisons], "Text"];
	Print["New wrong: ", Total[#["newWrong"]& /@ comparisons], "; new failures: ", Total[#["newFailures"]& /@ comparisons]];
	If[ Total[#["newWrong"] + #["newFailures"]& /@ comparisons] > 0, Exit[10]]
]

runRegressionArguments[_, resultRoot_String, label_String, "compare"] := writeSummary[resultRoot, label]

runRegressionArguments[_, resultRoot_String, label_String, index_String] := With[{position = ToExpression[index]},
	If[ IntegerQ[position] && 1 <= position <= Length[fileList],
		runOneFile[resultRoot, label, position],
		Print["Section regression file index must be between 1 and ", Length[fileList]];
		Exit[2]
	]
]

runRegressionArguments[___] := (
	Print["Section regression arguments: RESULT_ROOT LABEL FILE_INDEX|compare"];
	Exit[2]
)

MemoryConstrained[
	runRegressionArguments @@ $ScriptCommandLine,
	8 * 1024^3,
	Print["Section regression memory limit exceeded"];
	Exit[12]
]
