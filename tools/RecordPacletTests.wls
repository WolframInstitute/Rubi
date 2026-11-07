#!/usr/bin/env wolframscript
(* Record Rubi paclet behavior tests from actual W15 results.
   Usage: wolframscript -file tools/RecordPacletTests.wls [TARGET_WLT] *)

$ProgressReporting = False

repositoryDirectory = Directory[]

target = Replace[$ScriptCommandLine, {{_, file_String} :> file, _ :> FileNameJoin[{repositoryDirectory, "tests", "Paclet", "Behavior.wlt"}]}]

If[ FileExistsQ[target],
	Print["Refusing to overwrite an existing test file: ", target];
	Exit[2]
]

MemoryConstrained[
	PacletDirectoryLoad[FileNameJoin[{repositoryDirectory, "Rubi"}]];
	Needs["Rubi`"]
	,
	4 * 1024^3
	,
	Print["Rubi loading exceeded 4 GiB"];
	Exit[12]
]

SetAttributes[recordTest, HoldFirst]

recordTest::usage = "recordTest[input, id] evaluates input and holds a VerificationTest with its actual result."

recordTest[input_, id_String] := With[{result = MemoryConstrained[TimeConstrained[input, 60], 1024^3]},
	If[ result === $Aborted,
		Print["Recording aborted for ", id];
		Exit[12]
	];
	HoldComplete[VerificationTest[input, result, TestID -> id]]
]

tests = {
	recordTest[Int[x^2, x], "polynomial-antiderivative"]
	,
	recordTest[Int[1 / (1 + x^2), x], "inverse-tangent-antiderivative"]
	,
	recordTest[Int[x * Exp[x], x], "integration-by-parts"]
	,
	recordTest[Int[Sin[x] ^ 2, x], "trigonometric-antiderivative"]
	,
	recordTest[Int[Sqrt[1 - x^2], x], "algebraic-antiderivative"]
	,
	recordTest[Int[Log[x], x], "logarithmic-antiderivative"]
	,
	recordTest[Int[Exp[-x^2], x], "special-function-antiderivative"]
	,
	recordTest[Int[{x, x^2, x^3}, x], "list-of-integrands"]
	,
	recordTest[D[Int[1 / (1 + x^2) ^ 2, x], x] == 1 / (1 + x^2) ^ 2, "differentiation-check"]
	,
	recordTest[Last @ Step[Int[x^2, x], RubiPrintInformation -> False], "single-step-result"]
	,
	recordTest[Last @ Steps[Int[x^2, x], RubiPrintInformation -> False], "all-steps-antiderivative"]
	,
	recordTest[
		With[{statistics = First @ Stats[Int[x^2, x], RubiPrintInformation -> False]},
			statistics /@ {"Steps", "NumberOfRules", "InputLeafCount", "OutputLeafCount"}
		]
		,
		"statistics-properties"
	]
}

testText[HoldComplete[test_]] := ToString[Unevaluated[test], InputForm]

header = StringJoin["(* Recorded from Rubi on ", $Version, ".\n", "   Upstream source: ", Rubi`$RubiSourceCommit, ". *)"]

preamble = "PacletDirectoryLoad[FileNameJoin[{Directory[], \"Rubi\"}]]\nNeeds[\"Rubi`\"]"

MemoryConstrained[
	Export[target, StringJoin[header, "\n\n", preamble, "\n\n", StringRiffle[testText /@ tests, "\n\n"], "\n"], "Text"]
	,
	1024^3
	,
	Print["Test recording exceeded 1 GiB"];
	Exit[12]
]

If[ FileExistsQ[target],
	Print[target]
	,
	Print["Test recording failed: ", target];
	Exit[1]
]
