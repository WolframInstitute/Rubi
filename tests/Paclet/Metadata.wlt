VerificationTest[
	With[{information = First @ Get[FileNameJoin[{Directory[], "Rubi", "PacletInfo.wl"}]]},
		Lookup[information, #]& /@ {"Name", "Version", "WolframVersion", "Creator", "License", "PrimaryContext"}
	]
	,
	{"WolframInstitute/Rubi", "4.17.3.2", "13+", "Albert D. Rich, Patrick Scheibe", "MIT", "Rubi`"}
	,
	TestID -> "modern-paclet-metadata"
]

VerificationTest[
	With[
		{information = First @ Get[FileNameJoin[{Directory[], "Rubi", "PacletInfo.wl"}]]},
		{extensions = Lookup[information, "Extensions"]},
		{
			KeyFreeQ[information, "MathematicaVersion"],
			FreeQ[information, PacletServer],
			Cases[extensions, {"Kernel", options___} :> (Lookup[{options}, #]& /@ {"Root", "Context"})],
			Cases[extensions, {"Documentation", options___} :> Lookup[{options}, "Language"]]
		}
	]
	,
	{True, True, {{"Kernel", "Rubi`"}}, {"English"}}
	,
	TestID -> "modern-kernel-and-documentation-extensions"
]

VerificationTest[
	With[
		{information = First @ Get[FileNameJoin[{Directory[], "Rubi", "PacletInfo.wl"}]]},
		FirstCase[Lookup[information, "Extensions"], {"Asset", options___} :> Lookup[{options}, "Assets"], {}]
	]
	,
	{
		{"IntegrationRules", "IntegrationRules"},
		{"Loader", "Rubi.m"},
		{"MemoryImages", "MemoryImages.wl"},
		{"IntegrationUtilities", "IntegrationUtilityFunctions.m"},
		{"PackageTools", "RubiPackageTools.m"},
		{"StepFormatting", "ShowStepFormatting.m"},
		{"StepRoutines", "ShowStepRoutines.m"},
		{"License", "LICENSE"}
	}
	,
	TestID -> "archive-includes-rule-corpus-and-runtime-sources"
]

VerificationTest[
	FileHash[FileNameJoin[{Directory[], "LICENSE"}]] === FileHash[FileNameJoin[{Directory[], "Rubi", "LICENSE"}]],
	True,
	TestID -> "paclet-contains-exact-mit-license"
]

Get[FileNameJoin[{Directory[], "Rubi", "MemoryImages.wl"}]]

VerificationTest[
	StringMatchQ[Rubi`$RubiSourceCommit, HexadecimalCharacter ~~ Repeated[HexadecimalCharacter, {39}]], True, TestID -> "upstream-source-commit-recorded"
]

VerificationTest[StringFreeQ[Rubi`Private`memoryImageFile[], Rubi`Private`$sourceDirectory], True, TestID -> "memory-image-outside-installation"]

VerificationTest[
	Rubi`Private`memoryImageFile["Wolfram Language 15.0"] =!= Rubi`Private`memoryImageFile["Wolfram Institute Kernel 15.0, development commit"]
	,
	True
	,
	TestID -> "memory-image-key-distinguishes-full-kernel-identity"
]

VerificationTest[
	Block[{$LoadShowSteps = True, $LoadElementaryFunctionRules = False},
		Rubi`Private`memoryImageFile[]
	] =!= Block[{$LoadShowSteps = False, $LoadElementaryFunctionRules = True},
		Rubi`Private`memoryImageFile[]
	]
	,
	True
	,
	TestID -> "memory-image-key-includes-loading-configuration"
]

VerificationTest[
	Module[{cacheRoot = CreateDirectory[]},
		WithCleanup[
			Block[{Rubi`Private`$memoryImageDirectory = cacheRoot},
				Module[{image = Rubi`Private`memoryImageFile[], existed},
					Rubi`Private`writeMemoryImage[image];
					existed = FileExistsQ[image];
					Rubi`Private`clearMemoryImages[];
					{existed, FileExistsQ[image], FileNames["*.mx", {cacheRoot}]}
				]
			]
			,
			DeleteDirectory[cacheRoot, DeleteContents -> True]
		]
	]
	,
	{True, False, {}}
	,
	TestID -> "atomic-memory-image-write-and-cleanup"
]
