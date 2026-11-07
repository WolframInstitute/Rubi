VerificationTest[
	Module[{cacheRoot = CreateDirectory[]},
		WithCleanup[
			Block[{$UserBaseDirectory = cacheRoot, $LoadShowSteps = False, $LoadElementaryFunctionRules = True},
				Block[{$Context = "Global`", $ContextPath = {"System`", "Global`"}}, Get[FileNameJoin[{Directory[], "Rubi", "Kernel", "init.wl"}]]];
				With[{sourceImages = FileNames["*.mx", {FileNameJoin[{Directory[], "Rubi", "Kernel"}]}]},
					{
						D[Rubi`Int[x^2, x], x],
						Rubi`Int[Sqrt[1 - x^2], x],
						Length[DownValues[System`Star]] > 0,
						Rubi`$RuleCount,
						Rubi`Private`$memoryImageLoadedQ,
						FileExistsQ[Rubi`Private`memoryImageFile[]],
						StringStartsQ[Rubi`Private`memoryImageFile[], cacheRoot],
						Rubi`Private`memoryImageFile["Wolfram Language 15.0"] =!= Rubi`Private`memoryImageFile["Wolfram Institute Kernel 15.0, development commit"],
						sourceImages
					}
				]
			]
			,
			DeleteDirectory[cacheRoot, DeleteContents -> True]
		]
	]
	,
	{x^2, (x * Sqrt[1 - x^2]) / 2 + ArcSin[x] / 2, True, 7250, False, True, True, True, {}}
	,
	TestID -> "cold-paclet-load-integrates-and-caches-outside-source"
]
