#!/usr/bin/env wolframscript
(* Build the Rubi paclet archive without loading the integration rules.
   Usage: wolframscript -file tools/BuildPaclet.wls [SOURCE_DIRECTORY] [TARGET_DIRECTORY] *)

buildPaclet::usage = "buildPaclet[source, target] creates a Rubi .paclet archive from source in target."

buildPaclet[source_String, target_String] /; DirectoryQ[source] := Module[{archive},
	If[! DirectoryQ[target], CreateDirectory[target, CreateIntermediateDirectories -> True]];
	archive = CreatePacletArchive[source, target];
	If[ FileExistsQ[archive],
		Print[archive]
		,
		Print["Paclet archive creation failed: ", archive];
		Exit[3]
	]
]

buildPaclet[source_String, _String] := (
	Print["Paclet source directory does not exist: ", source];
	Exit[2]
)

buildArguments::usage = "buildArguments parses an optional paclet source directory and archive target directory."

buildArguments[_] := buildPaclet[FileNameJoin[{Directory[], "Rubi"}], FileNameJoin[{Directory[], "build"}]]

buildArguments[_, source_String] := buildPaclet[source, FileNameJoin[{Directory[], "build"}]]

buildArguments[_, source_String, target_String] := buildPaclet[source, target]

buildArguments[___] := (
	Print["Build arguments: [SOURCE_DIRECTORY] [TARGET_DIRECTORY]"];
	Exit[2]
)

MemoryConstrained[
	buildArguments @@ $ScriptCommandLine
	,
	1024^3
	,
	Print["Paclet build memory limit exceeded"];
	Exit[12]
]
