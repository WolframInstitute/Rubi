#!/usr/bin/env wolframscript
(* Local W15.1 spot-check of six difficult audit rows with five safe real samples.
   Usage: wl -file tools/baseline/W151SpotCheck.wls RESULT_ROOT *)

$HistoryLength = 0

Get[FileNameJoin[{Directory[], "tools", "baseline", "RealDomainAudit.wls"}]]

spotKeys = {
	"7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1134",
	"7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.2 Exponentials of inverse hyperbolic cotangent functions.m/731",
	"4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/464",
	"4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/465",
	"3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/425",
	"6 Hyperbolic functions/6.4 Hyperbolic cotangent/6.4.7 (d hyper)^m (a+b (c coth)^n)^p.m/49"
}

boundedSafe[row_Association, answerText_String] := MemoryConstrained[
	TimeConstrained[safeAudit[row, answerText], 3600, $Aborted],
	3 * 1024^3,
	$Aborted
]

spotRow[row_Association] := With[{integrand = ToExpression[row["integrand"]], variable = ToExpression[row["variable"]], started = AbsoluteTime[]},
	With[{answer = MemoryConstrained[TimeConstrained[Integrate[integrand, variable], 180, $Aborted], 3 * 1024^3, $Aborted]},
		If[ answer === $Aborted,
			Join[row, <|"W150DomainClassification" -> row["DomainClassification"], "W151Version" -> $Version, "W151Answer" -> Missing["NotStored"], "W151SafeClassification" -> "unresolved", "DomainClassification" -> "undecided", "W151SafeReason" -> "W15.1 integration exceeded 180 seconds or 3 GiB"|>]
			,
			With[{answerText = inputFormString[answer]},
				With[{optimalSafe = boundedSafe[row, row["optimal"]], w15Safe = boundedSafe[row, answerText]},
					With[{originalOptimal = <|"Classification" -> row["OptimalOriginalClassification"]|>},
						Join[
							row,
							<|
								"W150DomainClassification" -> row["DomainClassification"],
								"W151Version" -> $Version,
								"W151Answer" -> answerText,
								"W151IntegrationTime" -> N[AbsoluteTime[] - started],
								"DomainClassification" -> If[optimalSafe === $Aborted || w15Safe === $Aborted, "undecided", realDomainClass[row, originalOptimal, optimalSafe, w15Safe]],
								"OptimalSafeClassification" -> If[optimalSafe === $Aborted, "undecided", optimalSafe["Classification"]],
								"W151SafeClassification" -> If[w15Safe === $Aborted, "undecided", w15Safe["Classification"]],
								"OptimalSafeReason" -> If[optimalSafe === $Aborted, "optimal safe audit exceeded its bound", optimalSafe["Reason"]],
								"W151SafeReason" -> If[w15Safe === $Aborted, "W15.1 safe audit exceeded its bound", w15Safe["Reason"]],
								"OptimalSafeSamples" -> If[optimalSafe === $Aborted, {}, optimalSafe["Samples"]],
								"W151SafeSamples" -> If[w15Safe === $Aborted, {}, w15Safe["Samples"]]
							|>
						]
					]
				]
			]
		]
	]
]

boundedSpotRow[row_Association] := MemoryConstrained[
	TimeConstrained[spotRow[row], 7500, $Aborted],
	3 * 1024^3,
	$Aborted
]

spotMarkdown[rows_List] := StringJoin[
	"# W15.1 local spot check\n\n",
	"Five safe real candidate points per row, up to 600 seconds per point.\n\n",
	"Domain counts: ", inputFormString[Counts[#["DomainClassification"]& /@ rows]], "\n\n",
	StringRiffle[
		Function[row, StringJoin[
			"## ", row["key"], "\n\n",
			"- W15.1 version: `", row["W151Version"], "`\n",
			"- W15.0 domain: `", row["W150DomainClassification"], "`; safe check: `", row["W15SafeClassification"], "`\n",
			"- W15.1 answer: `", inputFormString[row["W151Answer"]], "`\n",
			"- Domain classification: `", row["DomainClassification"], "`\n",
			"- Optimal safe: `", row["OptimalSafeClassification"], "` - ", row["OptimalSafeReason"], "\n",
			"- W15.1 safe: `", row["W151SafeClassification"], "` - ", row["W151SafeReason"], "\n"
		]] /@ rows,
		"\n\n"
	]
]

runSpotCheck[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "W15"}], output = FileNameJoin[{resultRoot, "W15", "w151-spot-check.wl"}]},
	With[{rows = Select[ReadList[FileNameJoin[{methodRoot, "real-domain-audit.wl"}], Expression], MemberQ[spotKeys, #["key"]]&], completed = readCompleted[output]},
		If[ Length[rows] =!= Length[spotKeys],
			Print["Could not find every W15.1 spot-check row"];
			Exit[3]
		];
		Block[{$realAuditAttempts = {1, 2, 3, 4, 5}, $minimumValidSamples = 3, $sampleTimeLimit = 600},
			Scan[
				Function[row,
					If[ ! TrueQ[completed[row["key"]]],
						Print["W15.1 spot-checking ", row["key"]];
						With[{result = boundedSpotRow[row]},
							If[ result === $Aborted,
								appendRow[output, Join[row, <|"W151Version" -> $Version, "W151Answer" -> Missing["NotStored"], "W151SafeClassification" -> "undecided", "DomainClassification" -> "undecided", "W151SafeReason" -> "spot check exceeded its bound"|>]],
								appendRow[output, result]
							]
						];
						ClearSystemCache[]
					]
				],
				rows
			]
		];
		With[{checked = ReadList[output, Expression]},
			Export[FileNameJoin[{methodRoot, "w151-spot-check.md"}], spotMarkdown[checked], "Text"];
			Print[<|"Key" -> #["key"], "Domain" -> #["DomainClassification"], "OptimalSafe" -> #["OptimalSafeClassification"], "W151Safe" -> #["W151SafeClassification"]|>& /@ checked]
		]
	]
]

runSpotArguments[_, resultRoot_String] := runSpotCheck[resultRoot]

runSpotArguments[___] := (
	Print["W15.1 spot-check arguments: RESULT_ROOT"];
	Exit[2]
)

MemoryConstrained[
	runSpotArguments @@ $ScriptCommandLine,
	3 * 1024^3,
	Print["W15.1 spot-check memory limit exceeded"];
	Exit[12]
]
