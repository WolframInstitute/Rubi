#!/usr/bin/env wolframscript
(* Usage: wolframscript -file tools/baseline/Aggregate.wls RESULT_ROOT METHOD *)

inputFormString::usage = "inputFormString[expression] gives one unwrapped InputForm string for audit storage."

inputFormString[expression_] := ToString[InputForm[expression], PageWidth -> Infinity]

fileKey::usage = "fileKey[row] gives the section and section-relative file identity of a result row."

fileKey[row_Association] := row["section"] <> "/" <> row["file"]

readRows::usage = "readRows[files] reads and validates association rows from a list of shard files."

readRows[files_List] := With[{rows = Catenate[ReadList[#, Expression]& /@ files]},
	If[ rows === {} || ! AllTrue[rows, AssociationQ],
		Print["No valid result rows"];
		Exit[3]
	];
	rows
]

requireUniqueRows::usage = "requireUniqueRows[rows, label] stops aggregation when a base or repair collection contains duplicate stable keys."

requireUniqueRows[rows_List, label_String] := With[{keys = #["key"]& /@ rows},
	If[ ! DuplicateFreeQ[keys],
		Print["DUPLICATE ", label, " RESULT KEYS: ", Length[keys] - Length[DeleteDuplicates[keys]]];
		Exit[4]
	];
	rows
]

mergeRepairRows::usage = "mergeRepairRows[baseRows, repairRows, sections] canonicalizes legacy keys and overlays verifier-only repairs without modifying raw rows."

mergeRepairRows[baseRows_List, repairRows_List, sections_List] := With[{canonicalBase = Baseline`BaselineCanonicalRow[#, sections]& /@ baseRows, canonicalRepairs = Baseline`BaselineCanonicalRow[#, sections]& /@ repairRows},
	requireUniqueRows[canonicalBase, "BASE"];
	requireUniqueRows[canonicalRepairs, "REPAIR"];
	With[{baseKeys = #["key"]& /@ canonicalBase, repairKeys = #["key"]& /@ canonicalRepairs},
		If[ ! SubsetQ[baseKeys, repairKeys],
			Print["REPAIR ROWS WITH UNKNOWN KEYS: ", Complement[repairKeys, baseKeys]];
			Exit[5]
		];
		Values[Join[Association[#["key"] -> #& /@ canonicalBase], Association[#["key"] -> #& /@ canonicalRepairs]]]
	]
]

numericTimes::usage = "numericTimes[rows] gives mean, median, 95th-percentile and total integration time for numeric timings."

numericTimes[rows_List] := With[{times = Select[#["integrationTime"]& /@ rows, NumberQ]},
	If[ times === {},
		<|"mean" -> 0., "median" -> 0., "p95" -> 0., "total" -> 0.|>,
		<|"mean" -> N[Mean[times]], "median" -> N[Median[times]], "p95" -> N[Quantile[times, 0.95]], "total" -> N[Total[times]]|>
	]
]

summarize::usage = "summarize[label, rows] gives counts, grades, outcomes, verification methods and timings for one section."

summarize[label_String, rows_List] := With[{count = Length[rows], grades = Counts[#["grade"]& /@ rows], outcomes = Counts[#["outcome"]& /@ rows], verification = Counts[#["verificationMethod"]& /@ rows]},
	Join[
		<|
			"section" -> label,
			"problems" -> count,
			"A" -> Lookup[grades, "A", 0],
			"B" -> Lookup[grades, "B", 0],
			"C" -> Lookup[grades, "C", 0],
			"F" -> Lookup[grades, "F", 0] - Lookup[outcomes, "unverified", 0],
			"unverified" -> Lookup[outcomes, "unverified", 0],
			"FIncludingUnverified" -> Lookup[grades, "F", 0],
			"APercent" -> N[100 * Lookup[grades, "A", 0] / count],
			"FPercent" -> N[100 * (Lookup[grades, "F", 0] - Lookup[outcomes, "unverified", 0]) / count],
			"solved" -> Lookup[outcomes, "solved", 0],
			"wrong" -> Lookup[outcomes, "wrong", 0],
			"unresolved" -> Lookup[outcomes, "unresolved", 0],
			"timeout" -> Lookup[outcomes, "timeout", 0],
			"memory" -> Lookup[outcomes, "memory", 0],
			"error" -> Lookup[outcomes, "error", 0],
			"expectedUnresolved" -> Lookup[outcomes, "expected-unresolved", 0],
			"symbolicVerified" -> Total[Lookup[verification, #, 0]& /@ {"exact", "Simplify", "FullSimplify", "PossibleZeroQ", "reference-unevaluated"}],
			"numericVerified" -> Lookup[verification, "numeric", 0]
		|>
		,
		numericTimes[rows]
	]
]

validateCoverage::usage = "validateCoverage[rows, inventory] checks exact per-file index sets, unexpected files and total row count."

validateCoverage[rows_List, inventory_Association] := With[{expected = Association[fileKey[#] -> #["records"]& /@ inventory["files"]]},
	With[{actual = Counts[fileKey[#]& /@ rows], actualIndices = GroupBy[rows, fileKey, Function[subset, Sort[#["index"]& /@ subset]]]},
		With[{
			fileStatus = KeyValueMap[
				Function[{key, expectedCount}, <|"file" -> key, "expected" -> expectedCount, "actual" -> Lookup[actual, key, 0], "indicesValid" -> (Lookup[actualIndices, key, {}] === Range[expectedCount])|>],
				expected
			]
		},
			<|
				"badFiles" -> Select[fileStatus, ! #["indicesValid"]&],
				"unexpectedFiles" -> Complement[Keys[actual], Keys[expected]],
				"complete" -> (Select[fileStatus, ! #["indicesValid"]&] === {} && Complement[Keys[actual], Keys[expected]] === {} && Length[rows] == Total[Values[expected]])
			|>
		]
	]
]

tableLine::usage = "tableLine[summary] formats one section summary as a tab-separated report row."

tableLine[summary_Association] := StringRiffle[
	ToString /@ {
		summary["section"],
		summary["problems"],
		summary["A"],
		summary["B"],
		summary["C"],
		summary["F"],
		summary["unverified"],
		NumberForm[summary["APercent"], {5, 2}],
		NumberForm[summary["FPercent"], {5, 2}],
		summary["solved"],
		summary["wrong"],
		summary["unresolved"],
		summary["timeout"],
		NumberForm[summary["mean"], {6, 3}],
		NumberForm[summary["total"], {9, 1}]
	}
	,
	"\t"
]

recordIntegrand::usage = "recordIntegrand[record] gives the integrand of a corpus record without positional extraction."

recordIntegrand[{integrand_, ___}] := integrand

recordVariable::usage = "recordVariable[record] gives the integration variable of a corpus record without positional extraction."

recordVariable[{_, variable_, ___}] := variable

corpusPath::usage = "corpusPath[root, section, file] resolves a stable corpus identity to its original or generated source file."

corpusPath[root_String, "Blake", file_String] := FileNameJoin[{root, "tests", "Abbasi", "generated", file}]

corpusPath[root_String, "BlakeRational", file_String] := FileNameJoin[{root, "tests", "Abbasi", "originals", file}]

corpusPath[root_String, "Hebisch", file_String] := FileNameJoin[{root, "tests", "Abbasi", "generated", file}]

corpusPath[root_String, section_String, file_String] := FileNameJoin[{root, "tests", "MathematicaSyntaxTestSuite", section, file}]

corpusFormat::usage = "corpusFormat[section] identifies whether a section is read as native records or an added list."

corpusFormat["Blake"] = AddedRecords

corpusFormat["BlakeRational"] = AddedRecords

corpusFormat["Hebisch"] = AddedRecords

corpusFormat[_] = NativeRecords

readRecords::usage = "readRecords[format, path] reads corpus records while keeping every reference integral inert."

readRecords[NativeRecords, path_String] := Block[{Global`Int = Baseline`BaselineReferenceInt, Rubi`Int = Baseline`BaselineReferenceInt},
	DeleteCases[ReadList[path, Expression], Null]
]

readRecords[AddedRecords, path_String] := Block[{Global`Int = Baseline`BaselineReferenceInt, Rubi`Int = Baseline`BaselineReferenceInt},
	Get[path]
]

entryEvidence::usage = "entryEvidence[root, entry, neededFiles, neededKeys] reconstructs source evidence for audit rows from one corpus file."

entryEvidence[_String, entry_Association, neededFiles_Association, _Association] /; ! TrueQ[neededFiles[fileKey[entry]]] := {}

entryEvidence[root_String, entry_Association, _Association, neededKeys_Association] := With[{records = readRecords[corpusFormat[entry["section"]], corpusPath[root, entry["section"], entry["file"]]]},
	Catenate[MapIndexed[
		Function[{record, indexPosition},
			With[{index = First[indexPosition]},
				With[{key = entry["section"] <> "/" <> entry["file"] <> "/" <> ToString[index]},
					If[ TrueQ[neededKeys[key]],
						{key -> <|"integrand" -> inputFormString[recordIntegrand[record]], "variable" -> inputFormString[recordVariable[record]], "optimal" -> inputFormString[Baseline`BaselineOptimalAnswer[record]]|>},
						{}
					]
				]
			]
		]
		,
		records
	]]
]

auditEvidence::usage = "auditEvidence[root, inventory, auditRows] reconstructs integrands, variables and optimal answers only for rows needing an audit."

auditEvidence[_String, _Association, {}] := <||>

auditEvidence[root_String, inventory_Association, auditRows_List] := With[{neededKeys = Association[#["key"] -> True& /@ auditRows], neededFiles = Association[fileKey[#] -> True& /@ auditRows]},
	Association[Catenate[entryEvidence[root, #, neededFiles, neededKeys]& /@ inventory["files"]]]
]

auditOutcomeQ::usage = "auditOutcomeQ[outcome] tests whether an outcome requires wrong-answer or undecided-verification evidence."

auditOutcomeQ["wrong"] = True

auditOutcomeQ["unverified"] = True

auditOutcomeQ[_] = False

aggregate::usage = "aggregate[resultRoot, method] validates, repairs, summarizes and exports one completed baseline method."

aggregate[resultRoot_String, method_String] := With[{root = Directory[], methodRoot = FileNameJoin[{resultRoot, method}]},
	With[{
		baseRows = readRows[Sort[FileNames["shard-*.wl", methodRoot]]],
		legacyRepairRows = If[FileNames["verification-repair-shard-*.wl", methodRoot] === {}, {}, readRows[Sort[FileNames["verification-repair-shard-*.wl", methodRoot]]]],
		deterministicRepairRows = If[FileNames["verification-repair-deterministic-shard-*.wl", methodRoot] === {}, {}, readRows[Sort[FileNames["verification-repair-deterministic-shard-*.wl", methodRoot]]]],
		inventory = Get[FileNameJoin[{root, "tests", "Abbasi", "generated", "native-inventory.wl"}]]
	},
		With[{rows = mergeRepairRows[mergeRepairRows[baseRows, legacyRepairRows, #["section"]& /@ inventory["files"]], deterministicRepairRows, #["section"]& /@ inventory["files"]]},
			With[{auditRows = Select[rows, auditOutcomeQ[#["outcome"]]&]},
				With[{coverage = validateCoverage[rows, inventory], summary = Prepend[KeyValueMap[summarize, Sort[GroupBy[rows, #["section"]&]]], summarize["ALL", rows]]},
					With[{
						tableLines = Prepend[
							Prepend[tableLine /@ summary, StringRiffle[{"section", "N", "A", "B", "C", "F", "unverified", "A%", "F%", "solved", "wrong", "unresolved", "timeout", "mean_s", "total_s"}, "\t"]],
							"# F excludes unverified; raw rows retain conservative F grades. Per-worker cgroup memory limit: 5 GiB; per-problem MemoryConstrained limit: 4 GiB; single OOMs retried without grading"
						]
						,
						found = auditEvidence[root, inventory, auditRows]
					},
						With[{auditReport = Join[#, Lookup[found, #["key"], <|"integrand" -> "NOT FOUND", "optimal" -> "NOT FOUND"|>]]& /@ auditRows},
							Put[
								<|
									"method" -> method,
									"workerCgroupMemoryLimitBytes" -> 5 * 1024^3,
									"memoryLimitBytes" -> 4 * 1024^3,
									"complete" -> coverage["complete"],
									"rows" -> Length[rows],
									"repairRows" -> Length[legacyRepairRows] + Length[deterministicRepairRows],
									"legacyRepairRows" -> Length[legacyRepairRows],
									"deterministicRepairRows" -> Length[deterministicRepairRows],
									"expectedRows" -> Total[#["records"]& /@ inventory["files"]],
									"badFiles" -> coverage["badFiles"],
									"unexpectedFiles" -> coverage["unexpectedFiles"],
									"sections" -> summary
								|>
								,
								FileNameJoin[{methodRoot, "summary.wl"}]
							];
							Export[FileNameJoin[{methodRoot, "summary.json"}], summary, "JSON"];
							Export[FileNameJoin[{methodRoot, "section-table.tsv"}], StringRiffle[tableLines, "\n"] <> "\n", "Text"];
							Put[auditReport, FileNameJoin[{methodRoot, "wrong-and-unverified.wl"}]];
							With[{wrongRows = Select[auditReport, #["outcome"] === "wrong"&]},
								Put[wrongRows, FileNameJoin[{methodRoot, "wrong.wl"}]];
								Export[FileNameJoin[{methodRoot, "wrong-keys.txt"}], StringRiffle[#["key"]& /@ wrongRows, "\n"] <> "\n", "Text"]
							];
							Print[StringRiffle[tableLines, "\n"]];
							Print["Audit rows: ", Length[auditReport], "; wrong: ", Count[#["outcome"]& /@ auditRows, "wrong"], "; unverified: ", Count[#["outcome"]& /@ auditRows, "unverified"]];
							Print["Verification repairs: ", Length[legacyRepairRows] + Length[deterministicRepairRows], " (legacy=", Length[legacyRepairRows], ", deterministic=", Length[deterministicRepairRows], ")"];
							Print["Complete: ", coverage["complete"], "; rows: ", Length[rows], "/", Total[#["records"]& /@ inventory["files"]], "; files with wrong counts: ", Length[coverage["badFiles"]]];
							If[! coverage["complete"], Exit[10]]
						]
					]
				]
			]
		]
	]
]

aggregateArguments::usage = "aggregateArguments[script, resultRoot, method] parses the aggregator command line."

aggregateArguments[_, resultRoot_String, method_String] := aggregate[resultRoot, method]

aggregateArguments[___] := (
	Print["Aggregate arguments: RESULT_ROOT METHOD"];
	Exit[2]
)

Get[FileNameJoin[{Directory[], "tools", "baseline", "Baseline.wl"}]]

MemoryConstrained[
	aggregateArguments @@ $ScriptCommandLine
	,
	4 * 1024^3
	,
	Print["Aggregation memory limit exceeded"];
	Exit[12]
]
