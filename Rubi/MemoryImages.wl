(* Memory-image paths and best-effort cache writes shared by paclet and direct source loading. *)

Begin["Rubi`Private`"]

Rubi`$RubiSourceCommit::usage = "$RubiSourceCommit identifies the upstream Rubi source snapshot used by this paclet."

Rubi`$RubiSourceCommit = "61e9c18ea248061cd83c67882f7c91a73cef912d"

$memoryImageLoadedQ = False

$memoryImageFormat = 2

$sourceDirectory = DirectoryName[System`Private`$InputFileName]

$pacletInformation = First @ Get[FileNameJoin[{$sourceDirectory, "PacletInfo.wl"}]]

pacletVersion::usage = "pacletVersion[] gives the Rubi paclet version recorded in PacletInfo.wl."

pacletVersion[] := Lookup[$pacletInformation, "Version"]

$memoryImageDirectory = FileNameJoin[{$UserBaseDirectory, "Caches", "Rubi", pacletVersion[], Rubi`$RubiSourceCommit}]

showStepsRequestedQ::usage = "showStepsRequestedQ[] gives whether step-display rules should be included in a memory image."

showStepsRequestedQ[] := If[ValueQ[Global`$LoadShowSteps], TrueQ[Global`$LoadShowSteps], True]

elementaryRulesRequestedQ::usage = "elementaryRulesRequestedQ[] gives whether elementary-function rules should be included in a memory image."

elementaryRulesRequestedQ[] := If[ValueQ[Global`$LoadElementaryFunctionRules], TrueQ[Global`$LoadElementaryFunctionRules], True]

memoryImageFile::usage = "memoryImageFile[] gives the user-cache file for the current kernel and Rubi loading configuration."

memoryImageFile[] := memoryImageFile[$Version]

memoryImageFile[version_String] := FileNameJoin[
	{
		$memoryImageDirectory
		,
		StringJoin[
			"ImageFormat-",
				ToString[$memoryImageFormat],
				"-",
				$SystemID,
			"-",
			ToString[$VersionNumber],
			"-",
			IntegerString[Hash[version, "SHA256"], 16, 64],
			If[showStepsRequestedQ[], "-Steps", ""],
			If[elementaryRulesRequestedQ[], "-ElementaryFunctions", ""],
			".mx"
		]
	}
]

writeMemoryImage::usage = "writeMemoryImage[file] makes a best-effort atomic memory-image write without preventing source loading."

writeMemoryImage[file_String] := Module[{temporary = file <> "." <> CreateUUID[] <> ".mx", directory = DirectoryName[file]},
	Check[
		If[! DirectoryQ[directory], Quiet @ CreateDirectory[directory, CreateIntermediateDirectories -> True]];
		If[ DirectoryQ[directory],
			(* Rubi attaches Star's distribution rules to System`Star, outside the Rubi` context. *)
			DumpSave[temporary, {"Rubi`", System`Star}];
			If[! FileExistsQ[file], RenameFile[temporary, file]];
			If[FileExistsQ[temporary], DeleteFile[temporary]]
		]
		,
		If[FileExistsQ[temporary], DeleteFile[temporary]]
	]
]

clearMemoryImages::usage = "clearMemoryImages[] deletes this source snapshot's user-cache memory images."

clearMemoryImages[] := DeleteFile /@ FileNames["*.mx", {$memoryImageDirectory}]

End[]
