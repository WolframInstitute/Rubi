#!/usr/bin/env wolframscript
(* Reverify stored numeric verdicts without rerunning integration.
   Usage: wolframscript -file tools/baseline/RepairVerification.wls RESULT_ROOT METHOD SHARD [VERIFICATION_SECONDS] *)

$HistoryLength = 0

inputFormString::usage = "inputFormString[expression] gives one unwrapped InputForm string for result storage."

inputFormString[expression_] := ToString[InputForm[expression], PageWidth -> Infinity]

fileKey::usage = "fileKey[row] gives the section and section-relative file identity of a result row."

fileKey[row_Association] := row["section"] <> "/" <> row["file"]

readCompleted::usage = "readCompleted[output, sections] reads stable keys from an existing verification-repair shard, canonicalizing legacy section names."

readCompleted[output_String, _List] /; ! FileExistsQ[output] := <||>

readCompleted[output_String, sections_List] := With[{rows = ReadList[output, Expression]},
	If[ ! AllTrue[rows, AssociationQ],
		Print["Malformed repair resume data in ", output];
		Exit[4]
	];
	With[{canonicalRows = Baseline`BaselineCanonicalRow[#, sections]& /@ rows},
		Association[#["key"] -> True& /@ canonicalRows]
	]
]

appendRepair::usage = "appendRepair[output, row] appends and closes one flushed verification-repair row."

appendRepair[output_String, row_Association] := With[{stream = OpenAppend[output]},
	WriteString[stream, inputFormString[row] <> "\n"];
	Close[stream]
]

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

recordIntegrand::usage = "recordIntegrand[record] gives the integrand of a corpus record without positional extraction."

recordIntegrand[{integrand_, ___}] := integrand

recordVariable::usage = "recordVariable[record] gives the integration variable of a corpus record without positional extraction."

recordVariable[{_, variable_, ___}] := variable

repairOutcomeFields::usage = "repairOutcomeFields[answer, optimal, checked] gives replacement grade and outcome fields after verifier-only repair."

repairOutcomeFields[answer_, optimal_, checked_Association] /; checked["Correct"] === True := With[{grade = Baseline`BaselineGradeAnswer[answer, optimal]},
	<|"grade" -> grade["Grade"], "outcome" -> "solved", "answerType" -> grade["AnswerType"], "expressionType" -> grade["OptimalType"], "gradeReason" -> grade["Reason"], "answer" -> Missing["NotStored"]|>
]

repairOutcomeFields[_, _, checked_Association] /; checked["Correct"] === False := <|
	"grade" -> "F",
	"outcome" -> "wrong",
	"gradeReason" -> "derivative differs from integrand at deterministic numeric samples (verification repair)"
|>

repairOutcomeFields[_, _, _Association] := <|"grade" -> "F", "outcome" -> "unverified", "gradeReason" -> "correctness remains undecided after numeric-filter repair"|>

repairRow::usage = "repairRow[row, record] re-verifies a stored answer and overlays only correctness-dependent fields on its original row."

repairRow[row_Association, _List] /; ! StringQ[row["answer"]] := Join[
	row,
	<|
		"correct" -> Indeterminate,
		"verificationTime" -> 0.,
		"verificationMethod" -> "not-stored",
		"numericScales" -> "{}",
		"grade" -> "F",
		"outcome" -> "unverified",
		"gradeReason" -> "no stored answer is available for deterministic verification",
		"verificationRepair" -> "numeric-filter-v2-no-stored-answer"
	|>
]

repairRow[row_Association, record_List] := With[{answer = ToExpression[row["answer"]], optimal = Baseline`BaselineOptimalAnswer[record]},
	With[{checked = Baseline`BaselineVerifyAnswer[recordIntegrand[record], answer, recordVariable[record], row["key"]]},
		Join[
			row
			,
			<|
				"correct" -> checked["Correct"],
				"verificationTime" -> checked["VerificationTime"],
				"verificationMethod" -> checked["Method"],
				"numericScales" -> inputFormString[N[checked["Samples"], 6]],
				"originalVerificationTime" -> row["verificationTime"],
				"originalVerificationMethod" -> row["verificationMethod"],
				"verificationTimeLimit" -> Baseline`$verificationTimeLimit,
				"verificationRepair" -> "numeric-filter-v2-utf8-sha256"
			|>
			,
			repairOutcomeFields[answer, optimal, checked]
		]
	]
]

repairMemoryRow::usage = "repairMemoryRow[row] preserves an answer as unverified when its verification repair exceeds the per-row memory bound."

repairMemoryRow[row_Association] := Join[
	row,
	<|
		"correct" -> Indeterminate,
		"verificationTime" -> 0.,
		"verificationMethod" -> "memory-limit",
		"numericScales" -> "{}",
		"grade" -> "F",
		"outcome" -> "unverified",
		"gradeReason" -> "verification repair exceeded 2 GiB",
		"verificationRepair" -> "numeric-filter-v2-utf8-sha256-memory-limit"
	|>
]

processEntry::usage = "processEntry[root, entry, needed, output] repairs all pending rows belonging to one corpus file."

processEntry[root_String, entry_Association, needed_Association, output_String] /; ! KeyExistsQ[needed, fileKey[entry]] = 0

processEntry[root_String, entry_Association, needed_Association, output_String] := With[{rows = needed[fileKey[entry]]},
	With[{records = readRecords[corpusFormat[entry["section"]], corpusPath[root, entry["section"], entry["file"]]]},
		With[{recordsByIndex = Association[MapIndexed[Function[{record, index}, First[index] -> record], records]]},
			Scan[
				Function[row,
					If[ ! KeyExistsQ[recordsByIndex, row["index"]],
						Print["Missing source record for ", row["key"]];
						Exit[6]
					];
					Print["Verifying ", row["key"]];
					MemoryConstrained[
						appendRepair[output, repairRow[row, recordsByIndex[row["index"]]]],
						2 * 1024^3,
						(
							Print["Verification repair memory limit for ", row["key"]];
							appendRepair[output, repairMemoryRow[row]]
						)
					];
					Print["Repaired ", row["key"]];
					ClearSystemCache[]
				]
				,
				rows
			];
			ClearSystemCache[];
			Length[rows]
		]
	]
]

repairShard::usage = "repairShard[resultRoot, method, shard, verificationSeconds] re-verifies pending numeric verdict rows in one base shard with an explicit verification limit and writes a separate resumable deterministic repair shard."

repairShard[resultRoot_String, method_String, shard_Integer] := repairShard[resultRoot, method, shard, 180]

repairShard[resultRoot_String, method_String, shard_Integer, verificationSeconds_Integer] /; shard >= 0 && verificationSeconds > 0 := Block[{Baseline`$verificationTimeLimit = verificationSeconds},
	With[{root = Directory[], methodRoot = FileNameJoin[{resultRoot, method}], shardText = ToString[shard]},
		With[{input = FileNameJoin[{methodRoot, "shard-" <> shardText <> ".wl"}], output = FileNameJoin[{methodRoot, "verification-repair-deterministic-shard-" <> shardText <> ".wl"}]},
			With[{inventory = Get[FileNameJoin[{root, "tests", "Abbasi", "generated", "native-inventory.wl"}]]},
				With[{sections = #["section"]& /@ inventory["files"]},
					With[{baseRows = Baseline`BaselineCanonicalRow[#, sections]& /@ ReadList[input, Expression], completed = readCompleted[output, sections]},
						If[ ! AllTrue[baseRows, AssociationQ],
							Print["Malformed base rows in ", input];
							Exit[3]
						];
						With[{pending = Select[baseRows, Function[row, (row["outcome"] === "solved" || row["outcome"] === "wrong") && row["verificationMethod"] === "numeric" && (TrueQ[row["correct"]] || row["correct"] === False) && ! TrueQ[completed[row["key"]]]]]},
							Print["Verification repair shard=", shard, " pending=", Length[pending]];
							With[{needed = GroupBy[pending, fileKey]},
								With[{newRows = Total[processEntry[root, #, needed, output]& /@ inventory["files"]]},
									Print["Verification repair complete shard=", shard, " new=", newRows]
								]
							]
						]
					]
				]
			]
		]
	]
]

repairShard[___] := (
	Print["Invalid repair shard"];
	Exit[2]
)

repairArguments::usage = "repairArguments[script, resultRoot, method, shardText, optionalVerificationSecondsText] parses the verification-repair command line."

repairArguments[_, resultRoot_String, method_String, shardText_String] := repairShard[resultRoot, method, ToExpression[shardText]]

repairArguments[_, resultRoot_String, method_String, shardText_String, verificationSecondsText_String] := repairShard[
	resultRoot,
	method,
	ToExpression[shardText],
	ToExpression[verificationSecondsText]
]

repairArguments[___] := (
	Print["Repair arguments: RESULT_ROOT METHOD SHARD [VERIFICATION_SECONDS]"];
	Exit[2]
)

Get[FileNameJoin[{Directory[], "tools", "baseline", "Baseline.wl"}]]

MemoryConstrained[
	repairArguments @@ $ScriptCommandLine
	,
	4 * 1024^3 + 512 * 1024^2
	,
	Print["Verification repair shard memory limit exceeded"];
	Exit[12]
]
