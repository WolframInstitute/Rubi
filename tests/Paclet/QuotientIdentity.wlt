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
	Rubi`Int[0, x]
	,
	0
	,
	TestID -> "zero-integrand-is-zero"
]

VerificationTest[
	{
		Rubi`Int[(x^3*(a + b*x))/Sqrt[c*x^2], x],
		Rubi`Int[(x^2*(a + b*x))/(c*x^2)^(3/2), x]
	}
	,
	{
		(b*x^3*Sqrt[c*x^2])/(4*c) + (a*(c*x^2)^(3/2))/(3*c^2),
		(b*x^2)/(c*Sqrt[c*x^2]) + (a*x*Log[x])/(c*Sqrt[c*x^2])
	}
	,
	TestID -> "polynomial-quotient-identity-falls-through-to-algebraic-rules"
]

VerificationTest[
	Rubi`Int[(a + b*x)^2/x, x]
	,
	2*a*b*x + (b^2*x^2)/2 + a^2*Log[x]
	,
	TestID -> "rational-binomial-expansion-does-not-loop"
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

VerificationTest[
	{
		Rubi`Int[(a + b*x^3)^2/x^4, x],
		Rubi`Int[(a + b/x^2)^2*x, x],
		Rubi`Int[x^(-1 - n)*(a + b*x^n)^2, x]
	}
	,
	{
		(-(a^2/x^3) + b^2*x^3 + 6*a*b*Log[x])/3,
		-(b^2/(2*x^2)) + (a^2*x^2)/2 + 2*a*b*Log[x],
		-((a^2/x^n - b^2*x^n - 2*a*b*n*Log[x])/n)
	}
	,
	TestID -> "negative-power-normalization-does-not-fight-expansion"
]

VerificationTest[
	{
		Rubi`Int[x^2*(a + b*(c*x)^n)^p, x],
		Rubi`Int[x*(a + b*(c*x)^n)^p, x],
		Rubi`Int[(a + b*(c*x)^n)^p/x, x],
		Rubi`Int[(a + b*(c*x)^n)^p/x^2, x]
	}
	,
	{
		(x^3*(a + b*(c*x)^n)^p*Hypergeometric2F1[3/n, -p, (3 + n)/n, -((b*(c*x)^n)/a)])/(3*(1 + (b*(c*x)^n)/a)^p),
		(x^2*(a + b*(c*x)^n)^p*Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*x)^n)/a)])/(2*(1 + (b*(c*x)^n)/a)^p),
		-(((a + b*(c*x)^n)^(1 + p)*Hypergeometric2F1[1, 1 + p, 2 + p, 1 + (b*(c*x)^n)/a])/(a*n*(1 + p))),
		-(((a + b*(c*x)^n)^p*Hypergeometric2F1[-n^(-1), -p, -((1 - n)/n), -((b*(c*x)^n)/a)])/(x*(1 + (b*(c*x)^n)/a)^p))
	}
	,
	TestID -> "monomial-binomial-rules-make-progress"
]

VerificationTest[
	{
		Rubi`Int[(81 + 36*x^2 + 16*x^4)/(729 - 64*x^6), x],
		Rubi`Int[(9 - 6*x + 4*x^2)/(729 - 64*x^6), x],
		Rubi`Int[(9 + 6*x + 4*x^2)/(729 - 64*x^6), x],
		Rubi`Int[(81 + 36*x^2 + 16*x^4)/(729 - 64*x^6)^2, x]
	}
	,
	{
		ArcTanh[(2*x)/3]/6,
		ArcTan[(3 + 4*x)/(3*Sqrt[3])]/(54*Sqrt[3]) - Log[3 - 2*x]/324 + Log[3 + 2*x]/108 - Log[9 + 6*x + 4*x^2]/324,
		-1/54*ArcTan[(3 - 4*x)/(3*Sqrt[3])]/Sqrt[3] - Log[3 - 2*x]/108 + Log[3 + 2*x]/324 + Log[9 - 6*x + 4*x^2]/324,
		1/(17496*(3 - 2*x)) - 1/(17496*(3 + 2*x)) - ArcTan[(3 - 4*x)/(3*Sqrt[3])]/(13122*Sqrt[3]) + ArcTan[(3 + 4*x)/(3*Sqrt[3])]/(13122*Sqrt[3]) + ArcTanh[(2*x)/3]/8748
	}
	,
	TestID -> "polynomial-quotient-cancellation-is-not-an-identity-loop"
]
