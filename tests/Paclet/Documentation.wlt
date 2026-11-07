VerificationTest[
	With[{definition = Import[FileNameJoin[{Directory[], "Rubi", "ResourceDefinition.md"}], "Text"]},
		{
			StringContainsQ[definition, "Name: WolframInstitute/Rubi"],
			StringContainsQ[definition, "MainGuide: Documentation/English/Guides/Rubi.nb"],
			StringContainsQ[definition, "Template: Paclet"],
			StringContainsQ[definition, "License: MIT"]
		}
	]
	,
	{True, True, True, True}
	,
	TestID -> "paclet-resource-definition-agrees-with-layout"
]

VerificationTest[
	With[
		{information = First @ Get[FileNameJoin[{Directory[], "Rubi", "PacletInfo.wl"}]]},
		{extensions = Lookup[information, "Extensions"]},
		{symbols = First @ Cases[extensions, {"Kernel", options___} :> Lookup[{options}, "Symbols"]]},
		{Sort[Last @ StringSplit[#, "`"]& /@ symbols] === Sort[FileBaseName /@ FileNames["*.md", {FileNameJoin[{Directory[], "Rubi", "docs", "Symbols"}]}]]}
	]
	,
	{True}
	,
	TestID -> "every-declared-public-symbol-has-a-reference-page"
]

VerificationTest[
	FileExistsQ /@ {FileNameJoin[{Directory[], "Rubi", "docs", "Guides", "Rubi.md"}], FileNameJoin[{Directory[], "tools", "BuildDocumentation.wls"}]},
	{True, True},
	TestID -> "documentation-guide-and-build-entry-point-present"
]
