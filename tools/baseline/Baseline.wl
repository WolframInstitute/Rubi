Package["Baseline`"]

PackageExport["BaselineRunRecord"]

PackageExport["BaselineFunctionType"]

PackageExport["BaselineGradeAnswer"]

PackageExport["BaselineVerifyAnswer"]

PackageExport["BaselineOptimalAnswer"]

PackageExport["BaselineCanonicalRow"]

PackageExport["BaselineReferenceInt"]

PackageExport["W15Method"]

PackageExport["RubiMethod"]

BaselineRunRecord::usage = "BaselineRunRecord[method, section, file, index, record] integrates, verifies and grades one three-, four- or five-field corpus record using W15Method or RubiMethod."

BaselineFunctionType::usage = "BaselineFunctionType[expression] gives the Abbasi-style function class of expression as an integer from 1 through 9."

BaselineGradeAnswer::usage = "BaselineGradeAnswer[answer, optimal] gives an association with the grade, reason and function classes for a verified answer."

BaselineVerifyAnswer::usage = "BaselineVerifyAnswer[integrand, answer, variable, key] differentiates answer and returns correctness, the verification method, samples and elapsed time."

BaselineOptimalAnswer::usage = "BaselineOptimalAnswer[record] gives the reference antiderivative from a three-, four- or five-field corpus record, choosing the smaller alternative when two are present."

BaselineCanonicalRow::usage = "BaselineCanonicalRow[row, sections] maps the legacy two-character section trim in an old result row to the canonical section and stable key without changing its graded evidence."

BaselineReferenceInt::usage = "BaselineReferenceInt[integrand, variable] is the inert integral head used while reading reference answers."

W15Method::usage = "W15Method is the method symbol selecting Wolfram 15 Integrate in BaselineRunRecord."

RubiMethod::usage = "RubiMethod is the method symbol selecting Rubi Int in BaselineRunRecord."

$integrationTimeLimit = 180

$verificationTimeLimit = 180

$memoryLimit = 4 * 1024^3

$unresolvedPattern = Integrate | Rubi`Int | BaselineReferenceInt | Rubi`Unintegrable | Rubi`CannotIntegrate

unresolvedQ::usage = "unresolvedQ[expression] tests whether expression contains an unresolved integral marker."

unresolvedQ[expression_] := ! FreeQ[expression, $unresolvedPattern]

inputFormString::usage = "inputFormString[expression] gives an unwrapped InputForm string for stable result storage."

inputFormString[expression_] := ToString[InputForm[expression], PageWidth -> Infinity]

legacySectionName::usage = "legacySectionName[section] reproduces the old worker's two-character section trim for canonical corpus sections."

legacySectionName[section_String] /; StringMatchQ[section, DigitCharacter.. ~~ " " ~~ ___] := StringDrop[section, 1]

legacySectionName[section_String] := section

BaselineCanonicalRow[row_Association, sections_List] := With[{aliases = Association[legacySectionName[#] -> #& /@ sections]},
	With[{section = Lookup[aliases, row["section"], row["section"]]},
		Join[row, <|"section" -> section, "key" -> recordKey[section, row["file"], row["index"]]|>]
	]
]

methodName::usage = "methodName[method] gives the stable result-table name of a method symbol."

methodName[W15Method] = "W15"

methodName[RubiMethod] = "Rubi"

integrationCall::usage = "integrationCall[method, integrand, variable] invokes the selected integration implementation."

integrationCall[W15Method, integrand_, variable_] := Integrate[integrand, variable]

integrationCall[RubiMethod, integrand_, variable_] := Rubi`Int[integrand, variable]

integrationOutcome::usage = "integrationOutcome[answer] classifies an integration result or Failure as a stable outcome string."

integrationOutcome[Failure[tag_String, _]] := Replace[tag, {"Timeout" -> "timeout", "Memory" -> "memory", _ -> "error"}]

integrationOutcome[$Failed] = "error"

integrationOutcome[answer_] /; ! FreeQ[answer, TerminatedEvaluation] := "error"

integrationOutcome[answer_] /; unresolvedQ[answer] := "unresolved"

integrationOutcome[_] = "solved"

evaluateIntegration::usage = "evaluateIntegration[method, integrand, variable] runs one bounded integration and returns its answer, outcome and elapsed time."

evaluateIntegration[method : (W15Method | RubiMethod), integrand_, variable_] := With[{started = AbsoluteTime[]},
	With[{
		answer = Catch[
			CheckAbort[
				MemoryConstrained[
					TimeConstrained[integrationCall[method, integrand, variable], $integrationTimeLimit, Failure["Timeout", <|"Operation" -> "Integration"|>]],
					$memoryLimit,
					Failure["Memory", <|"Operation" -> "Integration"|>]
				]
				,
				Failure["Abort", <|"Operation" -> "Integration"|>]
			]
			,
			_
			,
			Function[Failure["Throw", <|"Operation" -> "Integration"|>]]
		]
	},
		<|"Answer" -> answer, "Outcome" -> integrationOutcome[answer], "IntegrationTime" -> N[AbsoluteTime[] - started]|>
	]
]

functionType::usage = "functionType[expression] implements the function-class pattern clauses used by BaselineFunctionType."

functionType[_ ? AtomQ] = 1

functionType[expressions_List] := Max[functionType /@ expressions]

functionType[Power[base_, _Integer]] := functionType[base]

functionType[Power[base : (_Integer | _Rational), _Rational]] = 1

functionType[Power[base_, _Rational]] := Max[functionType[base], 2]

functionType[Power[base_, exponent_]] := Max[functionType[base], functionType[exponent], 3]

functionType[(Plus | Times)[terms__]] := Max[functionType /@ {terms}]

functionType[(Exp | Log | Sin | Cos | Tan | Cot | Sec | Csc | ArcSin | ArcCos | ArcTan | ArcCot | ArcSec | ArcCsc)[arguments__]] := Max[3, functionType /@ {arguments}]

functionType[(Sinh | Cosh | Tanh | Coth | Sech | Csch | ArcSinh | ArcCosh | ArcTanh | ArcCoth | ArcSech | ArcCsch)[arguments__]] := Max[3, functionType /@ {arguments}]

functionType[(Erf | Erfc | Erfi | FresnelS | FresnelC | ExpIntegralE | ExpIntegralEi | LogIntegral | SinIntegral | CosIntegral | SinhIntegral | CoshIntegral)[arguments__]] := Max[
	4,
	functionType /@ {arguments}
]

functionType[(Gamma | LogGamma | PolyGamma | Zeta | PolyLog | ProductLog | EllipticF | EllipticE | EllipticPi)[arguments__]] := Max[4, functionType /@ {arguments}]

functionType[(Hypergeometric1F1 | Hypergeometric2F1 | HypergeometricPFQ)[arguments__]] := Max[5, functionType /@ {arguments}]

functionType[HoldPattern[AppellF1[arguments__]]] := Max[6, functionType /@ {arguments}]

functionType[HoldPattern[RootSum[arguments__]]] := Max[7, functionType /@ {arguments}]

functionType[(Integrate | Rubi`Int | BaselineReferenceInt)[arguments__]] := Max[8, functionType /@ {arguments}]

functionType[_] = 9

BaselineFunctionType[expression_] := functionType[expression]

stripConditions::usage = "stripConditions[answer] removes ConditionalExpression wrappers before differentiation and size grading."

stripConditions[answer_] := answer /. ConditionalExpression[expression_, ___] :> expression

BaselineGradeAnswer[answer_, optimal_] := With[{answerType = BaselineFunctionType[stripConditions[answer]], optimalType = BaselineFunctionType[optimal], answerLeaves = LeafCount[answer], optimalLeaves = LeafCount[optimal]},
	Which[
		answerType > optimalType,
			<|"Grade" -> "C", "Reason" -> "higher function class: " <> ToString[answerType] <> " vs " <> ToString[optimalType], "AnswerType" -> answerType, "OptimalType" -> optimalType|>
		,
		! FreeQ[answer, Complex] && FreeQ[optimal, Complex],
			<|"Grade" -> "C", "Reason" -> "complex answer with real optimal", "AnswerType" -> answerType, "OptimalType" -> optimalType|>
		,
		answerLeaves <= 2 * optimalLeaves,
			<|"Grade" -> "A", "Reason" -> "", "AnswerType" -> answerType, "OptimalType" -> optimalType|>
		,
		True,
			<|"Grade" -> "B", "Reason" -> "answer exceeds twice optimal leaf count", "AnswerType" -> answerType, "OptimalType" -> optimalType|>
	]
]

samplePart::usage = "samplePart[key, attempt, index, part, minimum, maximum] gives a reproducible integer without kernel-dependent random state."

samplePart[key_String, attempt_Integer, index_Integer, part_String, minimum_Integer, maximum_Integer] := minimum + Mod[
	Hash[StringToByteArray[StringJoin[key, ":", ToString[attempt], ":", ToString[index], ":", part], "UTF-8"], "SHA256"],
	maximum - minimum + 1
]

sampleValues::usage = "sampleValues[key, parameterCount, attempt] gives deterministic exact-rational sample values, adding imaginary parts after sixteen real attempts."

sampleValues[key_String, parameterCount_Integer, attempt_Integer] := With[{
	realValues = Table[
		samplePart[key, attempt, index, "real-numerator", 11, 113] / samplePart[key, attempt, index, "real-denominator", 37, 127],
		{index, parameterCount}
	]
},
	If[
		attempt > 16,
		realValues + I * Table[
			samplePart[key, attempt, index, "imaginary-numerator", 1, 19] / samplePart[key, attempt, index, "imaginary-denominator", 23, 61],
			{index, parameterCount}
		],
		realValues
	]
]

numericDecision::usage = "numericDecision[samples] converts scaled residuals into a conservative numeric verification result."

numericDecision[samples_List] /; Count[samples, value_ /; value > 10^-10] >= 2 := <|"Correct" -> False, "Method" -> "numeric", "Samples" -> samples|>

numericDecision[samples_List] /; Length[samples] >= 4 && Max[samples] < 10^-20 := <|"Correct" -> True, "Method" -> "numeric", "Samples" -> samples|>

numericDecision[samples_List] := <|"Correct" -> Indeterminate, "Method" -> "numeric-undecided", "Samples" -> samples|>

sampleScale::usage = "sampleScale[numericTriple] gives a finite scaled residual for a numeric triple or Nothing for an invalid scale."

sampleScale[{integrandValue_ ? NumberQ, derivativeValue_ ? NumberQ, residualValue_ ? NumberQ}] := With[{scale = Abs[residualValue] / Max[1, Abs[integrandValue], Abs[derivativeValue]]},
	If[NumberQ[scale], scale, Nothing]
]

numericVerification::usage = "numericVerification[integrand, derivative, residual, variable, key] samples an undecided derivative residual at stable key-derived points without treating suppressed numeric messages as invalid samples."

numericVerification[integrand_, derivative_, residual_, variable_, key_String] := With[{parameters = DeleteCases[DeleteDuplicates[Cases[residual, symbol_Symbol /; Context[symbol] === "Global`", Infinity]], variable]},
	With[{numericTriples = Function[attempt, Quiet @ N[{integrand, derivative, residual} /. Thread[Join[{variable}, parameters] -> sampleValues[key, Length[parameters] + 1, attempt]], 50]] /@ Range[32]},
		With[{samples = Take[Cases[numericTriples, triple : {_ ? NumberQ, _ ? NumberQ, _ ? NumberQ} :> sampleScale[triple]], UpTo[8]]},
			numericDecision[samples]
		]
	]
]

verificationCore::usage = "verificationCore[integrand, answer, variable, key] differentiates answer and tries exact, simplified and deterministic numeric correctness checks in order."

verificationCore[integrand_, answer_, variable_, key_] := With[{value = stripConditions[answer]},
	With[{derivative = D[value, variable]},
		With[{residual = derivative - integrand},
			Which[
				residual === 0,
					<|"Correct" -> True, "Method" -> "exact", "Samples" -> {}|>
				,
				Simplify[residual] === 0,
					<|"Correct" -> True, "Method" -> "Simplify", "Samples" -> {}|>
				,
				FullSimplify[residual] === 0,
					<|"Correct" -> True, "Method" -> "FullSimplify", "Samples" -> {}|>
				,
				TrueQ[PossibleZeroQ[residual]],
					<|"Correct" -> True, "Method" -> "PossibleZeroQ", "Samples" -> {}|>
				,
				True,
					numericVerification[integrand, derivative, residual, variable, key]
			]
		]
	]
]

verificationFailure::usage = "verificationFailure[failure] converts a bounded verification Failure into an undecided verification association."

verificationFailure[Failure[tag_String, _]] := With[{method = Replace[tag, {"Timeout" -> "verification-timeout", "Memory" -> "verification-memory", _ -> "verification-error"}]},
	<|"Correct" -> Indeterminate, "Method" -> method, "Samples" -> {}|>
]

verificationFailure[_] := <|"Correct" -> Indeterminate, "Method" -> "verification-error", "Samples" -> {}|>

BaselineVerifyAnswer[integrand_, answer_, variable_, key_] := With[{started = AbsoluteTime[]},
	With[{
		result = Catch[
			CheckAbort[
				MemoryConstrained[
					TimeConstrained[verificationCore[integrand, answer, variable, key], $verificationTimeLimit, Failure["Timeout", <|"Operation" -> "Verification"|>]],
					$memoryLimit,
					Failure["Memory", <|"Operation" -> "Verification"|>]
				]
				,
				Failure["Abort", <|"Operation" -> "Verification"|>]
			]
			,
			_
			,
			Function[Failure["Throw", <|"Operation" -> "Verification"|>]]
		]
	},
		Append[Replace[result, {association_Association :> association, _ :> verificationFailure[result]}], "VerificationTime" -> N[AbsoluteTime[] - started]]
	]
]

BaselineOptimalAnswer[{_, _, optimal_}] := optimal

BaselineOptimalAnswer[{_, _, _, optimal_}] := optimal

BaselineOptimalAnswer[{_, _, _, optimal_, alternativeOptimal_}] := First[MinimalBy[{optimal, alternativeOptimal}, LeafCount]]

recordKey::usage = "recordKey[section, file, index] gives the stable corpus key for a result row."

recordKey[section_, file_, index_] := StringJoin[section, "/", file, "/", ToString[index]]

verificationFields::usage = "verificationFields[checked] converts an internal verification association into stable result-row fields."

verificationFields[checked_Association] := <|
	"correct" -> checked["Correct"],
	"verificationTime" -> checked["VerificationTime"],
	"verificationMethod" -> checked["Method"],
	"numericScales" -> inputFormString[N[checked["Samples"], 6]]
|>

baseRow::usage = "baseRow[method, section, file, index, answer, optimal, evaluated] gives fields shared by every graded result row."

baseRow[method_, section_, file_, index_, answer_, optimal_, evaluated_Association] := <|
	"key" -> recordKey[section, file, index],
	"section" -> section,
	"file" -> file,
	"index" -> index,
	"method" -> methodName[method],
	"answerSize" -> LeafCount[answer],
	"optimalSize" -> LeafCount[optimal],
	"integrationTime" -> evaluated["IntegrationTime"]
|>

storeAnswerField::usage = "storeAnswerField[outcome, answer] retains source evidence for wrong, unverified and error outcomes and omits it otherwise."

storeAnswerField[outcome_, answer_] := "answer" -> If[Replace[outcome, {("wrong" | "unverified" | "error") -> True, _ -> False}], inputFormString[answer], Missing["NotStored"]]

verifiedRow::usage = "verifiedRow[base, answer, optimal, checked] finishes a solved row according to its correctness result."

verifiedRow[base_Association, answer_, optimal_, checked_Association] /; checked["Correct"] === True := With[{grade = BaselineGradeAnswer[answer, optimal]},
	Join[
		base
		,
		verificationFields[checked]
		,
		<|
			"grade" -> grade["Grade"], "outcome" -> "solved", "expressionType" -> grade["OptimalType"], "answerType" -> grade["AnswerType"], "gradeReason" -> grade["Reason"], storeAnswerField["solved", answer]
		|>
	]
]

verifiedRow[base_Association, answer_, optimal_, checked_Association] /; checked["Correct"] === False := Join[
	base
	,
	verificationFields[checked]
	,
	<|
		"grade" -> "F",
		"outcome" -> "wrong",
		"expressionType" -> BaselineFunctionType[optimal],
		"answerType" -> BaselineFunctionType[stripConditions[answer]],
		"gradeReason" -> "derivative differs from integrand at deterministic numeric samples",
		storeAnswerField["wrong", answer]
	|>
]

verifiedRow[base_Association, answer_, optimal_, checked_Association] := Join[
	base
	,
	verificationFields[checked]
	,
	<|
		"grade" -> "F",
		"outcome" -> "unverified",
		"expressionType" -> BaselineFunctionType[optimal],
		"answerType" -> BaselineFunctionType[stripConditions[answer]],
		"gradeReason" -> "correctness could not be decided within the verification bound",
		storeAnswerField["unverified", answer]
	|>
]

unsolvedRow::usage = "unsolvedRow[base, answer, optimal, evaluated] finishes an unresolved, timeout, memory or error row without verification."

unsolvedRow[base_Association, answer_, optimal_, evaluated_Association] /; evaluated["Outcome"] === "unresolved" && unresolvedQ[optimal] := Join[
	base
	,
	<|
		"grade" -> "A",
		"outcome" -> "expected-unresolved",
		"correct" -> True,
		"verificationTime" -> 0.,
		"verificationMethod" -> "reference-unevaluated",
		"expressionType" -> BaselineFunctionType[optimal],
		"answerType" -> BaselineFunctionType[stripConditions[answer]],
		"gradeReason" -> "reference and result both contain unresolved integrals",
		"numericScales" -> "{}",
		storeAnswerField["expected-unresolved", answer]
	|>
]

unsolvedRow[base_Association, answer_, optimal_, evaluated_Association] := With[{outcome = evaluated["Outcome"]},
	Join[
		base
		,
		<|
			"grade" -> "F",
			"outcome" -> outcome,
			"correct" -> Indeterminate,
			"verificationTime" -> 0.,
			"verificationMethod" -> "not-applicable",
			"expressionType" -> BaselineFunctionType[optimal],
			"answerType" -> BaselineFunctionType[stripConditions[answer]],
			"gradeReason" -> outcome,
			"numericScales" -> "{}",
			storeAnswerField[outcome, answer]
		|>
	]
]

evaluateRecord::usage = "evaluateRecord[method, section, file, index, integrand, variable, optimal] evaluates and grades the parsed components of one corpus record."

evaluateRecord[method : (W15Method | RubiMethod), section_, file_, index_, integrand_, variable_, optimal_] := With[{evaluated = evaluateIntegration[method, integrand, variable]},
	With[{answer = evaluated["Answer"], key = recordKey[section, file, index]},
		With[{base = baseRow[method, section, file, index, answer, optimal, evaluated]},
			If[evaluated["Outcome"] === "solved", verifiedRow[base, answer, optimal, BaselineVerifyAnswer[integrand, answer, variable, key]], unsolvedRow[base, answer, optimal, evaluated]]
		]
	]
]

BaselineRunRecord[method : (W15Method | RubiMethod), section_, file_, index_, {integrand_, variable_, optimal_}] := evaluateRecord[method, section, file, index, integrand, variable, optimal]

BaselineRunRecord[method : (W15Method | RubiMethod), section_, file_, index_, {integrand_, variable_, _, optimal_}] := evaluateRecord[method, section, file, index, integrand, variable, optimal]

BaselineRunRecord[method : (W15Method | RubiMethod), section_, file_, index_, {integrand_, variable_, _, optimal_, alternativeOptimal_}] := evaluateRecord[
	method,
	section,
	file,
	index,
	integrand,
	variable,
	First[MinimalBy[{optimal, alternativeOptimal}, LeafCount]]
]
