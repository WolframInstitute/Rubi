Get[FileNameJoin[{Directory[], "tools", "baseline", "Baseline.wl"}]]

VerificationTest[Baseline`BaselineOptimalAnswer[{x, x, x^2 / 2}], x^2 / 2, TestID -> "optimal-three-field-record"]

VerificationTest[Baseline`BaselineOptimalAnswer[{x, x, 12, x^2 / 2}], x^2 / 2, TestID -> "optimal-four-field-record"]

VerificationTest[Baseline`BaselineOptimalAnswer[{x, x, 12, x^2 + x + 1, x}], x, TestID -> "optimal-smallest-alternative"]

VerificationTest[
	With[{expressions = {1/2, Sqrt[x], Exp[x], Erf[x], Hypergeometric2F1[a, b, c, x], AppellF1[a, b1, b2, c, x, y], Baseline`BaselineReferenceInt[x, x], UnknownFunction[x]}},
		Baseline`BaselineFunctionType /@ expressions
	]
	,
	{1, 2, 3, 4, 5, 6, 8, 9}
	,
	TestID -> "function-class-pattern-clauses"
]

VerificationTest[Baseline`BaselineFunctionType[Power[2, 1/2]], 1, TestID -> "numeric-radical-is-rational-class"]

VerificationTest[Baseline`BaselineGradeAnswer[x, x]["Grade"], "A", TestID -> "grade-a"]

VerificationTest[Baseline`BaselineGradeAnswer[Sin[x] + Cos[x] + Tan[x] + Cot[x], Sin[x]]["Grade"], "B", TestID -> "grade-b-size"]

VerificationTest[Baseline`BaselineGradeAnswer[Erf[x], x]["Grade"], "C", TestID -> "grade-c-function-class"]

VerificationTest[Baseline`BaselineGradeAnswer[I x, x]["Grade"], "C", TestID -> "grade-c-complex"]

VerificationTest[
	Baseline`Baseline`PackagePrivate`sampleValues["test/key", 2, 1]
	,
	{63/110, 4/5}
	,
	TestID -> "sample-values-match-independent-utf8-sha256"
]

VerificationTest[
	Baseline`Baseline`PackagePrivate`sampleValues["test/key", 1, 17]
	,
	{107/120 + 2 I/5}
	,
	TestID -> "complex-sample-values-match-independent-utf8-sha256"
]

VerificationTest[
	With[{checked = Baseline`BaselineVerifyAnswer[Sin[x], -Cos[x], x, "test/exact"]},
		{checked["Correct"], checked["Method"]}
	]
	,
	{True, "exact"}
	,
	TestID -> "verify-exact-derivative"
]

VerificationTest[
	With[{checked = Baseline`BaselineVerifyAnswer[Sin[x], ConditionalExpression[-Cos[x], x > 0], x, "test/conditional"]},
		checked["Correct"]
	]
	,
	True
	,
	TestID -> "verify-conditional-answer"
]

VerificationTest[
	With[{row = Baseline`BaselineRunRecord[Baseline`W15Method, "Test", "Exact.m", 1, {Sin[x], x, 0, -Cos[x]}]},
		{row["grade"], row["outcome"], row["correct"], row["verificationMethod"], row["method"]}
	]
	,
	{"A", "solved", True, "exact", "W15"}
	,
	TestID -> "run-exact-record"
]

VerificationTest[
	WithCleanup[
		Rubi`Int[x^2, x] := x^2 / 2;
		With[{row = Baseline`BaselineRunRecord[Baseline`RubiMethod, "Test", "Wrong.m", 1, {x^2, x, 0, x^3 / 3}]},
			{row["grade"], row["outcome"], row["correct"], row["verificationMethod"], StringQ[row["answer"]]}
		]
		,
		Clear[Rubi`Int]
	]
	,
	{"F", "wrong", False, "numeric", True}
	,
	TestID -> "run-wrong-record-retains-evidence"
]

VerificationTest[
	With[{row = Baseline`BaselineRunRecord[Baseline`W15Method, "Test", "Unresolved.m", 1, {Integrate[f[x], x], x, 0, Baseline`BaselineReferenceInt[f[x], x]}]},
		{row["grade"], row["outcome"], row["correct"], row["verificationMethod"]}
	]
	,
	{"A", "expected-unresolved", True, "reference-unevaluated"}
	,
	TestID -> "run-expected-unresolved-record"
]

VerificationTest[
	With[{
		row = Baseline`BaselineCanonicalRow[
			<|"section" -> " Algebraic functions", "file" -> "Example.m", "index" -> 7, "key" -> " Algebraic functions/Example.m/7", "grade" -> "B"|>,
			{"1 Algebraic functions", "Blake"}
		]
	},
		{row["section"], row["key"], row["grade"]}
	]
	,
	{"1 Algebraic functions", "1 Algebraic functions/Example.m/7", "B"}
	,
	TestID -> "canonicalize-legacy-section-key"
]

VerificationTest[
	With[{row = Baseline`BaselineCanonicalRow[<|"section" -> "Blake", "file" -> "Blake_Problems.m", "index" -> 9, "key" -> "Blake/Blake_Problems.m/9"|>, {"1 Algebraic functions", "Blake"}]},
		row["key"]
	]
	,
	"Blake/Blake_Problems.m/9"
	,
	TestID -> "canonical-row-remains-unchanged"
]

VerificationTest[
	With[{inventory = Get[FileNameJoin[{Directory[], "tests", "Abbasi", "generated", "native-inventory.wl"}]]},
		With[{sections = #["section"]& /@ inventory["files"]},
			{
				inventory["nativeRecords"] + inventory["addedRecords"],
				AllTrue[sections, Function[section, StringTrim[section] === section]],
				MemberQ[sections, "0 Independent test suites"],
				MemberQ[sections, "1 Algebraic functions"]
			}
		]
	]
	,
	{85842, True, True, True}
	,
	TestID -> "inventory-uses-canonical-sections"
]
