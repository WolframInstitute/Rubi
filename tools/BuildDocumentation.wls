#!/usr/bin/env wolframscript
(* Build Rubi's documentation with PacletPage and MarkdownToNotebook.
   Optional environment variables:
     PACLET_PAGE_DIRECTORY   local PacletPage checkout
     MARKDOWN_TO_NOTEBOOK    local MarkdownToNotebook.wl *)

$ProgressReporting = False

repositoryDirectory = ParentDirectory[DirectoryName[$InputFileName]]

pacletDirectory = FileNameJoin[{repositoryDirectory, "Rubi"}]

pacletPageDirectory = Environment["PACLET_PAGE_DIRECTORY"]

converter = Environment["MARKDOWN_TO_NOTEBOOK"]

If[StringQ[pacletPageDirectory] && DirectoryQ[pacletPageDirectory], PacletDirectoryLoad[pacletPageDirectory]]

Needs["WolframInstitute`PacletPage`"]

result = MemoryConstrained[
	BuildPacletDocumentation[pacletDirectory, "Converter" -> If[StringQ[converter] && FileExistsQ[converter], converter, Automatic]],
	4 * 1024^3,
	Failure["DocumentationMemoryLimit", <|"MessageTemplate" -> "Rubi documentation build exceeded 4 GiB."|>]
]

If[ ! AssociationQ[result],
	Print[result];
	Exit[1]
]

Print[Length[result["Notebooks"]], " documentation pages: ", Length[result["Converted"]], " converted, ", Length[result["Cached"]], " cached"]

If[ result["Failed"] =!= {},
	Print["Failed pages: ", result["Failed"]];
	Exit[1]
]

If[ result["Unevaluated"] =!= <||>,
	Print["Unevaluated examples: ", result["Unevaluated"]];
	Exit[1]
]
