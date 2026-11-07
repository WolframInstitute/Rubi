#!/usr/bin/env wolframscript
(* Group Rubi wrong-answer candidates by firing rule and strict correctness audit.
   Usage: wolframscript -file tools/baseline/RubiWrongRuleGroups.wls RESULT_ROOT *)

$HistoryLength = 0
$LoadShowSteps = True
$LoadElementaryFunctionRules = True

Get[FileNameJoin[{Directory[], "tools", "baseline", "AuditWrongAnswers.wls"}]]
Get[FileNameJoin[{Directory[], "Rubi", "Rubi.m"}]]

ruleApplications[integrand_, variable_] := With[{steps = MemoryConstrained[TimeConstrained[Rubi`Steps[Rubi`Int[integrand, variable], Rubi`RubiPrintInformation -> False], 300, $Aborted], 3 * 1024^3, $Aborted]},
	If[ steps === $Aborted,
		{}
		,
		DeleteDuplicatesBy[
			Cases[
				steps,
				Rubi`RubiRule[condition_, lhs_, rhs_, number_] :> <|
					"Condition" -> inputFormString[condition],
					"LeftHandSide" -> inputFormString[lhs],
					"RightHandSide" -> inputFormString[rhs],
					"Number" -> number
				|>,
				Infinity
			],
			inputFormString
		]
	]
]

groupRow[row_Association] := With[{integrand = ToExpression[row["integrand"]], variable = ToExpression[row["variable"]]},
	With[{rules = ruleApplications[integrand, variable], audited = MemoryConstrained[TimeConstrained[auditRow[row], 600, $Aborted], 3 * 1024^3, $Aborted]},
		Join[
			row,
			<|
				"AuditClassification" -> If[audited === $Aborted, "undecided", audited["Classification"]],
				"AuditReason" -> If[audited === $Aborted, "strict audit exceeded 600 seconds or 3 GiB", audited["Reason"]],
				"RuleApplications" -> rules,
				"FirstRule" -> If[rules === {}, Missing["NoRuleCaptured"], First[rules]]
			|>
		]
	]
]

firstRuleKey[row_Association] := If[AssociationQ[row["FirstRule"]], row["FirstRule"]["LeftHandSide"], "NoRuleCaptured"]

groupMarkdown[rows_List] := With[{groups = GroupBy[rows, firstRuleKey], allRules = Counts[Flatten[#["LeftHandSide"]& /@ #["RuleApplications"]& /@ rows]]},
	StringJoin[
		"# Rubi wrong-answer rule groups\n\n",
		"Strict audit counts: ", inputFormString[Counts[#["AuditClassification"]& /@ rows]], "\n\n",
		"## Most frequent rule applications\n\n",
		StringRiffle["- `" <> ToString[#] <> "` - " <> ToString[allRules[#]]& /@ Take[Keys[allRules], UpTo[20]], "\n"],
		"\n\n",
		StringRiffle[KeyValueMap[
			Function[{key, group},
				StringJoin[
					"## First rule: `", key, "`\n\n",
					"Rows: ", ToString[Length[group]], "\n\n",
					StringRiffle[
						Function[row, StringJoin["- `", row["AuditClassification"], "`: ", row["key"], " - `", row["integrand"], "`"]] /@ group,
						"\n"
					]
				]
			],
			groups
		], "\n\n"]
	]
]

runRuleGroups[resultRoot_String] := With[{methodRoot = FileNameJoin[{resultRoot, "Rubi"}], output = FileNameJoin[{resultRoot, "Rubi", "wrong-rule-groups.wl"}]},
	With[{rows = Get[FileNameJoin[{methodRoot, "wrong.wl"}]], completed = readCompleted[output]},
		Print["Rubi rule-group audit pending=", Count[rows, row_ /; ! TrueQ[completed[row["key"]]]]];
		Scan[
			Function[row,
				If[ ! TrueQ[completed[row["key"]]],
					Print["Grouping ", row["key"]];
					appendRow[output, groupRow[row]];
					ClearSystemCache[]
				]
			],
			rows
		];
		With[{grouped = ReadList[output, Expression]},
			Export[FileNameJoin[{methodRoot, "wrong-rule-groups.md"}], groupMarkdown[grouped], "Text"];
			Print["Strict audit: ", Counts[#["AuditClassification"]& /@ grouped]];
			Print["First-rule groups: ", Length[GroupBy[grouped, firstRuleKey]]]
		]
	]
]

runRuleGroupArguments[_, resultRoot_String] := runRuleGroups[resultRoot]

runRuleGroupArguments[___] := (
	Print["Rubi rule-group arguments: RESULT_ROOT"];
	Exit[2]
)

MemoryConstrained[
	runRuleGroupArguments @@ $ScriptCommandLine,
	4 * 1024^3,
	Print["Rubi rule-group memory limit exceeded"];
	Exit[12]
]
