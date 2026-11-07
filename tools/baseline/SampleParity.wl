(* Self-contained deterministic-sample parity check for W15 and v2.
   Prints one InputForm line per real corpus key; reads no project files and writes none. *)

Begin["BaselineSampleParity`"]

samplePart[key_String, attempt_Integer, index_Integer, part_String, minimum_Integer, maximum_Integer] := minimum + Mod[
	Hash[StringToByteArray[StringJoin[key, ":", ToString[attempt], ":", ToString[index], ":", part], "UTF-8"], "SHA256"],
	maximum - minimum + 1
]

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

keys = {
	"1 Algebraic functions/1.1 Binomial products/1.1.1 Linear/1.1.1.2 (a+b x)^m (c+d x)^n.m/1170",
	"1 Algebraic functions/1.2 Trinomial products/1.2.3 General/1.2.3.2 (d x)^m (a+b x^n+c x^(2 n))^p.m/385",
	"4 Trig functions/4.1 Sine/4.1.1.2 (g cos)^p (a+b sin)^m.m/585",
	"4 Trig functions/4.1 Sine/4.1.10 (c+d x)^m (a+b sin)^n.m/250",
	"4 Trig functions/4.2 Cosine/4.2.2.1 (a+b cos)^m (c+d cos)^n.m/217",
	"Blake/Blake_Problems.m/1",
	"BlakeRational/Blake_Integrate_Rational_Tests.txt/1",
	"Hebisch/Hebisch_Problems.m/1"
}

Scan[
	Function[key, Print[ToString[InputForm[key -> {sampleValues[key, 3, 1], sampleValues[key, 3, 17]}], PageWidth -> Infinity]]],
	keys
]

End[]
