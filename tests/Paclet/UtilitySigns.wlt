Get[FileNameJoin[{Directory[], "Rubi", "Rubi.m"}]]

VerificationTest[
	{Rubi`Private`PosQ[1], Rubi`Private`PosQ[-1], Rubi`Private`NegQ[-1], Rubi`Private`NegQ[1], Rubi`Private`PosQ[x]}
	,
	{True, False, True, False, True}
	,
	TestID -> "ordinary-sign-predicates-unchanged"
]

VerificationTest[
	Quiet[{
		Rubi`Private`PosQ[ComplexInfinity], Rubi`Private`PosQ[Indeterminate], Rubi`Private`PosQ[Infinity], Rubi`Private`PosQ[-Infinity],
		Rubi`Private`NegQ[ComplexInfinity], Rubi`Private`NegQ[Indeterminate], Rubi`Private`NegQ[Infinity], Rubi`Private`NegQ[-Infinity],
		Rubi`Private`NegQ[1/(2 + 2*c - 2*(1 + c))]
	}]
	,
	{False, False, False, False, False, False, False, False, False}
	,
	TestID -> "non-finite-values-are-neither-positive-nor-negative"
]

VerificationTest[
	{
		Rubi`Private`GtQ[ComplexInfinity, 0], Rubi`Private`LtQ[ComplexInfinity, 0],
		Rubi`Private`GeQ[ComplexInfinity, 0], Rubi`Private`LeQ[ComplexInfinity, 0]
	}
	,
	{False, False, False, False}
	,
	TestID -> "ordered-comparisons-reject-complex-infinity"
]

VerificationTest[
	Quiet[{
		Rubi`Int[x/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4], x] =!= 0,
		Rubi`Int[E^(n*ArcTanh[a*x])/(c - a*c*x)^(3/2), x] =!= 0,
		Rubi`Int[(x*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x]), x] =!= 0,
		Simplify[D[Rubi`Int[1/(x*Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4]), x], x] - 1/(x*Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4])] === 0,
		Simplify[D[Rubi`Int[1/(x*Sqrt[A]), x], x] - 1/(x*Sqrt[A])] === 0
	}]
	,
	{True, True, True, True, True}
	,
	TestID -> "singular-ratio-guards-do-not-return-zero"
]
