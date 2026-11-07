#!/usr/bin/env wolframscript
(* Check one fresh-kernel Rubi loading phase.
   Usage: wolframscript -file tools/CheckPacletLoading.wls PHASE CACHE_DIRECTORY
   PHASE is cold, warm or direct. Run cold, then warm, then direct with the same
   empty cache directory, in separate kernels and a memory-capped environment. *)

$ProgressReporting = False

repositoryDirectory = ParentDirectory[DirectoryName[$InputFileName]]

arguments = Rest[$ScriptCommandLine]

If[ ! MatchQ[arguments, {("cold" | "warm" | "direct"), _String}],
	Print["Usage: wolframscript -file tools/CheckPacletLoading.wls {cold|warm|direct} CACHE_DIRECTORY"];
	Exit[2]
]

{phase, cacheRoot} = arguments

If[ ! DirectoryQ[cacheRoot],
	Print["Cache directory does not exist: ", cacheRoot];
	Exit[2]
]

imagesBefore = FileNames["*.mx", cacheRoot, Infinity]

If[ (phase === "cold") =!= (imagesBefore === {}),
	Print["Cold loading requires an empty cache; warm and direct loading require the image made by the cold phase."];
	Exit[2]
]

started = AbsoluteTime[]

result = MemoryConstrained[
	TimeConstrained[
		Block[{$UserBaseDirectory = cacheRoot, $LoadShowSteps = False, $LoadElementaryFunctionRules = True},
			If[phase === "direct", Get[FileNameJoin[{repositoryDirectory, "Rubi", "Rubi.m"}]], Get[FileNameJoin[{repositoryDirectory, "Rubi", "Kernel", "init.wl"}]]];
			<|
				"Phase" -> phase,
					"LoadSeconds" -> N[AbsoluteTime[] - started, 6],
				"Derivative" -> D[Rubi`Int[x^2, x], x],
					"Algebraic" -> Rubi`Int[Sqrt[1 - x^2], x],
					"StarRules" -> Length[DownValues[System`Star]],
				"RuleCount" -> Rubi`$RuleCount,
				"ImageLoaded" -> Rubi`Private`$memoryImageLoadedQ,
				"ImageExists" -> FileExistsQ[Rubi`Private`memoryImageFile[]],
				"ImagesBefore" -> Length[imagesBefore],
				"CacheOutsideSource" -> StringStartsQ[Rubi`Private`memoryImageFile[], cacheRoot],
				"SourceImages" -> FileNames["*.mx", {FileNameJoin[{repositoryDirectory, "Rubi", "Kernel"}]}]
			|>
		]
		,
		600
	]
	,
	4 * 1024^3
]

If[ result === $Aborted,
	Print["Rubi loading check exceeded 600 seconds or 4 GiB"];
	Exit[12]
]

checks = {result["Derivative"] === x^2, result["Algebraic"] === (x * Sqrt[1 - x^2]) / 2 + ArcSin[x] / 2, result["StarRules"] > 0, result["RuleCount"] === 7250, result["ImageLoaded"] === (phase === "warm"), result["ImageExists"], result["CacheOutsideSource"], result["SourceImages"] === {}}

Print[result]

If[ ! AllTrue[checks, TrueQ],
	Print["Rubi ", phase, " loading check failed: ", checks];
	Exit[1]
]

Print["Rubi ", phase, " loading check passed"]
