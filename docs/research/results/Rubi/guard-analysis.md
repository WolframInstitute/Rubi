# Guard analysis for the nine isolated Rubi rules

No rules have been edited. Full step evidence is in `defective-steps.md` and `.wl`.

## Rule 1176 — missing nonzero-discriminant guard

- Example: `1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4))`, after the valid quadratic substitution.
- Condition: `!GtQ[4*a - b^2/c, 0] && IntegerQ[4*p]`.
- Concrete quadratic coefficients: `a=A^2`, `b=2*A*B`, `c=B^2`; thus `b^2-4*a*c=0`.
- Assessment: **missing condition**. The existing positivity test allows zero, but the rewrite divides by `b^2-4*a*c`.

## Rule 176 — guard evaluates an infinite ratio as positive

- Example: `x/Sqrt[a + (2+2*c-2*(1+c))*x^4]`.
- Condition: `PosQ[a/b] && (GtQ[a, 0] || GtQ[b, 0])`.
- After the earlier substitution, the inverse-quadratic coefficient is `b=0`; `a/b` becomes `ComplexInfinity`.
- `Rubi`Private`PosQ[1/0]` and `PosQ[ComplexInfinity]` both return `True` on W15, with `Greater::nord` messages.
- Assessment: **condition-evaluation failure**, not a bad ArcTan rule. `D[ArcTan[Sqrt[b]*x/Sqrt[a]]/(Sqrt[a]*Sqrt[b]), x]` is `1/(a+b*x^2)` for nonzero `a,b`. The zero coefficient should have stopped the rule.

## Rule 39 — missing zero-`d` guard

- Example: `1/(x*Sqrt[2+2*a-2*(1+a)+c*x^4])`.
- Condition: `!IntegerQ[n] && (IntegerQ[m] || GtQ[-d/(b*c), 0])`.
- Concrete values: `m=-1`, `n=-1/2`, `d=0`.
- Assessment: **missing condition**. The hypergeometric rewrite has `d*(n+1)` and `(-d/(b*c))^m` in denominators, but the guard accepts `d=0`.

## Rule 37 — requires further matcher/guard review

- Example: `1/(x*Sqrt[a + (2+2*c-2*(1+c))*x^4])`.
- Condition: `NeQ[b*c-a*d, 0] && LtQ[-1, m, 0] && LeQ[-1, n, 0] && LeQ[Denominator[n], Denominator[m]] && IntLinearQ[a,b,c,d,m,n,x]`, with `p=Denominator[m]`.
- The rewrite has the factor `p/b`; the simplified constant-coefficient case admits `b=0`.
- `Rubi`Private`NeQ[0, 0]` correctly returns `False`, so a zero `b*c-a*d` assignment does **not** explain the firing by itself. A nonzero assignment may instead leave the formula's `b=0` unguarded.
- Assessment: **do not edit yet**. Preserve the current guard and obtain the exact matcher assignment before deciding whether this is a missing `b!=0` condition or a condition-evaluation problem.

## Rule 116 — infinite ratio passes the guard

- Example: `E^(n*ArcTanh[a*x])/(c-a*c*x)^(3/2)`.
- Condition: `!IntegerQ[m] && !IntegerQ[n] && !IntegerQ[p] && GtQ[b/(b*c-a*d), 0] && !GtQ[b/(b*e-a*f), 0]`.
- In the ArcTanh exponential factorization, `b*e-a*f=0` and the ratio is infinite. The second comparison should stop the rewrite but does not under W15's `Greater::nord` behavior.
- Assessment: **condition-evaluation failure** on a singular ratio. The formula itself must not be used when `b*e-a*f=0`.

## Rule 758 — missing zero-`b` guard

- Example: `1/(x^3*Sqrt[2+2*a-2*(1+a)+c*x^4])`.
- Condition: `EqQ[(m+1)/n+p+1, 0] && NeQ[m, -1]`.
- The relation holds, but the rewrite divides by the binomial coefficient `b` in the singular case.
- Assessment: **missing condition** (`b!=0`), unless the exact matcher shows a different coefficient assignment. The existing `m!=-1` guard does not address it.

## Rule 87 — singular ratio guard

- Example: `(x*Sqrt[c-a*c*x])/E^(3*ArcTanh[a*x])`.
- Condition: `!(GtQ[b/(b*c-a*d), 0] && GtQ[b/(b*e-a*f), 0]) && !LtQ[-(b*c-a*d)/d, 0]`.
- The ArcTanh factorization makes a denominator zero, producing invalid comparisons with `ComplexInfinity`.
- Assessment: **condition-evaluation failure** on a singular ratio. The rewrite should not fire with a zero normalization denominator.

## Rule 755 — missing zero-`b` guard

- Example: `x^3/Sqrt[a + (2+2*c-2*(1+c))*x^4]`.
- Condition: `EqQ[m, n-1] && NeQ[p, -1]`.
- Concrete values satisfy `m=n-1`, but the returned power rule divides by `b*n*(p+1)` with `b=0`.
- Assessment: **missing condition** (`b!=0`). The `m=n-1` and `p!=-1` conditions hold as written.

## Rule 1402 — zero-`c` defeats factorization even with a nonzero discriminant

- Example: `1/Sqrt[a + b*x^2 + (2+2*c-2*(1+c))*x^4]`.
- Condition: `NeQ[b^2-4*a*c, 0]`, with `q=Sqrt[b^2-4*a*c]`.
- Concrete quartic coefficient `c=0`; `q=Sqrt[b^2]` and one denominator `b+q` or `b-q` can be zero even though the discriminant guard passes.
- Assessment: **missing condition** excluding `c=0` (and zero `b±q` factors). `NeQ[b^2-4*a*c,0]` alone is insufficient.
