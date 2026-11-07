#!/usr/bin/env wolframscript
(* Publish Rubi's PacletPage with the explicitly selected PacletPage checkout.
   Usage: PublishDocumentation.wls PACLET_DIRECTORY PACLET_PAGE_DIRECTORY CONVERTER_FILE RESULT_FILE [--dry-run|--deploy] *)

$ProgressReporting = False

scriptPosition = FirstPosition[ExpandFileName /@ $ScriptCommandLine, ExpandFileName[$InputFileName]]

If[ scriptPosition === Missing["NotFound"],
	Print["Could not locate this script in $ScriptCommandLine"];
	Exit[2]
]

arguments = Drop[$ScriptCommandLine, First[scriptPosition]]

If[ ! MatchQ[arguments, {_String, _String, _String, _String} | {_String, _String, _String, _String, "--dry-run" | "--deploy"}],
	Print["Usage: PublishDocumentation.wls PACLET_DIRECTORY PACLET_PAGE_DIRECTORY CONVERTER_FILE RESULT_FILE [--dry-run|--deploy]"];
	Exit[2]
]

{pacletDirectory, pacletPageDirectory, converterFile, resultFile} = Take[arguments, 4]
dryRun = MatchQ[Last[arguments], "--dry-run"]

If[ ! DirectoryQ[pacletPageDirectory] || ! FileExistsQ[converterFile] || ! DirectoryQ[pacletDirectory],
	Print["Invalid paclet, PacletPage or converter path"];
	Exit[2]
]

PacletDirectoryLoad[pacletPageDirectory]
Needs["WolframInstitute`PacletPage`"]
If[ ! DirectoryQ[DirectoryName[resultFile]], CreateDirectory[DirectoryName[resultFile], CreateIntermediateDirectories -> True]]

result = MemoryConstrained[
	TimeConstrained[
		PublishPacletPage[
			pacletDirectory,
			"Rubi",
			"Account" -> "wolframinstitute@wolframinstitute.org",
			"DryRun" -> dryRun,
			"Submit" -> False,
			"Monitor" -> True,
			"BuildOptions" -> {"Parallel" -> False, "Converter" -> converterFile, "TimeConstraint" -> 1800},
			"ResourceOptions" -> {"Parallel" -> False, "TimeConstraint" -> 1800},
			"SiteOptions" -> {"VersionLabel" -> True, "Footer" -> True, "FeedbackOptions" -> {"Domains" -> {"wolframinstitute.org", "wolfram.com"}}}
		],
		7000
	],
	8 * 1024^3
]

If[ result === $Aborted,
	Print["Rubi PacletPage release exceeded 7000 seconds or 8 GiB"];
	Exit[12]
]

Put[result, resultFile]

If[ ! AssociationQ[result],
	Print["Rubi PacletPage release failed: ", result];
	Exit[1]
]

Print["PacletPage version: ", Lookup[First @ Get[FileNameJoin[{pacletPageDirectory, "PacletInfo.wl"}]], "Version"]]
Print["Documentation pages: ", If[AssociationQ[result["Build"]], Length[result["Build"]["Notebooks"]], Missing["NotBuilt"]]]
Print["Resource: ", result["Resource"]["Resource"]]

If[ dryRun,
	Print["Dry run; no resource or site was deployed"];
	If[ ! AssociationQ[result["Build"]] || result["Build"]["Failed"] =!= {} || result["Build"]["Unevaluated"] =!= <||>,
		Print["Documentation build did not pass: ", result["Build"]];
		Exit[1]
	],
	Print["Site: ", result["Site"]["Site"]];
	Print["Check: ", result["Check"]["OK"]];
	If[ ! TrueQ[result["Check"]["OK"]],
		Print["Published-site checks failed: ", result["Check"]];
		Exit[1]
	]
]
