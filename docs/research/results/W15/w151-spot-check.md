# W15.1 local spot check

Five safe real candidate points per row, up to 600 seconds per point.

Domain counts: <|"a-wrong-real" -> 2, "b-complex-or-out-of-region" -> 4|>

## 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/425

- W15.1 version: `15.1.0 Prototype version for Mac OS X ARM (64-bit) (November 6, 2026)`
- W15.0 domain: `a-wrong-real`; safe check: `wrong-derivative`
- W15.1 answer: `"((d*r*(a + b*Log[c*x^n]))/(d + e*x^r) + b*n*Log[d - d*x^r] - a*r*Log[d - d*x^r] + b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]))/(d^2*r^2)"`
- Domain classification: `a-wrong-real`
- Optimal safe: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- W15.1 safe: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/465

- W15.1 version: `15.1.0 Prototype version for Mac OS X ARM (64-bit) (November 6, 2026)`
- W15.0 domain: `b-complex-or-out-of-region`; safe check: `undecided`
- W15.1 answer: `"((a + b*(c*Sec[e + f*x])^n)^p*((2*Hypergeometric2F1[1, 1 + p, 2 + p, 1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a]*(a + b*(c*Sqrt[Sec[e + f*x]^2])^n))/(a*n*(1 + p)) + (Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^2)/(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p))/(2*f)"`
- Domain classification: `b-complex-or-out-of-region`
- Optimal safe: `undecided` - too few real continuous samples
- W15.1 safe: `undecided` - too few real continuous samples


## 6 Hyperbolic functions/6.4 Hyperbolic cotangent/6.4.7 (d hyper)^m (a+b (c coth)^n)^p.m/49

- W15.1 version: `15.1.0 Prototype version for Mac OS X ARM (64-bit) (November 6, 2026)`
- W15.0 domain: `b-complex-or-out-of-region`; safe check: `undecided`
- W15.1 answer: `"(Sqrt[Cosh[2*x]]*Csch[x]*Log[Sqrt[2]*Cosh[x] + Sqrt[Cosh[2*x]]])/(Sqrt[2]*Sqrt[-1 - Coth[x]^2])"`
- Domain classification: `b-complex-or-out-of-region`
- Optimal safe: `undecided` - too few real continuous samples
- W15.1 safe: `undecided` - too few real continuous samples


## 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.2 Exponentials of inverse hyperbolic cotangent functions.m/731

- W15.1 version: `15.1.0 Prototype version for Mac OS X ARM (64-bit) (November 6, 2026)`
- W15.0 domain: `undecided`; safe check: `undecided`
- W15.1 answer: `"(x^(1 + m)*((2*Sqrt[1 - a*x]*Sqrt[-(c*(1 + a*x))]*AppellF1[1 + m, 1/2, -1/2, 2 + m, a*x, -(a*x)])/(Sqrt[-1 + a*x]*Sqrt[1 + a*x]) + (Sqrt[c - a^2*c*x^2]*Hypergeometric2F1[-1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/Sqrt[1 - a^2*x^2]))/(1 + m)"`
- Domain classification: `a-wrong-real`
- Optimal safe: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- W15.1 safe: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1134

- W15.1 version: `15.1.0 Prototype version for Mac OS X ARM (64-bit) (November 6, 2026)`
- W15.0 domain: `undecided`; safe check: `undecided`
- W15.1 answer: `"(x^(1 + m)*Sqrt[1 - a^2*x^2]*AppellF1[1 + m, 3/2, -1/2, 2 + m, a*x, -(a*x)])/((1 + m)*Sqrt[-1 + a*x]*Sqrt[-(c*(1 + a*x))])"`
- Domain classification: `b-complex-or-out-of-region`
- Optimal safe: `undecided` - too few real continuous samples
- W15.1 safe: `undecided` - too few real continuous samples


## 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/464

- W15.1 version: `15.1.0 Prototype version for Mac OS X ARM (64-bit) (November 6, 2026)`
- W15.0 domain: `b-complex-or-out-of-region`; safe check: `undecided`
- W15.1 answer: `"((a + b*(c*Sec[e + f*x])^n)^p*(-4*a*n*(1 + p)*Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^2 + a*n*(1 + p)*Hypergeometric2F1[4/n, -p, (4 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^4 - 4*Hypergeometric2F1[1, 1 + p, 2 + p, 1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a]*(a + b*(c*Sqrt[Sec[e + f*x]^2])^n)*(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p))/(4*a*f*n*(1 + p)*(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p)"`
- Domain classification: `b-complex-or-out-of-region`
- Optimal safe: `undecided` - too few real continuous samples
- W15.1 safe: `undecided` - too few real continuous samples
