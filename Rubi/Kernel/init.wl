(* ::Package:: *)

(* Load Rubi from source or from its versioned, user-writable memory-image cache. *)

Begin["Rubi`Private`"]

$pacletDirectory = DirectoryName[DirectoryName[System`Private`$InputFileName]]

Get[FileNameJoin[{$pacletDirectory, "MemoryImages.wl"}]]

loadSource::usage = "loadSource[] loads Rubi's ordered source files and makes a best-effort memory-image cache."

loadSource[] := (
	Get[FileNameJoin[{$pacletDirectory, "Rubi.m"}]];
	writeMemoryImage[memoryImageFile[]]
)

Quiet[
	Unprotect["Int"];
	Remove["Int"]
]

If[ FileExistsQ[memoryImageFile[]],
	Check[
		Get[memoryImageFile[]];
		$memoryImageLoadedQ = True
		,
		DeleteFile[memoryImageFile[]];
		loadSource[]
	]
	,
	loadSource[]
]

Print[Rubi`$RubiVersion <> " running on Wolfram Language " <> ToString[$VersionNumber]]

End[]
