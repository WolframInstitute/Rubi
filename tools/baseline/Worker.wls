#!/usr/bin/env wolframscript
(* Usage: wolframscript -file tools/baseline/Worker.wls RESULT_ROOT METHOD SHARD WORKER_COUNT [MAX_NEW_ROWS_PER_SHARD | retry-oom] *)

$HistoryLength = 0

inputFormString::usage = "inputFormString[expression] gives one unwrapped InputForm line for result storage."

inputFormString[expression_] := ToString[InputForm[expression], PageWidth -> Infinity]

recordKey::usage = "recordKey[section, file, index] gives the stable corpus key for a result row."

recordKey[section_, file_, index_] := StringJoin[section, "/", file, "/", ToString[index]]

methodResultName::usage = "methodResultName[method] gives the stable result-directory name of a method symbol."

methodResultName[Baseline`W15Method] = "W15"

methodResultName[Baseline`RubiMethod] = "Rubi"

loadMethod::usage = "loadMethod[method] loads Rubi when requested and returns its rule count or a missing value for W15."

loadMethod[Baseline`W15Method] := Missing["NotApplicable"]

loadMethod[Baseline`RubiMethod] := With[{root = Directory[]},
	Print["Loading Rubi directly from .m files (no shared memory image)..."];
	Get[FileNameJoin[{root, "Rubi", "Rubi.m"}]];
	Print["Rubi loaded; $RuleCount=", Rubi`$RuleCount];
	Rubi`$RuleCount
]

readCompleted::usage = "readCompleted[output, sections] reads and validates stable keys already stored in a resumable shard, canonicalizing legacy section names."

readCompleted[output_String, _List] /; ! FileExistsQ[output] := <||>

readCompleted[output_String, sections_List] := With[{rows = ReadList[output, Expression]},
	If[ ! AllTrue[rows, AssociationQ],
		Print["Malformed resume data in ", output];
		Exit[4]
	];
	Print["Resuming with ", Length[rows], " completed rows from ", output];
	With[{canonicalRows = Baseline`BaselineCanonicalRow[#, sections]& /@ rows},
		Association[#["key"] -> True& /@ canonicalRows]
	]
]

appendResultRow::usage = "appendResultRow[output, row] appends and closes one flushed, immutable result row."

appendResultRow[output_String, row_Association] := With[{stream = OpenAppend[output]},
	WriteString[stream, inputFormString[row] <> "\n"];
	Close[stream]
]

currentMarker::usage = "currentMarker[output] gives the transient interrupted-record marker belonging to one shard."

currentMarker[output_String] := output <> ".current"

memoryFailureRow::usage = "memoryFailureRow[method, section, file, index, record] prepares the row to store only if the record is OOM-killed twice at the per-worker cgroup limit."

memoryFailureRow[method_, section_String, file_String, index_Integer, record_List] := With[{optimal = Baseline`BaselineOptimalAnswer[record]},
	<|
		"key" -> recordKey[section, file, index],
		"section" -> section,
		"file" -> file,
		"index" -> index,
		"method" -> methodResultName[method],
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
		"gradeReason" -> "OOM-killed twice at the 5 GiB per-worker cgroup limit in fresh kernels",
		"workerMemoryLimitBytes" -> 5 * 1024^3,
		"answer" -> Missing["NotStored"]
	|>
]

previousOOMCount::usage = "previousOOMCount[marker, key] preserves the confirmed OOM count when a fresh kernel retries an interrupted key."

previousOOMCount[marker_String, key_String] /; ! FileExistsQ[marker] = 0

previousOOMCount[marker_String, key_String] := With[{state = Get[marker]},
	If[AssociationQ[state] && state["key"] === key, Lookup[state, "oomCount", 0], 0]
]

evaluateAndStore::usage = "evaluateAndStore[output, method, section, file, index, record] marks one active record, stores its completed row, clears caches and removes the marker."

evaluateAndStore[output_String, method_, section_String, file_String, index_Integer, record_List] := With[{marker = currentMarker[output], key = recordKey[section, file, index]},
	Put[<|"key" -> key, "oomCount" -> previousOOMCount[marker, key], "memoryRow" -> memoryFailureRow[method, section, file, index, record]|>, marker];
	appendResultRow[output, evaluateRow[method, section, file, index, record]];
	DeleteFile[marker];
	ClearSystemCache[]
]

fallbackRow::usage = "fallbackRow[methodName, section, file, index] gives an error row for an uncaught abort, throw or malformed evaluator result."

fallbackRow[methodName_String, section_String, file_String, index_Integer] := <|
	"key" -> recordKey[section, file, index],
	"section" -> section,
	"file" -> file,
	"index" -> index,
	"method" -> methodName,
	"grade" -> "F",
	"outcome" -> "error",
	"correct" -> Indeterminate,
	"answerSize" -> Missing["EvaluationError"],
	"optimalSize" -> Missing["EvaluationError"],
	"integrationTime" -> Missing["EvaluationError"],
	"verificationTime" -> 0.,
	"verificationMethod" -> "worker-error",
	"expressionType" -> Missing["EvaluationError"],
	"answerType" -> Missing["EvaluationError"],
	"gradeReason" -> "uncaught abort or throw in BaselineRunRecord",
	"numericScales" -> "{}",
	"answer" -> Missing["NotStored"]
|>

evaluateRow::usage = "evaluateRow[method, section, file, index, record] isolates one corpus evaluation from uncaught aborts and throws."

evaluateRow[method_, section_String, file_String, index_Integer, record_] := With[{methodName = methodResultName[method]},
	With[{
		result = Catch[
			CheckAbort[Baseline`BaselineRunRecord[method, section, file, index, record], fallbackRow[methodName, section, file, index]],
			_,
			Function[fallbackRow[methodName, section, file, index]]
		]
	},
		Replace[result, {row_Association :> row, _ :> fallbackRow[methodName, section, file, index]}]
	]
]

readRecords::usage = "readRecords[format, path] reads native or added records with every reference integral held inert."

readRecords[NativeRecords, path_String] := Block[{Global`Int = Baseline`BaselineReferenceInt, Rubi`Int = Baseline`BaselineReferenceInt},
	DeleteCases[ReadList[path, Expression], Null]
]

readRecords[AddedRecords, path_String] := Block[{Global`Int = Baseline`BaselineReferenceInt, Rubi`Int = Baseline`BaselineReferenceInt},
	Get[path]
]

nativeEntry::usage = "nativeEntry[nativeRoot, path] describes one native corpus file with its section-relative stable identity."

nativeEntry[nativeRoot_String, path_String] := With[{relative = StringDrop[path, StringLength[nativeRoot] + 1]},
	With[{section = First[FileNameSplit[relative]]},
		<|"Section" -> section, "File" -> StringDrop[relative, StringLength[section] + 1], "Path" -> path, "Format" -> NativeRecords|>
	]
]

addedEntry::usage = "addedEntry[section, file, path] describes one added corpus file."

addedEntry[section_String, file_String, path_String] := <|"Section" -> section, "File" -> file, "Path" -> path, "Format" -> AddedRecords|>

corpusEntries::usage = "corpusEntries[root] lists every native, Blake and Hebisch corpus file in stable order."

corpusEntries[root_String] := With[{nativeRoot = FileNameJoin[{root, "tests", "MathematicaSyntaxTestSuite"}]},
	Join[
		nativeEntry[nativeRoot, #]& /@ Sort[FileNames["*.m", nativeRoot, Infinity]]
		,
		{
			addedEntry["Blake", "Blake_Problems.m", FileNameJoin[{root, "tests", "Abbasi", "generated", "Blake_Problems.m"}]],
			addedEntry["BlakeRational", "Blake_Integrate_Rational_Tests.txt", FileNameJoin[{root, "tests", "Abbasi", "originals", "Blake_Integrate_Rational_Tests.txt"}]],
			addedEntry["Hebisch", "Hebisch_Problems.m", FileNameJoin[{root, "tests", "Abbasi", "generated", "Hebisch_Problems.m"}]]
		}
	]
]

pendingRecords::usage = "pendingRecords[entry, shard, workerCount, completed, maximum] selects the shard's unfinished records and applies the optional new-row limit."

pendingRecords[entry_Association, shard_Integer, workerCount_Integer, completed_Association, maximum_] := With[{records = readRecords[entry["Format"], entry["Path"]]},
	With[{indexed = MapIndexed[Function[{record, index}, <|"Record" -> record, "Index" -> First[index]|>], records]},
		With[{unfinished = Select[indexed, Function[item, Mod[item["Index"] - 1, workerCount] == shard && ! TrueQ[completed[recordKey[entry["Section"], entry["File"], item["Index"]]]]]]},
			If[maximum === Infinity, unfinished, Take[unfinished, UpTo[maximum]]]
		]
	]
]

processEntry::usage = "processEntry[entry, output, method, shard, workerCount, completed, maximum] evaluates and appends all selected records from one corpus file."

processEntry[entry_Association, output_String, method_, shard_Integer, workerCount_Integer, completed_Association, maximum_] := With[{pending = pendingRecords[entry, shard, workerCount, completed, maximum]},
	Scan[Function[item, evaluateAndStore[output, method, entry["Section"], entry["File"], item["Index"], item["Record"]]], pending];
	ClearSystemCache[];
	Print["Completed file ", entry["Section"], "/", entry["File"], " newRows=", Length[pending]];
	Length[pending]
]

processEntries::usage = "processEntries[entries, output, method, shard, workerCount, completed, maximum] threads one optional new-row limit across the corpus files."

processEntries[entries_List, output_String, method_, shard_Integer, workerCount_Integer, completed_Association, maximum_] := Fold[
	Function[{processed, entry},
		If[maximum =!= Infinity && processed >= maximum, processed, processed + processEntry[entry, output, method, shard, workerCount, completed, If[maximum === Infinity, Infinity, maximum - processed]]]
	]
	,
	0
	,
	entries
]

validShardQ::usage = "validShardQ[shard, workerCount] tests whether shard is a zero-based index for workerCount workers."

validShardQ[shard_Integer, workerCount_Integer] := IntegerQ[shard] && IntegerQ[workerCount] && workerCount > 0 && shard >= 0 && shard < workerCount

validShardQ[___] = False

runConfiguredWorker::usage = "runConfiguredWorker[resultRoot, method, shard, workerCount, maximum] runs one bounded, resumable baseline shard."

runConfiguredWorker[resultRoot_String, method_, shard_Integer, workerCount_Integer, maximum_] /; validShardQ[shard, workerCount] := With[{root = Directory[], methodName = methodResultName[method], started = AbsoluteTime[]},
	With[{ruleCount = loadMethod[method]},
		With[{methodRoot = FileNameJoin[{resultRoot, methodName}], entries = corpusEntries[root]},
			CreateDirectory[methodRoot, CreateIntermediateDirectories -> True];
			With[{output = FileNameJoin[{methodRoot, "shard-" <> ToString[shard] <> ".wl"}], manifest = FileNameJoin[{methodRoot, "manifest-shard-" <> ToString[shard] <> ".wl"}]},
				Put[
					<|
						"method" -> methodName,
						"shard" -> shard,
						"workers" -> workerCount,
						"wolframVersion" -> $Version,
						"system" -> $System,
						"integrationTimeLimit" -> 180,
						"verificationTimeLimit" -> 180,
						"memoryLimitBytes" -> 4 * 1024^3,
						"workerCgroupMemoryLimitBytes" -> 5 * 1024^3,
						"rubiRuleCount" -> ruleCount,
						"nativeCommit" -> "32b79cedb8a5a80e82e6db9f67e9cdf88cf11217",
						"started" -> DateString["ISODateTime"]
					|>
					,
					manifest
				];
				With[{completed = readCompleted[output, #["Section"]& /@ entries]},
					With[{newRows = processEntries[entries, output, method, shard, workerCount, completed, maximum]},
						Print["Worker complete method=", methodName, " shard=", shard, " newRows=", newRows, " totalCompleted=", Length[completed] + newRows, " elapsedSeconds=", Round[AbsoluteTime[] - started]];
						If[maximum =!= Infinity && newRows >= maximum, Exit[20]]
					]
				]
			]
		]
	]
]

runConfiguredWorker[___] := (
	Print["Invalid worker arguments"];
	Exit[3]
)

recoverOOM::usage = "recoverOOM[output, completed, marker] confirms one OOM and writes a memory row only after a second OOM for the same unfinished key."

recoverOOM[output_String, _Association, marker_String] /; ! FileExistsQ[marker] := Print["No interrupted record marker for ", output]

recoverOOM[output_String, completed_Association, marker_String] := With[{state = Get[marker]},
	If[ ! AssociationQ[state] || ! KeyExistsQ[state, "key"] || ! KeyExistsQ[state, "memoryRow"],
		Print["Malformed interrupted record marker: ", marker];
		Exit[5]
	];
	If[ TrueQ[completed[state["key"]]],
		DeleteFile[marker];
		Print["Interrupted row was already stored; cleared ", state["key"]]
		,
		With[{count = Lookup[state, "oomCount", 0] + 1},
			If[ count >= 2,
				appendResultRow[output, Join[state["memoryRow"], <|"oomCount" -> count|>]];
				DeleteFile[marker];
				Print["Stored bounded memory failure after second fresh-kernel OOM: ", state["key"]]
				,
				Put[Join[state, <|"oomCount" -> count|>], marker];
				Print["Confirmed first OOM; retrying once in a fresh kernel: ", state["key"]]
			]
		]
	]
]

runOOMRecovery::usage = "runOOMRecovery[resultRoot, method, shard, workerCount] records or retries one OOM without rerunning integration in the recovery kernel."

runOOMRecovery[resultRoot_String, method_, shard_Integer, workerCount_Integer] /; validShardQ[shard, workerCount] := With[{root = Directory[], methodName = methodResultName[method]},
	With[{entries = corpusEntries[root], output = FileNameJoin[{resultRoot, methodName, "shard-" <> ToString[shard] <> ".wl"}]},
		With[{completed = readCompleted[output, #["Section"]& /@ entries]},
			recoverOOM[output, completed, currentMarker[output]]
		]
	]
]

runOOMRecovery[___] := (
	Print["Invalid OOM recovery arguments"];
	Exit[3]
)

runWorker::usage = "runWorker[resultRoot, methodName, shard, workerCount, maximum] validates the method name and starts a baseline worker."

runWorker[resultRoot_String, "W15", shard_Integer, workerCount_Integer, maximum_] := runConfiguredWorker[resultRoot, Baseline`W15Method, shard, workerCount, maximum]

runWorker[resultRoot_String, "Rubi", shard_Integer, workerCount_Integer, maximum_] := runConfiguredWorker[resultRoot, Baseline`RubiMethod, shard, workerCount, maximum]

runWorker[___] := (
	Print["Invalid worker arguments"];
	Exit[3]
)

runWorkerArguments::usage = "runWorkerArguments[script, resultRoot, methodName, shardText, workerCountText, optionalMaximumText] parses command-line arguments for Worker.wls."

runWorkerArguments[_, resultRoot_String, methodName_String, shardText_String, workerCountText_String] := runWorker[
	resultRoot,
	methodName,
	ToExpression[shardText],
	ToExpression[workerCountText],
	Infinity
]

runWorkerArguments[_, resultRoot_String, "W15", shardText_String, workerCountText_String, "retry-oom"] := runOOMRecovery[
	resultRoot,
	Baseline`W15Method,
	ToExpression[shardText],
	ToExpression[workerCountText]
]

runWorkerArguments[_, resultRoot_String, "Rubi", shardText_String, workerCountText_String, "retry-oom"] := runOOMRecovery[
	resultRoot,
	Baseline`RubiMethod,
	ToExpression[shardText],
	ToExpression[workerCountText]
]

runWorkerArguments[_, resultRoot_String, methodName_String, shardText_String, workerCountText_String, maximumText_String] := runWorker[
	resultRoot,
	methodName,
	ToExpression[shardText],
	ToExpression[workerCountText],
	ToExpression[maximumText]
]

runWorkerArguments[___] := (
	Print["Worker arguments: RESULT_ROOT METHOD SHARD WORKER_COUNT [MAX_NEW_ROWS_PER_SHARD]"];
	Exit[2]
)

Get[FileNameJoin[{Directory[], "tools", "baseline", "Baseline.wl"}]]

runWorkerArguments @@ $ScriptCommandLine
