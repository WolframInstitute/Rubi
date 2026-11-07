# Rubi on 44 W15 wrong-answer audit rows

Rubi outcome counts: <|"solved" -> 35, "unresolved" -> 7, "wrong" -> 2|>

Rubi grade counts: <|"A" -> 35, "F" -> 9|>

## 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/153

- W15 classification: `different-constant`
- Integrand: `1/((-a - b*x^2)^(1/3)*((9*a*d)/b + d*x^2))`
- W15 answer: `(27*a*b*x*AppellF1[1/2, 1/3, 1, 3/2, -((b*x^2)/a), -1/9*(b*x^2)/a])/(d*(-a - b*x^2)^(1/3)*(9*a + b*x^2)*(27*a*AppellF1[1/2, 1/3, 1, 3/2, -((b*x^2)/a), -1/9*(b*x^2)/a] - 2*b*x^2*(AppellF1[3/2, 1/3, 2, 5/2, -((b*x^2)/a), -1/9*(b*x^2)/a] + 3*AppellF1[3/2, 4/3, 1, 5/2, -((b*x^2)/a), -1/9*(b*x^2)/a])))`
- Rubi answer: `"-1/12*(Sqrt[b]*ArcTan[(Sqrt[b]*x)/(3*Sqrt[a])])/(a^(5/6)*d) - (Sqrt[b]*ArcTan[(a^(1/3) + (-a - b*x^2)^(1/3))^2/(3*a^(1/6)*Sqrt[b]*x)])/(12*a^(5/6)*d) + (Sqrt[b]*ArcTanh[(Sqrt[3]*a^(1/6)*(a^(1/3) + (-a - b*x^2)^(1/3)))/(Sqrt[b]*x)])/(4*Sqrt[3]*a^(5/6)*d)"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/425

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r)^2)`
- W15 answer: `((d*r*(a + b*Log[c*x^n]))/(d + e*x^r) + b*n*Log[d - d*x^r] - a*r*Log[d - d*x^r] + b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]))/(d^2*r^2)`
- Rubi answer: `"-((e*((x^r*(a + b*Log[c*x^n]))/(d*r*(d + e*x^r)) - (b*n*Log[d + e*x^r])/(d*e*r^2)))/d) - (((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r) - (b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2))/d"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/153

- W15 classification: `wrong-derivative`
- Integrand: `(g*x)^(-1 - m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `(-(b*f*k*m^2*n*x^m*Log[x]^2) - 2*(a*m + b*n + b*m*Log[c*x^n])*(f*k*x^m*Log[f - f/x^m] + e*Log[d*(e + f*x^m)^k]) + 2*f*k*m*x^m*Log[x]*(a*m + b*n + b*m*Log[c*x^n] + b*n*Log[f - f/x^m] - b*n*Log[1 + (f*x^m)/e]) - 2*b*f*k*n*x^m*PolyLog[2, -((f*x^m)/e)])/(2*e*g*m^2*(g*x)^m)`
- Rubi answer: `"Rubi`Private`Dist[a + b*Log[c*x^n], (f*k*x^m*((m*Log[x])/e - Log[e + f*x^m]/e))/(g*m*(g*x)^m) - Log[d*(e + f*x^m)^k]/(g*m*(g*x)^m), x] - b*n*Defer[Int][Rubi`Private`Dist[x^(-1), -((-(f*k*m*x^m*Log[x]) + f*k*x^m*Log[e + f*x^m] + e*Log[d*(e + f*x^m)^k])/(e*g*m*(g*x)^m)), x], x]"`
- Rubi grade: `F`; outcome: `unresolved`; classification: `unresolved`
- Rubi check: Rubi integration was unresolved or exceeded 180 seconds or 3 GiB
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/465

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*(c*Sec[e + f*x])^n)^p*Tan[e + f*x]^3`
- W15 answer: `((a + b*(c*Sec[e + f*x])^n)^p*((2*Hypergeometric2F1[1, 1 + p, 2 + p, 1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a]*(a + b*(c*Sqrt[Sec[e + f*x]^2])^n))/(a*n*(1 + p)) + (Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^2)/(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p))/(2*f)`
- Rubi answer: `"0"`
- Rubi grade: `F`; outcome: `wrong`; classification: `wrong-derivative`
- Rubi check: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- Rubi 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 37/50, a -> 1, b -> 17/97, c -> 27/38, e -> 14/31, f -> 37/101, n -> 108/109, p -> 15/31}", "IntegrandValue" -> "0.73874097836936700219039532665750746071290867598474962751326189008508771836568`50.", "DerivativeValue" -> "0", "ResidualValue" -> "-0.73874097836936700219039532665750746071290867598474962751326189008508771836568`50."|>`


## 6 Hyperbolic functions/6.4 Hyperbolic cotangent/6.4.7 (d hyper)^m (a+b (c coth)^n)^p.m/49

- W15 classification: `wrong-derivative`
- Integrand: `1/Sqrt[-1 - Coth[x]^2]`
- W15 answer: `(ArcSinh[(Sqrt[2]*Coth[x])/Sqrt[1 - Coth[x]^2]]*Sqrt[1 + Coth[x]^2])/(Sqrt[2]*Sqrt[-1 - Coth[x]^2])`
- Rubi answer: `"ArcTan[(Sqrt[2]*Coth[x])/Sqrt[-1 - Coth[x]^2]]/Sqrt[2]"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/130

- W15 classification: `different-constant`
- Integrand: `(3*a + b*x^2)^2/(a - b*x^2)^(4/3)`
- W15 answer: `(-3*x*(-57*a + b*x^2 + 36*a*(1 - (b*x^2)/a)^(1/3)*Hypergeometric2F1[1/3, 1/2, 3/2, (b*x^2)/a]))/(7*(a - b*x^2)^(1/3))`
- Rubi answer: `"(45*x*(a - b*x^2)^(2/3))/7 + (6*x*(3*a + b*x^2))/(a - b*x^2)^(1/3) - (54*a*Sqrt[-(b*x^2)]*((6*Sqrt[-(b*x^2)])/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3)) - (3*3^(1/4)*Sqrt[2 + Sqrt[3]]*a^(1/3)*(a^(1/3) - (a - b*x^2)^(1/3))*Sqrt[(a^(2/3) + a^(1/3)*(a - b*x^2)^(1/3) + (a - b*x^2)^(2/3))/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))^2]*EllipticE[ArcSin[((1 + Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))], -7 + 4*Sqrt[3]])/(Sqrt[-(b*x^2)]*Sqrt[-((a^(1/3)*(a^(1/3) - (a - b*x^2)^(1/3)))/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))^2)]) + (2*Sqrt[2]*3^(3/4)*a^(1/3)*(a^(1/3) - (a - b*x^2)^(1/3))*Sqrt[(a^(2/3) + a^(1/3)*(a - b*x^2)^(1/3) + (a - b*x^2)^(2/3))/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))^2]*EllipticF[ArcSin[((1 + Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))], -7 + 4*Sqrt[3]])/(Sqrt[-(b*x^2)]*Sqrt[-((a^(1/3)*(a^(1/3) - (a - b*x^2)^(1/3)))/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))^2)])))/(7*b*x)"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/322

- W15 classification: `wrong-derivative`
- Integrand: `1/((a + b*x^2)^(1/4)*(c + d*x^2))`
- W15 answer: `(-6*a*c*x*AppellF1[1/2, 1/4, 1, 3/2, -((b*x^2)/a), -((d*x^2)/c)])/((a + b*x^2)^(1/4)*(c + d*x^2)*(-6*a*c*AppellF1[1/2, 1/4, 1, 3/2, -((b*x^2)/a), -((d*x^2)/c)] + x^2*(4*a*d*AppellF1[3/2, 1/4, 2, 5/2, -((b*x^2)/a), -((d*x^2)/c)] + b*c*AppellF1[3/2, 5/4, 1, 5/2, -((b*x^2)/a), -((d*x^2)/c)])))`
- Rubi answer: `"(Sqrt[-((b*x^2)/a)]*((a^(1/4)*EllipticPi[-((Sqrt[a]*Sqrt[d])/Sqrt[-(b*c) + a*d]), ArcSin[(a + b*x^2)^(1/4)/a^(1/4)], -1])/(Sqrt[d]*Sqrt[-(b*c) + a*d]) - (a^(1/4)*EllipticPi[(Sqrt[a]*Sqrt[d])/Sqrt[-(b*c) + a*d], ArcSin[(a + b*x^2)^(1/4)/a^(1/4)], -1])/(Sqrt[d]*Sqrt[-(b*c) + a*d])))/x"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 1 Algebraic functions/1.1 Binomial products/1.1.3 General/1.1.3.4 (e x)^m (a+b x^n)^p (c+d x^n)^q.m/826

- W15 classification: `different-constant`
- Integrand: `((a + b/x^2)^p*(c + d/x^2)^q)/x^3`
- W15 answer: `-1/2*((a + b/x^2)^p*(c + d/x^2)^q*(d + c*x^2)*(1 + (c*x^2)/d)^p*Hypergeometric2F1[-p, -1 - p - q, -p - q, ((b*c - a*d)*x^2)/(b*(d + c*x^2))])/(d*(1 + p + q)*x^2*(1 + (a*x^2)/b)^p)`
- Rubi answer: `"-1/2*((a + b/x^2)^(1 + p)*(c + d/x^2)^q*Hypergeometric2F1[1 + p, -q, 2 + p, -((d*(a + b/x^2))/(b*c - a*d))])/(b*(1 + p)*((b*(c + d/x^2))/(b*c - a*d))^q)"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/426

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r)^3)`
- W15 answer: `((d^2*r*(a + b*Log[c*x^n]))/(d + e*x^r)^2 + (d*(-(b*n) + 2*a*r + 2*b*r*Log[c*x^n]))/(d + e*x^r) + 3*b*n*Log[d - d*x^r] - 2*a*r*Log[d - d*x^r] + 2*b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + 2*b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]))/(2*d^3*r^2)`
- Rubi answer: `"((a + b*Log[c*x^n])/(r*(d + e*x^r)^2) - (b*n*(1/(d*(d + e*x^r)) + (r*Log[x])/d^2 - Log[d + e*x^r]/d^2))/r^2)/(2*d) - ((e*((x^r*(a + b*Log[c*x^n]))/(d*r*(d + e*x^r)) - (b*n*Log[d + e*x^r])/(d*e*r^2)))/d + (((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r) - (b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2))/d)/d"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/154

- W15 classification: `wrong-derivative`
- Integrand: `(g*x)^(-1 - 2*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `(-2*a*e*f*k*m*x^m - 3*b*e*f*k*n*x^m + b*f^2*k*m^2*n*x^(2*m)*Log[x]^2 - 2*b*e*f*k*m*x^m*Log[c*x^n] + 2*a*f^2*k*m*x^(2*m)*Log[f - f/x^m] + b*f^2*k*n*x^(2*m)*Log[f - f/x^m] + 2*b*f^2*k*m*x^(2*m)*Log[c*x^n]*Log[f - f/x^m] - 2*a*e^2*m*Log[d*(e + f*x^m)^k] - b*e^2*n*Log[d*(e + f*x^m)^k] - 2*b*e^2*m*Log[c*x^n]*Log[d*(e + f*x^m)^k] - f^2*k*m*x^(2*m)*Log[x]*(2*a*m + b*n + 2*b*m*Log[c*x^n] + 2*b*n*Log[f - f/x^m] - 2*b*n*Log[1 + (f*x^m)/e]) + 2*b*f^2*k*n*x^(2*m)*PolyLog[2, -((f*x^m)/e)])/(4*e^2*g*m^2*(g*x)^(2*m))`
- Rubi answer: `"Rubi`Private`Dist[a + b*Log[c*x^n], -1/2*(f*k*x^(2*m)*(1/(e*x^m) + (f*m*Log[x])/e^2 - (f*Log[e + f*x^m])/e^2))/(g*m*(g*x)^(2*m)) - Log[d*(e + f*x^m)^k]/(2*g*m*(g*x)^(2*m)), x] - b*n*Defer[Int][Rubi`Private`Dist[x^(-1), -1/2*(e*f*k*x^m + f^2*k*m*x^(2*m)*Log[x] - f^2*k*x^(2*m)*Log[e + f*x^m] + e^2*Log[d*(e + f*x^m)^k])/(e^2*g*m*(g*x)^(2*m)), x], x]"`
- Rubi grade: `F`; outcome: `unresolved`; classification: `unresolved`
- Rubi check: Rubi integration was unresolved or exceeded 180 seconds or 3 GiB
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## Blake/Blake_Problems.m/2066

- W15 classification: `wrong-derivative`
- Integrand: `(b + a*x^6)/(x^6*(-b + a*x^3)*(b*x + a*x^4)^(1/4))`
- W15 answer: `(4*((b + a*x^3)^2 - (7*a*(a + b)*x^6*(1 + (a*x^3)/b)^(1/4)*Hypergeometric2F1[1/4, 1/4, 5/4, (-2*a*x^3)/(b - a*x^3)])/(1 - (a*x^3)/b)^(1/4)))/(21*b^2*x^5*(x*(b + a*x^3))^(1/4))`
- Rubi answer: `"(4*(b + a*x^3))/(21*b*x^5*(b*x + a*x^4)^(1/4)) + (4*a*(b + a*x^3))/(21*b^2*x^2*(b*x + a*x^4)^(1/4)) - ((a + b)*x^(1/4)*(b + a*x^3)^(1/4)*((2^(3/4)*a^(3/4)*ArcTan[(2^(1/4)*a^(1/4)*x^(3/4))/(b + a*x^3)^(1/4)])/b + (2^(3/4)*a^(3/4)*ArcTanh[(2^(1/4)*a^(1/4)*x^(3/4))/(b + a*x^3)^(1/4)])/b))/(3*b*(b*x + a*x^4)^(1/4))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/355

- W15 classification: `wrong-derivative`
- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n]))/(d + e*x^m)`
- W15 answer: `((f*x)^m*(-(b*m^2*n*Log[x]^2) + a*m*Log[d - d*x^m] + b*m*Log[c*x^n]*Log[d - d*x^m] - b*n*Log[-((e*x^m)/d)]*Log[d + e*x^m] + m*Log[x]*(a*m + b*m*Log[c*x^n] - b*n*Log[d - d*x^m] + b*n*Log[d + e*x^m]) - b*n*PolyLog[2, 1 + (e*x^m)/d]))/(e*f*m^2*x^m)`
- Rubi answer: `"x^(1 - m)*(f*x)^(-1 + m)*(((a + b*Log[c*x^n])*Log[1 + (e*x^m)/d])/(e*m) + (b*n*PolyLog[2, -((e*x^m)/d)])/(e*m^2))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/363

- W15 classification: `wrong-derivative`
- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)`
- W15 answer: `((f*x)^m*(3*a^2*m^3*Log[x] - 6*a*b*m^3*n*Log[x]^2 + 4*b^2*m^3*n^2*Log[x]^3 + 6*a*b*m^3*Log[x]*Log[c*x^n] - 6*b^2*m^3*n*Log[x]^2*Log[c*x^n] + 3*b^2*m^3*Log[x]*Log[c*x^n]^2 + 3*b^2*m^2*n^2*Log[x]^2*Log[1 + d/(e*x^m)] + 3*a^2*m^2*Log[d - d*x^m] - 6*a*b*m^2*n*Log[x]*Log[d - d*x^m] + 3*b^2*m^2*n^2*Log[x]^2*Log[d - d*x^m] + 6*a*b*m^2*Log[c*x^n]*Log[d - d*x^m] - 6*b^2*m^2*n*Log[x]*Log[c*x^n]*Log[d - d*x^m] + 3*b^2*m^2*Log[c*x^n]^2*Log[d - d*x^m] + 6*a*b*m^2*n*Log[x]*Log[d + e*x^m] - 6*b^2*m^2*n^2*Log[x]^2*Log[d + e*x^m] - 6*a*b*m*n*Log[-((e*x^m)/d)]*Log[d + e*x^m] + 6*b^2*m*n^2*Log[x]*Log[-((e*x^m)/d)]*Log[d + e*x^m] + 6*b^2*m^2*n*Log[x]*Log[c*x^n]*Log[d + e*x^m] - 6*b^2*m*n*Log[-((e*x^m)/d)]*Log[c*x^n]*Log[d + e*x^m] - 6*b^2*m*n^2*Log[x]*PolyLog[2, -(d/(e*x^m))] - 6*b*m*n*(a - b*n*Log[x] + b*Log[c*x^n])*PolyLog[2, 1 + (e*x^m)/d] - 6*b^2*n^2*PolyLog[3, -(d/(e*x^m))]))/(3*e*f*m^3*x^m)`
- Rubi answer: `"x^(1 - m)*(f*x)^(-1 + m)*(((a + b*Log[c*x^n])^2*Log[1 + (e*x^m)/d])/(e*m) + (2*b*n*(((a + b*Log[c*x^n])*PolyLog[2, -((e*x^m)/d)])/m - (b*n*PolyLog[3, -((e*x^m)/d)])/m^2))/(e*m))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/155

- W15 classification: `wrong-derivative`
- Integrand: `(g*x)^(-1 - 3*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `(-6*a*e^2*f*k*m*x^m - 5*b*e^2*f*k*n*x^m + 12*a*e*f^2*k*m*x^(2*m) + 16*b*e*f^2*k*n*x^(2*m) - 6*b*f^3*k*m^2*n*x^(3*m)*Log[x]^2 - 6*b*e^2*f*k*m*x^m*Log[c*x^n] + 12*b*e*f^2*k*m*x^(2*m)*Log[c*x^n] - 12*a*f^3*k*m*x^(3*m)*Log[f - f/x^m] - 4*b*f^3*k*n*x^(3*m)*Log[f - f/x^m] - 12*b*f^3*k*m*x^(3*m)*Log[c*x^n]*Log[f - f/x^m] - 12*a*e^3*m*Log[d*(e + f*x^m)^k] - 4*b*e^3*n*Log[d*(e + f*x^m)^k] - 12*b*e^3*m*Log[c*x^n]*Log[d*(e + f*x^m)^k] + 4*f^3*k*m*x^(3*m)*Log[x]*(3*a*m + b*n + 3*b*m*Log[c*x^n] + 3*b*n*Log[f - f/x^m] - 3*b*n*Log[1 + (f*x^m)/e]) - 12*b*f^3*k*n*x^(3*m)*PolyLog[2, -((f*x^m)/e)])/(36*e^3*g*m^2*(g*x)^(3*m))`
- Rubi answer: `"Rubi`Private`Dist[a + b*Log[c*x^n], -1/6*(f*k*x^(3*m)*(1/(e*x^(2*m)) - (2*f)/(e^2*x^m) - (2*f^2*m*Log[x])/e^3 + (2*f^2*Log[e + f*x^m])/e^3))/(g*m*(g*x)^(3*m)) - Log[d*(e + f*x^m)^k]/(3*g*m*(g*x)^(3*m)), x] - b*n*Defer[Int][Rubi`Private`Dist[x^(-1), -1/6*(e^2*f*k*x^m - 2*e*f^2*k*x^(2*m) - 2*f^3*k*m*x^(3*m)*Log[x] + 2*f^3*k*x^(3*m)*Log[e + f*x^m] + 2*e^3*Log[d*(e + f*x^m)^k])/(e^3*g*m*(g*x)^(3*m)), x], x]"`
- Rubi grade: `F`; outcome: `unresolved`; classification: `unresolved`
- Rubi check: Rubi integration was unresolved or exceeded 180 seconds or 3 GiB
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.2 Exponentials of inverse hyperbolic cotangent functions.m/731

- W15 classification: `wrong-derivative`
- Integrand: `E^(2*ArcCoth[a*x])*x^m*Sqrt[c - a^2*c*x^2]`
- W15 answer: `(x^(1 + m)*((2*Sqrt[1 - a*x]*Sqrt[-(c*(1 + a*x))]*AppellF1[1 + m, 1/2, -1/2, 2 + m, a*x, -(a*x)])/(Sqrt[-1 + a*x]*Sqrt[1 + a*x]) + (Sqrt[c - a^2*c*x^2]*Hypergeometric2F1[-1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/Sqrt[1 - a^2*x^2]))/(1 + m)`
- Rubi answer: `"c*((x^(1 + m)*Sqrt[c - a^2*c*x^2])/(c*(2 + m)) - ((3 + 2*m)*x^(1 + m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/((1 + m)*(2 + m)*Sqrt[c - a^2*c*x^2]) - (2*a*x^(2 + m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (2 + m)/2, (4 + m)/2, a^2*x^2])/((2 + m)*Sqrt[c - a^2*c*x^2]))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/364

- W15 classification: `wrong-derivative`
- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^2`
- W15 answer: `((f*x)^m*(-((m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)) - (2*a*b*m*n*Log[d - d*x^m])/d + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - d*x^m])/d + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + (e*x^m)/d]))/d))/(e*f*m^3*x^m)`
- Rubi answer: `"-(x^(1 - m)*(f*x)^(-1 + m)*((a + b*Log[c*x^n])^2/(e*m*(d + e*x^m)) + (2*b*n*(((a + b*Log[c*x^n])*Log[1 + d/(e*x^m)])/(d*m) - (b*n*PolyLog[2, -(d/(e*x^m))])/(d*m^2)))/(e*m)))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/741

- W15 classification: `wrong-derivative`
- Integrand: `(d + e*x)^(-2 - 2*p)*(a + c*x^2)^p`
- W15 answer: `((-Sqrt[-a] + Sqrt[c]*x)*(d + e*x)^(-1 - 2*p)*(a + c*x^2)^p*(1 - (c*(d + e*x))/(c*d + Sqrt[-a]*Sqrt[c]*e))^p*Hypergeometric2F1[-1 - 2*p, -p, -2*p, (2*Sqrt[-a]*Sqrt[c]*(d + e*x))/((Sqrt[c]*d - Sqrt[-a]*e)*(Sqrt[-a] - Sqrt[c]*x))])/((Sqrt[c]*d + Sqrt[-a]*e)*(1 + 2*p)*(1 - (c*(d + e*x))/(c*d - Sqrt[-a]*Sqrt[c]*e))^p)`
- Rubi answer: `"-(((Sqrt[-a] - Sqrt[c]*x)*(d + e*x)^(-1 - 2*p)*(a + c*x^2)^p*Hypergeometric2F1[-1 - 2*p, -p, -2*p, (2*Sqrt[-a]*Sqrt[c]*(d + e*x))/((Sqrt[c]*d - Sqrt[-a]*e)*(Sqrt[-a] - Sqrt[c]*x))])/((Sqrt[c]*d + Sqrt[-a]*e)*(1 + 2*p)*(-(((Sqrt[c]*d + Sqrt[-a]*e)*(Sqrt[-a] + Sqrt[c]*x))/((Sqrt[c]*d - Sqrt[-a]*e)*(Sqrt[-a] - Sqrt[c]*x))))^p))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/365

- W15 classification: `wrong-derivative`
- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^3`
- W15 answer: `((f*x)^m*((2*b*m*n*(a + b*Log[c*x^n]))/(d*(d + e*x^m)) - (m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)^2 - (2*a*b*m*n*Log[d - d*x^m])/d^2 + (2*b^2*n^2*Log[d - d*x^m])/d^2 + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - d*x^m])/d^2 + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + (e*x^m)/d]))/d^2))/(2*e*f*m^3*x^m)`
- Rubi answer: `"-1/2*(x^(1 - m)*(f*x)^(-1 + m)*((a + b*Log[c*x^n])^2/(e*m*(d + e*x^m)^2) + (2*b*n*((e*((x^m*(a + b*Log[c*x^n]))/(d*m*(d + e*x^m)) - (b*n*Log[d + e*x^m])/(d*e*m^2)))/d + (((a + b*Log[c*x^n])*Log[1 + d/(e*x^m)])/(d*m) - (b*n*PolyLog[2, -(d/(e*x^m))])/(d*m^2))/d))/(e*m)))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 4 Trig functions/4.5 Secant/4.5.1.3 (d sin)^n (a+b sec)^m.m/285

- W15 classification: `wrong-derivative`
- Integrand: `(a + a*Sec[c + d*x])/(e*Csc[c + d*x])^(3/2)`
- W15 answer: `(a*e*Sec[(c + d*x)/2]^2*(1 + Sec[c + d*x])*(-10*Cot[c + d*x]^2 + (2*(3 + Cot[c + d*x]*Csc[c + d*x])*(5*Cot[c + d*x]^2*Hypergeometric2F1[1/4, 3/4, 5/4, -Tan[c + d*x]^2] + 3*Hypergeometric2F1[5/4, 5/4, 9/4, -Tan[c + d*x]^2])*Sec[c + d*x]*(Sec[c + d*x]^2)^(1/4))/(3 + Cot[c + d*x]^2*Sqrt[Sec[c + d*x]^2])))/(30*d*(e*Csc[c + d*x])^(5/2))`
- Rubi answer: `"((3*a*(ArcTan[Sqrt[-Sin[c + d*x]]] + ArcTanh[Sqrt[-Sin[c + d*x]]] - 2*Sqrt[-Sin[c + d*x]]))/d - (2*a*Cos[c + d*x]*Sqrt[-Sin[c + d*x]])/d - (2*a*EllipticF[(c - Pi/2 + d*x)/2, 2]*Sqrt[Sin[c + d*x]])/(d*Sqrt[-Sin[c + d*x]]))/(3*e*Sqrt[e*Csc[c + d*x]]*Sqrt[-Sin[c + d*x]])"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/245

- W15 classification: `wrong-derivative`
- Integrand: `1/(Sqrt[e*Cot[c + d*x]]*(a + a*Sec[c + d*x]))`
- W15 answer: `-1/6*(Csc[c + d*x]*(24*Cot[c + d*x]^2*Hypergeometric2F1[-1/2, -1/4, 3/4, -Tan[c + d*x]^2] + 8*Hypergeometric2F1[1/2, 3/4, 7/4, -Tan[c + d*x]^2] - 3*Cot[c + d*x]^(3/2)*(2*Sqrt[2]*ArcTan[1 - Sqrt[2]*Sqrt[Cot[c + d*x]]] - 2*Sqrt[2]*ArcTan[1 + Sqrt[2]*Sqrt[Cot[c + d*x]]] + 8*Sqrt[Cot[c + d*x]] + Sqrt[2]*Log[1 - Sqrt[2]*Sqrt[Cot[c + d*x]] + Cot[c + d*x]] - Sqrt[2]*Log[1 + Sqrt[2]*Sqrt[Cot[c + d*x]] + Cot[c + d*x]]))*(1 + Sqrt[Sec[c + d*x]^2])*Sin[(c + d*x)/2]^2)/(a*d*Sqrt[e*Cot[c + d*x]])`
- Rubi answer: `"-1/4*((2*Sqrt[2]*ArcTan[1 - Sqrt[2]*Sqrt[Tan[c + d*x]]] - 2*Sqrt[2]*ArcTan[1 + Sqrt[2]*Sqrt[Tan[c + d*x]]] - Sqrt[2]*Log[1 - Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]] + Sqrt[2]*Log[1 + Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]])/d - (8*(1 - Sec[c + d*x]))/(d*Sqrt[Tan[c + d*x]]) + 8*((Cos[c + d*x]*EllipticE[c - Pi/4 + d*x, 2]*Sqrt[Tan[c + d*x]])/(d*Sqrt[Sin[2*c + 2*d*x]]) - (Cos[c + d*x]*Tan[c + d*x]^(3/2))/d))/(a*Sqrt[e*Cot[c + d*x]]*Sqrt[Tan[c + d*x]])"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 4 Trig functions/4.7 Miscellaneous/4.7.7 Trig functions.m/373

- W15 classification: `wrong-derivative`
- Integrand: `(2*a + 2*a*Cos[d + e*x] + 2*a*Sin[d + e*x])^(-4)`
- W15 answer: `(Sec[(d + e*x)/2]^6*(152 + 69*Cos[d + e*x] - 132*Cos[2*(d + e*x)] - 57*Cos[3*(d + e*x)] + 273*Sin[d + e*x] + 114*Sin[2*(d + e*x)] - 19*Sin[3*(d + e*x)]))/(3072*a^4*e*(1 + Tan[(d + e*x)/2])^3)`
- Rubi answer: `"-1/48*(Cos[d + e*x] - Sin[d + e*x])/(a*e*(a + a*Cos[d + e*x] + a*Sin[d + e*x])^3) + ((5*(a^2*Cos[d + e*x] - a^2*Sin[d + e*x]))/(e*(a^2 + a^2*Cos[d + e*x] + a^2*Sin[d + e*x])^2) - ((24*Log[1 + Tan[(d + e*x)/2]])/e + (19*(a^3*Cos[d + e*x] - a^3*Sin[d + e*x]))/(e*(a^3 + a^3*Cos[d + e*x] + a^3*Sin[d + e*x])))/a^2)/(96*a^2)"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1133

- W15 classification: `wrong-derivative`
- Integrand: `E^(2*ArcTanh[a*x])*x^m*Sqrt[c - a^2*c*x^2]`
- W15 answer: `(x^(1 + m)*((-2*Sqrt[1 - a*x]*Sqrt[-(c*(1 + a*x))]*AppellF1[1 + m, 1/2, -1/2, 2 + m, a*x, -(a*x)])/(Sqrt[-1 + a*x]*Sqrt[1 + a*x]) - (Sqrt[c - a^2*c*x^2]*Hypergeometric2F1[-1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/Sqrt[1 - a^2*x^2]))/(1 + m)`
- Rubi answer: `"-(c*((x^(1 + m)*Sqrt[c - a^2*c*x^2])/(c*(2 + m)) - ((3 + 2*m)*x^(1 + m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/((1 + m)*(2 + m)*Sqrt[c - a^2*c*x^2]) - (2*a*x^(2 + m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (2 + m)/2, (4 + m)/2, a^2*x^2])/((2 + m)*Sqrt[c - a^2*c*x^2])))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/366

- W15 classification: `wrong-derivative`
- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^4`
- W15 answer: `((f*x)^m*((b*m*n*(a + b*Log[c*x^n]))/(d*(d + e*x^m)^2) - (m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)^3 + (b*n*(2*a*m - b*n + 2*b*m*Log[c*x^n]))/(d^2*(d + e*x^m)) - (2*a*b*m*n*Log[d - d*x^m])/d^3 + (3*b^2*n^2*Log[d - d*x^m])/d^3 + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - d*x^m])/d^3 + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + (e*x^m)/d]))/d^3))/(3*e*f*m^3*x^m)`
- Rubi answer: `"-1/3*(x^(1 - m)*(f*x)^(-1 + m)*((a + b*Log[c*x^n])^2/(e*m*(d + e*x^m)^3) - (b*n*(((a + b*Log[c*x^n])/(m*(d + e*x^m)^2) - (b*n*(1/(d*(d + e*x^m)) + (m*Log[x])/d^2 - Log[d + e*x^m]/d^2))/m^2)/d - (2*((e*((x^m*(a + b*Log[c*x^n]))/(d*m*(d + e*x^m)) - (b*n*Log[d + e*x^m])/(d*e*m^2)))/d + (((a + b*Log[c*x^n])*Log[1 + d/(e*x^m)])/(d*m) - (b*n*PolyLog[2, -(d/(e*x^m))])/(d*m^2))/d))/d))/(e*m)))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/430

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*Log[c*x^n])^2/(x*(d + e*x^r))`
- W15 answer: `-((a^2*r^2*Log[d - d*x^r] - 2*a*b*r^2*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - d*x^r] - 2*a*b*n*r*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 2*b^2*n*r*(n*Log[x] - Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + b^2*n^2*(r^2*Log[x]^2*Log[1 + d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, -(d/(e*x^r))] - 2*PolyLog[3, -(d/(e*x^r))]))/(d*r^3))`
- Rubi answer: `"-(((a + b*Log[c*x^n])^2*Log[1 + d/(e*x^r)])/(d*r)) + (2*b*n*(((a + b*Log[c*x^n])*PolyLog[2, -(d/(e*x^r))])/r + (b*n*PolyLog[3, -(d/(e*x^r))])/r^2))/(d*r)"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/150

- W15 classification: `wrong-derivative`
- Integrand: `(g*x)^(-1 + 3*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `((g*x)^(3*m)*(-36*a*e^2*f*k*m*x^m + 48*b*e^2*f*k*n*x^m + 18*a*e*f^2*k*m*x^(2*m) - 15*b*e*f^2*k*n*x^(2*m) - 12*a*f^3*k*m*x^(3*m) + 8*b*f^3*k*n*x^(3*m) - 36*b*e^3*k*m^2*n*Log[x]^2 - 36*b*e^2*f*k*m*x^m*Log[c*x^n] + 18*b*e*f^2*k*m*x^(2*m)*Log[c*x^n] - 12*b*f^3*k*m*x^(3*m)*Log[c*x^n] + 36*a*e^3*k*m*Log[e - e*x^m] - 12*b*e^3*k*n*Log[e - e*x^m] + 36*b*e^3*k*m*Log[c*x^n]*Log[e - e*x^m] - 36*b*e^3*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] + 12*e^3*k*m*Log[x]*(3*a*m - b*n + 3*b*m*Log[c*x^n] - 3*b*n*Log[e - e*x^m] + 3*b*n*Log[e + f*x^m]) + 36*a*f^3*m*x^(3*m)*Log[d*(e + f*x^m)^k] - 12*b*f^3*n*x^(3*m)*Log[d*(e + f*x^m)^k] + 36*b*f^3*m*x^(3*m)*Log[c*x^n]*Log[d*(e + f*x^m)^k] - 36*b*e^3*k*n*PolyLog[2, 1 + (f*x^m)/e]))/(108*f^3*g*m^2*x^(3*m))`
- Rubi answer: `"Rubi`Private`Dist[a + b*Log[c*x^n], -1/18*(k*(g*x)^(3*m)*((6*e^2*x^m)/f^2 - (3*e*x^(2*m))/f + 2*x^(3*m) - (6*e^3*Log[e + f*x^m])/f^3))/(g*m*x^(3*m)) + ((g*x)^(3*m)*Log[d*(e + f*x^m)^k])/(3*g*m), x] - b*n*Defer[Int][Rubi`Private`Dist[x^(-1), -1/18*((g*x)^(3*m)*(6*e^2*f*k*x^m - 3*e*f^2*k*x^(2*m) + 2*f^3*k*x^(3*m) - 6*e^3*k*Log[e + f*x^m] - 6*f^3*x^(3*m)*Log[d*(e + f*x^m)^k]))/(f^3*g*m*x^(3*m)), x], x]"`
- Rubi grade: `F`; outcome: `unresolved`; classification: `unresolved`
- Rubi check: Rubi integration was unresolved or exceeded 180 seconds or 3 GiB
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/246

- W15 classification: `wrong-derivative`
- Integrand: `1/((e*Cot[c + d*x])^(3/2)*(a + a*Sec[c + d*x]))`
- W15 answer: `(2*Cot[c + d*x]^2*Csc[c + d*x]*((-1)^(3/4)*(ArcTan[(-1)^(3/4)*Sqrt[Cot[c + d*x]]] - ArcTanh[(-1)^(3/4)*Sqrt[Cot[c + d*x]]])*Sqrt[Cot[c + d*x]] + 2*Hypergeometric2F1[1/4, 1/2, 5/4, -Tan[c + d*x]^2])*(1 + Sqrt[Sec[c + d*x]^2])*Sin[(c + d*x)/2]^2)/(a*d*(e*Cot[c + d*x])^(3/2))`
- Rubi answer: `"((2*Sqrt[2]*ArcTan[1 - Sqrt[2]*Sqrt[Tan[c + d*x]]] - 2*Sqrt[2]*ArcTan[1 + Sqrt[2]*Sqrt[Tan[c + d*x]]] + Sqrt[2]*Log[1 - Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]] - Sqrt[2]*Log[1 + Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]])/d + (4*EllipticF[c - Pi/4 + d*x, 2]*Sec[c + d*x]*Sqrt[Sin[2*c + 2*d*x]])/(d*Sqrt[Tan[c + d*x]]))/(4*a*(e*Cot[c + d*x])^(3/2)*Tan[c + d*x]^(3/2))"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1134

- W15 classification: `wrong-derivative`
- Integrand: `(E^(2*ArcTanh[a*x])*x^m)/Sqrt[c - a^2*c*x^2]`
- W15 answer: `(x^(1 + m)*Sqrt[1 - a^2*x^2]*AppellF1[1 + m, 3/2, -1/2, 2 + m, a*x, -(a*x)])/((1 + m)*Sqrt[-1 + a*x]*Sqrt[-(c*(1 + a*x))])`
- Rubi answer: `"(2*x^(1 + m)*(1 + a*x))/Sqrt[c - a^2*c*x^2] - ((1 + 2*m)*x^(1 + m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/((1 + m)*Sqrt[c - a^2*c*x^2]) - (2*a*(1 + m)*x^(2 + m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (2 + m)/2, (4 + m)/2, a^2*x^2])/((2 + m)*Sqrt[c - a^2*c*x^2])"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic cotangent functions.m/238

- W15 classification: `wrong-derivative`
- Integrand: `ArcCoth[c + d*Tan[a + b*x]]`
- W15 answer: `x*(ArcCoth[c + d*Tan[a + b*x]] + (2*a*Log[1 - c - d*Tan[a + b*x]] - I*Log[1 - I*Tan[a + b*x]]*Log[(-1 + c + d*Tan[a + b*x])/(-1 + c - I*d)] + I*Log[1 + I*Tan[a + b*x]]*Log[(-1 + c + d*Tan[a + b*x])/(-1 + c + I*d)] - 2*a*Log[1 + c + d*Tan[a + b*x]] + I*Log[1 - I*Tan[a + b*x]]*Log[(1 + c + d*Tan[a + b*x])/(1 + c - I*d)] - I*Log[1 + I*Tan[a + b*x]]*Log[(1 + c + d*Tan[a + b*x])/(1 + c + I*d)] + I*PolyLog[2, -((d*(-I + Tan[a + b*x]))/(-1 + c + I*d))] - I*PolyLog[2, -((d*(-I + Tan[a + b*x]))/(1 + c + I*d))] - I*PolyLog[2, -((d*(I + Tan[a + b*x]))/(-1 + c - I*d))] + I*PolyLog[2, -((d*(I + Tan[a + b*x]))/(1 + c - I*d))])/(4*a - (2*I)*Log[1 - I*Tan[a + b*x]] + (2*I)*Log[1 + I*Tan[a + b*x]]))`
- Rubi answer: `"x*ArcCoth[c + d*Tan[a + b*x]] + ((I*(1 - c) - d)*((2*x*Log[1 + ((1 - c + I*d)*E^((2*I)*a + (2*I)*b*x))/(1 - c - I*d)])/(I*(1 - c) - d) - PolyLog[2, -(((1 - c + I*d)*E^((2*I)*a + (2*I)*b*x))/(1 - c - I*d))]/(b*(1 - c + I*d))))/4 - ((I + I*c + d)*((2*x*Log[1 + ((1 + c - I*d)*E^((2*I)*a + (2*I)*b*x))/(1 + c + I*d)])/(I*(1 + c) + d) - PolyLog[2, -(((1 + c - I*d)*E^((2*I)*a + (2*I)*b*x))/(1 + c + I*d))]/(b*(1 + c - I*d))))/4"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/415

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r)^2)`
- W15 answer: `((d*r*(a + b*Log[c*x^n]))/(d + e*x^r) + b*n*Log[d - d*x^r] - a*r*Log[d - d*x^r] + b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]))/(d^2*r^2)`
- Rubi answer: `"-((e*((x^r*(a + b*Log[c*x^n]))/(d*r*(d + e*x^r)) - (b*n*Log[d + e*x^r])/(d*e*r^2)))/d) - (((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r) - (b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2))/d"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/431

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*Log[c*x^n])^2/(x*(d + e*x^r)^2)`
- W15 answer: `((d*r^2*(a + b*Log[c*x^n])^2)/(d + e*x^r) + 2*a*b*n*r*Log[d - d*x^r] - a^2*r^2*Log[d - d*x^r] + 2*a*b*r^2*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + 2*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*Log[d - d*x^r] - b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - d*x^r] - 2*b^2*n^2*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 2*a*b*n*r*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 2*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) - b^2*n^2*(r^2*Log[x]^2*Log[1 + d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, -(d/(e*x^r))] - 2*PolyLog[3, -(d/(e*x^r))]))/(d^2*r^3)`
- Rubi answer: `"((a + b*Log[c*x^n])^2/(r*(d + e*x^r)) + (2*b*n*(((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r) - (b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2)))/r)/d - (((a + b*Log[c*x^n])^2*Log[1 + d/(e*x^r)])/(d*r) - (2*b*n*(((a + b*Log[c*x^n])*PolyLog[2, -(d/(e*x^r))])/r + (b*n*PolyLog[3, -(d/(e*x^r))])/r^2))/(d*r))/d"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/151

- W15 classification: `wrong-derivative`
- Integrand: `(g*x)^(-1 + 2*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `((g*x)^(2*m)*(2*a*e*f*k*m*x^m - 3*b*e*f*k*n*x^m - a*f^2*k*m*x^(2*m) + b*f^2*k*n*x^(2*m) + 2*b*e^2*k*m^2*n*Log[x]^2 + 2*b*e*f*k*m*x^m*Log[c*x^n] - b*f^2*k*m*x^(2*m)*Log[c*x^n] - 2*a*e^2*k*m*Log[e - e*x^m] + b*e^2*k*n*Log[e - e*x^m] - 2*b*e^2*k*m*Log[c*x^n]*Log[e - e*x^m] + 2*b*e^2*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] + e^2*k*m*Log[x]*(-2*a*m + b*n - 2*b*m*Log[c*x^n] + 2*b*n*Log[e - e*x^m] - 2*b*n*Log[e + f*x^m]) + 2*a*f^2*m*x^(2*m)*Log[d*(e + f*x^m)^k] - b*f^2*n*x^(2*m)*Log[d*(e + f*x^m)^k] + 2*b*f^2*m*x^(2*m)*Log[c*x^n]*Log[d*(e + f*x^m)^k] + 2*b*e^2*k*n*PolyLog[2, 1 + (f*x^m)/e]))/(4*f^2*g*m^2*x^(2*m))`
- Rubi answer: `"Rubi`Private`Dist[a + b*Log[c*x^n], (k*(g*x)^(2*m)*((2*e*x^m)/f - x^(2*m) - (2*e^2*Log[e + f*x^m])/f^2))/(4*g*m*x^(2*m)) + ((g*x)^(2*m)*Log[d*(e + f*x^m)^k])/(2*g*m), x] - b*n*Defer[Int][Rubi`Private`Dist[x^(-1), -1/4*((g*x)^(2*m)*(-2*e*f*k*x^m + f^2*k*x^(2*m) + 2*e^2*k*Log[e + f*x^m] - 2*f^2*x^(2*m)*Log[d*(e + f*x^m)^k]))/(f^2*g*m*x^(2*m)), x], x]"`
- Rubi grade: `F`; outcome: `unresolved`; classification: `unresolved`
- Rubi check: Rubi integration was unresolved or exceeded 180 seconds or 3 GiB
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 4 Trig functions/4.1 Sine/4.1.2.2 (g cos)^p (a+b sin)^m (c+d sin)^n.m/1391

- W15 classification: `wrong-derivative`
- Integrand: `Sin[e + f*x]^2/(Sqrt[g*Cos[e + f*x]]*(a + b*Sin[e + f*x]))`
- W15 answer: `(Cos[e + f*x]^2*(a^2 - b^2 + b^2*Cos[e + f*x]^2)*(Sec[e + f*x]^2)^(3/4)*((a*Hypergeometric2F1[1/2, 3/4, 3/2, -Tan[e + f*x]^2]*Tan[e + f*x])/(a^2 - b^2) + ((a^2*Sqrt[b]*ArcTan[((-a^2 + b^2)^(1/4)*(Sec[e + f*x]^2)^(1/4))/Sqrt[b]])/(-a^2 + b^2)^(3/4) - (a^2*Sqrt[b]*ArcTanh[((-a^2 + b^2)^(1/4)*(Sec[e + f*x]^2)^(1/4))/Sqrt[b]])/(-a^2 + b^2)^(3/4) - (2*b)/(Sec[e + f*x]^2)^(1/4) + (a^3*EllipticPi[-(Sqrt[-a^2 + b^2]/b), ArcSin[(Sec[e + f*x]^2)^(1/4)], -1]*Tan[e + f*x])/((a^2 - b^2)*Sqrt[-Tan[e + f*x]^2]) + (a^3*EllipticPi[Sqrt[-a^2 + b^2]/b, ArcSin[(Sec[e + f*x]^2)^(1/4)], -1]*Tan[e + f*x])/((a^2 - b^2)*Sqrt[-Tan[e + f*x]^2]))/b^2))/(f*Sqrt[g*Cos[e + f*x]]*(a + b*Sin[e + f*x])*(a - b*Cos[e + f*x]*Sqrt[Sec[e + f*x]^2]*Sin[e + f*x]))`
- Rubi answer: `"(-2*Sqrt[g*Cos[e + f*x]])/(b*f*g) - (a*((2*Sqrt[Cos[e + f*x]]*EllipticF[(e + f*x)/2, 2])/(b*f*Sqrt[g*Cos[e + f*x]]) + (a*(((Sqrt[b]*ArcTan[(Sqrt[b]*Sqrt[g*Cos[e + f*x]])/((-a^2 + b^2)^(1/4)*Sqrt[g])])/((-a^2 + b^2)^(3/4)*Sqrt[g]) + (Sqrt[b]*ArcTanh[(Sqrt[b]*Sqrt[g*Cos[e + f*x]])/((-a^2 + b^2)^(1/4)*Sqrt[g])])/((-a^2 + b^2)^(3/4)*Sqrt[g]))/f - (a*Sqrt[Cos[e + f*x]]*EllipticPi[(2*b)/(b - Sqrt[-a^2 + b^2]), (e + f*x)/2, 2])/((a^2 - b*(b - Sqrt[-a^2 + b^2]))*f*Sqrt[g*Cos[e + f*x]]) - (a*Sqrt[Cos[e + f*x]]*EllipticPi[(2*b)/(b + Sqrt[-a^2 + b^2]), (e + f*x)/2, 2])/((a^2 - b*(b + Sqrt[-a^2 + b^2]))*f*Sqrt[g*Cos[e + f*x]])))/b))/b"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic cotangent functions.m/255

- W15 classification: `wrong-derivative`
- Integrand: `ArcCoth[c + d*Cot[a + b*x]]`
- W15 answer: `x*(ArcCoth[c + d*Cot[a + b*x]] + (2*a*Log[d + (-1 + c)*Tan[a + b*x]] + I*Log[1 + I*Tan[a + b*x]]*Log[((-I)*(d + (-1 + c)*Tan[a + b*x]))/(-1 + c - I*d)] - I*Log[1 - I*Tan[a + b*x]]*Log[(I*(d + (-1 + c)*Tan[a + b*x]))/(-1 + c + I*d)] - 2*a*Log[d + (1 + c)*Tan[a + b*x]] + I*Log[1 - I*Tan[a + b*x]]*Log[(I*(d + (1 + c)*Tan[a + b*x]))/(1 + c + I*d)] - I*Log[1 + I*Tan[a + b*x]]*Log[(d + (1 + c)*Tan[a + b*x])/(I*(1 + c) + d)] - I*PolyLog[2, ((-1 + c)*(1 - I*Tan[a + b*x]))/(-1 + c + I*d)] + I*PolyLog[2, ((1 + c)*(1 - I*Tan[a + b*x]))/(1 + c + I*d)] + I*PolyLog[2, ((-1 + c)*(1 + I*Tan[a + b*x]))/(-1 + c - I*d)] - I*PolyLog[2, ((1 + c)*(1 + I*Tan[a + b*x]))/(1 + c - I*d)])/(4*a - (2*I)*Log[1 - I*Tan[a + b*x]] + (2*I)*Log[1 + I*Tan[a + b*x]]))`
- Rubi answer: `"x*ArcCoth[c + d*Cot[a + b*x]] + ((I - I*c + d)*((2*x*Log[1 - ((1 - c - I*d)*E^((2*I)*a + (2*I)*b*x))/(1 - c + I*d)])/(I*(1 - c) + d) - PolyLog[2, ((1 - c - I*d)*E^((2*I)*a + (2*I)*b*x))/(1 - c + I*d)]/(b*(1 - c - I*d))))/4 - ((I*(1 + c) - d)*((2*x*Log[1 - ((1 + c + I*d)*E^((2*I)*a + (2*I)*b*x))/(1 + c - I*d)])/(I*(1 + c) - d) - PolyLog[2, ((1 + c + I*d)*E^((2*I)*a + (2*I)*b*x))/(1 + c - I*d)]/(b*(1 + c + I*d))))/4"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## Hebisch/Hebisch_Problems.m/2167

- W15 classification: `wrong-derivative`
- Integrand: `(9 - 6*x^2 + x^4 + (9*x + 3*x^3)/E^((3*x)/(-3 + x^2)))/((9*x - 6*x^3 + x^5)/E^((3*x)/(-3 + x^2)) + (9*x - 6*x^3 + x^5)*Log[x])`
- W15 answer: `-(Sqrt[3]*ArcTanh[x/Sqrt[3]]) + Log[1 + E^((3*x)/(-3 + x^2))*Log[x]]`
- Rubi answer: `"(3*x)/(3 - x^2) + Log[1 + Log[x]/E^((3*x)/(3 - x^2))]"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/2576

- W15 classification: `wrong-derivative`
- Integrand: `(d + e*x)^(-2 - 2*p)*(a + b*x + c*x^2)^p`
- W15 answer: `-((((e*(-b + Sqrt[b^2 - 4*a*c] - 2*c*x))/(2*c*d + (-b + Sqrt[b^2 - 4*a*c])*e))^(1 - p)*(d + e*x)^(-1 - 2*p)*(a + x*(b + c*x))^p*(1 - (2*c*(d + e*x))/(2*c*d + (-b + Sqrt[b^2 - 4*a*c])*e))^(2*p)*Hypergeometric2F1[-1 - 2*p, -p, -2*p, (-4*c*Sqrt[b^2 - 4*a*c]*(d + e*x))/((-2*c*d + (b + Sqrt[b^2 - 4*a*c])*e)*(-b + Sqrt[b^2 - 4*a*c] - 2*c*x))])/((e + 2*e*p)*((e*(b + Sqrt[b^2 - 4*a*c] + 2*c*x))/(-2*c*d + (b + Sqrt[b^2 - 4*a*c])*e))^p))`
- Rubi answer: `"((b - Sqrt[b^2 - 4*a*c] + 2*c*x)*(d + e*x)^(-1 - 2*p)*(a + b*x + c*x^2)^p*Hypergeometric2F1[-1 - 2*p, -p, -2*p, (-4*c*Sqrt[b^2 - 4*a*c]*(d + e*x))/((2*c*d - (b + Sqrt[b^2 - 4*a*c])*e)*(b - Sqrt[b^2 - 4*a*c] + 2*c*x))])/((2*c*d - (b - Sqrt[b^2 - 4*a*c])*e)*(1 + 2*p)*(((2*c*d - (b - Sqrt[b^2 - 4*a*c])*e)*(b + Sqrt[b^2 - 4*a*c] + 2*c*x))/((2*c*d - (b + Sqrt[b^2 - 4*a*c])*e)*(b - Sqrt[b^2 - 4*a*c] + 2*c*x)))^p)"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/408

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r))`
- W15 answer: `(b*n*r^2*Log[x]^2 - 2*r*(a + b*Log[c*x^n])*Log[d - d*x^r] + 2*b*n*r*Log[x]*(Log[d - d*x^r] - Log[d + e*x^r]) + 2*b*n*Log[-((e*x^r)/d)]*Log[d + e*x^r] + 2*b*n*PolyLog[2, 1 + (e*x^r)/d])/(2*d*r^2)`
- Rubi answer: `"-(((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r)) + (b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2)"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/424

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r))`
- W15 answer: `(b*n*r^2*Log[x]^2 - 2*r*(a + b*Log[c*x^n])*Log[d - d*x^r] + 2*b*n*r*Log[x]*(Log[d - d*x^r] - Log[d + e*x^r]) + 2*b*n*Log[-((e*x^r)/d)]*Log[d + e*x^r] + 2*b*n*PolyLog[2, 1 + (e*x^r)/d])/(2*d*r^2)`
- Rubi answer: `"-(((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r)) + (b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2)"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/432

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*Log[c*x^n])^2/(x*(d + e*x^r)^3)`
- W15 answer: `((d^2*r^2*(a + b*Log[c*x^n])^2)/(d + e*x^r)^2 + (2*d*r*(a + b*Log[c*x^n])*(-(b*n) + a*r + b*r*Log[c*x^n]))/(d + e*x^r) - 2*b^2*n^2*Log[d - d*x^r] + 6*a*b*n*r*Log[d - d*x^r] - 2*a^2*r^2*Log[d - d*x^r] + 4*a*b*r^2*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + 6*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*Log[d - d*x^r] - 2*b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - d*x^r] - 6*b^2*n^2*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 4*a*b*n*r*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 4*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) - 2*b^2*n^2*(r^2*Log[x]^2*Log[1 + d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, -(d/(e*x^r))] - 2*PolyLog[3, -(d/(e*x^r))]))/(2*d^3*r^3)`
- Rubi answer: `"((a + b*Log[c*x^n])^2/(r*(d + e*x^r)^2) + (2*b*n*((e*((x^r*(a + b*Log[c*x^n]))/(d*r*(d + e*x^r)) - (b*n*Log[d + e*x^r])/(d*e*r^2)))/d + (((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r) - (b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2))/d))/r)/(2*d) + (((a + b*Log[c*x^n])^2/(r*(d + e*x^r)) + (2*b*n*(((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r) - (b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2)))/r)/d - (((a + b*Log[c*x^n])^2*Log[1 + d/(e*x^r)])/(d*r) - (2*b*n*(((a + b*Log[c*x^n])*PolyLog[2, -(d/(e*x^r))])/r + (b*n*PolyLog[3, -(d/(e*x^r))])/r^2))/(d*r))/d)/d"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/152

- W15 classification: `wrong-derivative`
- Integrand: `(g*x)^(-1 + m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `-(((g*x)^m*(a*f*k*m*x^m - 2*b*f*k*n*x^m + b*e*k*m^2*n*Log[x]^2 + b*f*k*m*x^m*Log[c*x^n] - a*e*k*m*Log[e - e*x^m] + b*e*k*n*Log[e - e*x^m] - b*e*k*m*Log[c*x^n]*Log[e - e*x^m] + b*e*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] - e*k*m*Log[x]*(a*m - b*n + b*m*Log[c*x^n] - b*n*Log[e - e*x^m] + b*n*Log[e + f*x^m]) - a*f*m*x^m*Log[d*(e + f*x^m)^k] + b*f*n*x^m*Log[d*(e + f*x^m)^k] - b*f*m*x^m*Log[c*x^n]*Log[d*(e + f*x^m)^k] + b*e*k*n*PolyLog[2, 1 + (f*x^m)/e]))/(f*g*m^2*x^m))`
- Rubi answer: `"Rubi`Private`Dist[a + b*Log[c*x^n], -((k*(g*x)^m*(x^m - (e*Log[e + f*x^m])/f))/(g*m*x^m)) + ((g*x)^m*Log[d*(e + f*x^m)^k])/(g*m), x] - b*n*Defer[Int][Rubi`Private`Dist[x^(-1), -(((g*x)^m*(f*k*x^m - e*k*Log[e + f*x^m] - f*x^m*Log[d*(e + f*x^m)^k]))/(f*g*m*x^m)), x], x]"`
- Rubi grade: `F`; outcome: `unresolved`; classification: `unresolved`
- Rubi check: Rubi integration was unresolved or exceeded 180 seconds or 3 GiB
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.4 u (a+b log(c (d+e x^m)^n))^p.m/168

- W15 classification: `wrong-derivative`
- Integrand: `(f*x)^(-1 - 2*n)*Log[c*(d + e*x^n)^p]^2`
- W15 answer: `(e^2*n^2*p^2*x^(2*n)*Log[x]^2 + e^2*p^2*x^(2*n)*Log[e + d/x^n]^2 - 2*e^2*p^2*x^(2*n)*Log[e - e/x^n] - 2*e^2*p^2*x^(2*n)*Log[e + d/x^n]*Log[e - e/x^n] - 2*d*e*p*x^n*Log[c*(d + e*x^n)^p] + 2*e^2*p*x^(2*n)*Log[e - e/x^n]*Log[c*(d + e*x^n)^p] - d^2*Log[c*(d + e*x^n)^p]^2 + 2*e^2*n*p*x^(2*n)*Log[x]*(p + p*Log[e + d/x^n] - p*Log[e - e/x^n] - Log[c*(d + e*x^n)^p] + p*Log[1 + (e*x^n)/d]) + 2*e^2*p^2*x^(2*n)*PolyLog[2, -((e*x^n)/d)])/(2*d^2*f*n*(f*x)^(2*n))`
- Rubi answer: `"-1/2*(x^(1 + 2*n)*(f*x)^(-1 - 2*n)*(Log[c*(d + e*x^n)^p]^2/x^(2*n) - 2*e*p*(((e*n*p*Log[x])/d - ((d + e*x^n)*Log[c*(d + e*x^n)^p])/(d*x^n))/d - ((e*Log[c*(d + e*x^n)^p]*Log[1 - d/(d + e*x^n)])/d - (e*p*PolyLog[2, d/(d + e*x^n)])/d)/d)))/n"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 3 Logarithms/3.4 u (a+b log(c (d+e x^m)^n))^p.m/376

- W15 classification: `wrong-derivative`
- Integrand: `Log[c*(d + e*x^n)^p]/(x*(f + g/x^n)^2)`
- W15 answer: `(g*p*Log[f - f/x^n] + f*p*x^n*Log[f - f/x^n] - g*n*p*Log[x]*Log[f - f/x^n] - f*n*p*x^n*Log[x]*Log[f - f/x^n] - p*Log[e + d/x^n]*(-(f*x^n) + (g + f*x^n)*Log[f - f/x^n]) - f*x^n*Log[c*(d + e*x^n)^p] + g*Log[f - f/x^n]*Log[c*(d + e*x^n)^p] + f*x^n*Log[f - f/x^n]*Log[c*(d + e*x^n)^p] + g*n*p*Log[x]*Log[1 + (f*x^n)/g] + f*n*p*x^n*Log[x]*Log[1 + (f*x^n)/g] + p*(g + f*x^n)*PolyLog[2, -((f*x^n)/g)])/(f^2*n*(g + f*x^n)) - (p*(-((d*f*Log[e + d/x^n])/(d*f - e*g)) + (f*x^n*Log[e + d/x^n])/(g + f*x^n) + Log[-(d/(e*x^n))]*Log[e + d/x^n] + (d*f*Log[f + g/x^n])/(d*f - e*g) - Log[e + d/x^n]*Log[(d*(f + g/x^n))/(d*f - e*g)] - PolyLog[2, -((g*(e + d/x^n))/(d*f - e*g))] + PolyLog[2, 1 + d/(e*x^n)]))/(f^2*n)`
- Rubi answer: `"((g*Log[c*(d + e*x^n)^p])/(f^2*(g + f*x^n)) + (e*g*p*(Log[d + e*x^n]/(d*f - e*g) - Log[g + f*x^n]/(d*f - e*g)))/f^2 + (Log[c*(d + e*x^n)^p]*Log[-((e*(g + f*x^n))/(d*f - e*g))])/f^2 + (p*PolyLog[2, (f*(d + e*x^n))/(d*f - e*g)])/f^2)/n"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/120

- W15 classification: `wrong-derivative`
- Integrand: `(e*Tan[c + d*x])^(7/2)/(a + a*Sec[c + d*x])`
- W15 answer: `(e^3*Cos[(c + d*x)/2]^2*Sec[c + d*x]*(1 + Sqrt[Sec[c + d*x]^2])*(-2*Sqrt[2]*ArcTan[1 - Sqrt[2]*Sqrt[Tan[c + d*x]]] + 2*Sqrt[2]*ArcTan[1 + Sqrt[2]*Sqrt[Tan[c + d*x]]] - Sqrt[2]*Log[1 - Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]] + Sqrt[2]*Log[1 + Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]] - 8*Sqrt[Tan[c + d*x]] + 8*Hypergeometric2F1[-1/2, 1/4, 5/4, -Tan[c + d*x]^2]*Sqrt[Tan[c + d*x]] - 8*Hypergeometric2F1[1/4, 1/2, 5/4, -Tan[c + d*x]^2]*Sqrt[Tan[c + d*x]])*Sqrt[e*Tan[c + d*x]])/(2*a*d*(1 + Sec[c + d*x])^2*Sqrt[Tan[c + d*x]])`
- Rubi answer: `"-1/12*((8*e^3*(3 - Sec[c + d*x])*Sqrt[e*Tan[c + d*x]])/d + e^4*((3*((2*Sqrt[2]*ArcTan[1 - (Sqrt[2]*Sqrt[e*Tan[c + d*x]])/Sqrt[e]])/Sqrt[e] - (2*Sqrt[2]*ArcTan[1 + (Sqrt[2]*Sqrt[e*Tan[c + d*x]])/Sqrt[e]])/Sqrt[e] + (Sqrt[2]*Log[Sqrt[e] + Sqrt[e]*Tan[c + d*x] - Sqrt[2]*Sqrt[e*Tan[c + d*x]]])/Sqrt[e] - (Sqrt[2]*Log[Sqrt[e] + Sqrt[e]*Tan[c + d*x] + Sqrt[2]*Sqrt[e*Tan[c + d*x]]])/Sqrt[e]))/d + (4*EllipticF[c - Pi/4 + d*x, 2]*Sec[c + d*x]*Sqrt[Sin[2*c + 2*d*x]])/(d*Sqrt[e*Tan[c + d*x]])))/a"`
- Rubi grade: `A`; outcome: `solved`; classification: `false-alarm`
- Rubi check: derivative and answer-minus-reference constant agree at all continuous samples
- Rubi 50-digit evidence: `Missing["NotApplicable"]`


## 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/464

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*(c*Sec[e + f*x])^n)^p*Tan[e + f*x]^5`
- W15 answer: `((a + b*(c*Sec[e + f*x])^n)^p*(-4*a*n*(1 + p)*Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^2 + a*n*(1 + p)*Hypergeometric2F1[4/n, -p, (4 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^4 - 4*Hypergeometric2F1[1, 1 + p, 2 + p, 1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a]*(a + b*(c*Sqrt[Sec[e + f*x]^2])^n)*(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p))/(4*a*f*n*(1 + p)*(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p)`
- Rubi answer: `"0"`
- Rubi grade: `F`; outcome: `wrong`; classification: `wrong-derivative`
- Rubi check: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- Rubi 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 44/113, a -> 89/122, b -> 45/46, c -> 47/103, e -> 43/44, f -> 38/49, n -> 59/77, p -> 73/63}", "IntegrandValue" -> "983.04454520949726357411851666318198466007218037916585579943`50.", "DerivativeValue" -> "0", "ResidualValue" -> "-983.04454520949726357411851666318198466007218037916585579943`50."|>`


## 7 Inverse hyperbolic functions/7.2 Inverse hyperbolic cosine/7.2.4a (f x)^m (d-c^2 d x^2)^p (a+b arccosh(c x))^n.m/208

- W15 classification: `wrong-derivative`
- Integrand: `(a + b*ArcCosh[c*x])^2/(x^2*(d - c^2*d*x^2)^(3/2))`
- W15 answer: `(2*a*b*(-1 + 2*c^2*x^2)*ArcCosh[c*x] + b^2*ArcCosh[c*x]^2 + a*(-a + 2*a*c^2*x^2 - 2*b*c*x*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*Log[c*x] - b*c*x*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*Log[1 - c^2*x^2]))/(d*x*Sqrt[d - c^2*d*x^2])`
- Rubi answer: `"-((a + b*ArcCosh[c*x])^2/(d*x*Sqrt[d - c^2*d*x^2])) + 2*c^2*((x*(a + b*ArcCosh[c*x])^2)/(d*Sqrt[d - c^2*d*x^2]) - (2*b*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*(a*Rubi`Private`Dist[1, Log[Sqrt[-((1 - c*x)/(1 + c*x))]*(1 + c*x)], ArcCosh[c*x]] + b*Defer[Subst][Defer[Int][x*Coth[x], x], x, ArcCosh[c*x]]))/(c*d*Sqrt[d - c^2*d*x^2])) + (4*b*c*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*(a*Rubi`Private`Dist[I/2, I*ArcTanh[Cosh[2*ArcCosh[c*x]]], ArcCosh[c*x]] + b*Defer[Subst][Defer[Int][x*Csch[2*x], x], x, ArcCosh[c*x]]))/(d*Sqrt[d - c^2*d*x^2])"`
- Rubi grade: `F`; outcome: `unresolved`; classification: `unresolved`
- Rubi check: Rubi integration was unresolved or exceeded 180 seconds or 3 GiB
- Rubi 50-digit evidence: `Missing["NotApplicable"]`
