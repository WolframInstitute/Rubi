#!/usr/bin/env wolframscript
(* Read-only corpus inventory. Run from the repository root with W15. *)

recordIntegrand::usage = "recordIntegrand[record] gives the integrand of a corpus record without positional extraction."

recordIntegrand[{integrand_, ___}] := integrand

recordVariable::usage = "recordVariable[record] gives the integration variable of a corpus record without positional extraction."

recordVariable[{_, variable_, ___}] := variable

optimalAnswer::usage = "optimalAnswer[record] gives the reference answer, choosing the smaller alternative in a five-field native record."

optimalAnswer[{_, _, optimal_}] := optimal

optimalAnswer[{_, _, _, optimal_}] := optimal

optimalAnswer[{_, _, _, optimal_, alternativeOptimal_}] := First[MinimalBy[{optimal, alternativeOptimal}, LeafCount]]

nativeRecordQ::usage = "nativeRecordQ[record] tests the four- or five-field native corpus record shape."

nativeRecordQ[record_List] := Replace[Length[record], {(4 | 5) -> True, _ -> False}]

nativeRecordQ[_] = False

addedRecordQ::usage = "addedRecordQ[record] tests the three- or four-field added corpus record shape."

addedRecordQ[record_List] := Replace[Length[record], {(3 | 4) -> True, _ -> False}]

addedRecordQ[_] = False

recordStatistics::usage = "recordStatistics[records] gives aggregate leaf counts and integration variables for validated records."

recordStatistics[records_List] := <|
	"records" -> Length[records],
	"recordLengths" -> Union[Length /@ records],
	"integrandLeaves" -> Total[LeafCount[recordIntegrand[#]]& /@ records],
	"optimalLeaves" -> Total[LeafCount[optimalAnswer[#]]& /@ records],
	"variables" -> Union[ToString[InputForm[recordVariable[#]]]& /@ records]
|>

nativeEntry::usage = "nativeEntry[nativeRoot, path] validates and inventories one native corpus file."

nativeEntry[nativeRoot_String, path_String] := With[{records = DeleteCases[ReadList[path, Expression], Null]},
	With[{relative = StringDrop[path, StringLength[nativeRoot] + 1], lengths = Length /@ records},
		With[{section = First[FileNameSplit[relative]]},
			If[ records === {} || ! AllTrue[records, nativeRecordQ],
				Print["INVALID NATIVE FILE: ", relative, " lengths=", Tally[lengths]];
				Exit[2]
			];
			Join[<|"file" -> StringDrop[relative, StringLength[section] + 1], "section" -> section|>, recordStatistics[records]]
		]
	]
]

addedEntry::usage = "addedEntry[section, path] validates and inventories one Blake or Hebisch corpus file."

addedEntry[section_String, path_String] := With[{records = Get[path]},
	If[ ! ListQ[records] || records === {} || ! AllTrue[records, addedRecordQ],
		Print["INVALID ADDED RECORDS: ", path, " lengths=", Tally[Length /@ records]];
		Exit[3]
	];
	Join[<|"file" -> FileNameTake[path], "section" -> section|>, recordStatistics[records]]
]

buildInventory::usage = "buildInventory[root, output] reads every corpus file, validates its records and writes the aggregate inventory."

buildInventory[root_String, output_String] := With[{nativeRoot = FileNameJoin[{root, "tests", "MathematicaSyntaxTestSuite"}]},
	With[{nativeFiles = Sort[FileNames["*.m", nativeRoot, Infinity]]},
		Print["Reading ", Length[nativeFiles], " native files..."];
		With[{
			native = nativeEntry[nativeRoot, #]& /@ nativeFiles
			,
			added = {
				addedEntry["Blake", FileNameJoin[{root, "tests", "Abbasi", "generated", "Blake_Problems.m"}]],
				addedEntry["BlakeRational", FileNameJoin[{root, "tests", "Abbasi", "originals", "Blake_Integrate_Rational_Tests.txt"}]],
				addedEntry["Hebisch", FileNameJoin[{root, "tests", "Abbasi", "generated", "Hebisch_Problems.m"}]]
			}
		},
			With[{
				inventory = <|
					"wolframVersion" -> $Version,
					"nativeCommit" -> "32b79cedb8a5a80e82e6db9f67e9cdf88cf11217",
					"nativeFiles" -> Length[native],
					"nativeRecords" -> Total[#["records"]& /@ native],
					"addedRecords" -> Total[#["records"]& /@ added],
					"files" -> Join[native, added]
				|>
			},
				Put[inventory, output];
				Print["Native records: ", inventory["nativeRecords"]];
				Print["Added records: ", inventory["addedRecords"]];
				Print["Total records: ", inventory["nativeRecords"] + inventory["addedRecords"]];
				Print["Added counts: ", <|"section" -> #["section"], "records" -> #["records"], "recordLengths" -> #["recordLengths"]|>& /@ added];
				Print["Inventory written to ", output];
				inventory
			]
		]
	]
]

inventoryArguments::usage = "inventoryArguments[script, optionalOutput] selects the default or explicit inventory output path."

inventoryArguments[_] := FileNameJoin[{Directory[], "tests", "Abbasi", "generated", "native-inventory.wl"}]

inventoryArguments[_, output_String] := output

inventoryArguments[___] := (
	Print["Inventory arguments: [OUTPUT]"];
	Exit[2]
)

MemoryConstrained[
	buildInventory[Directory[], inventoryArguments @@ $ScriptCommandLine]
	,
	4 * 1024^3
	,
	Print["Inventory memory limit exceeded"];
	Exit[12]
]
