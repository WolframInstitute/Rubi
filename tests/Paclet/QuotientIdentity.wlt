Get[FileNameJoin[{Directory[], "Rubi", "Rubi.m"}]]

VerificationTest[
	{
		Rubi`Int[1/(x*Sqrt[A]), x],
		Simplify[D[Rubi`Int[1/(x*Sqrt[A]), x], x] - 1/(x*Sqrt[A])]
	}
	,
	{Log[x]/Sqrt[A], 0}
	,
	TestID -> "polynomial-quotient-identity-preserves-constant-reciprocal"
]

VerificationTest[
	{
		Rubi`Int[(x^3*(a + b*x))/Sqrt[c*x^2], x],
		Rubi`Int[(x^2*(a + b*x))/(c*x^2)^(3/2), x]
	}
	,
	{
		(a*x^2*Sqrt[c*x^2])/(3*c) + (b*x^3*Sqrt[c*x^2])/(4*c),
		(b*x^2)/(c*Sqrt[c*x^2]) + (a*x*Log[x])/(c*Sqrt[c*x^2])
	}
	,
	TestID -> "polynomial-quotient-identity-falls-through-to-algebraic-rules"
]

VerificationTest[
	{
		Rubi`Int[x^2/(Sqrt[c*x^2]*(a + b*x)), x],
		Rubi`Int[x^2/((c*x^2)^(3/2)*(a + b*x)), x]
	}
	,
	{
		Sqrt[c*x^2]/(b*c) - (a*Sqrt[c*x^2]*Log[a + b*x])/(b^2*c*x),
		(x*Log[x])/(a*c*Sqrt[c*x^2]) - (x*Log[a + b*x])/(a*c*Sqrt[c*x^2])
	}
	,
	TestID -> "polynomial-quotient-identity-falls-through-to-logarithmic-rules"
]
