# Rubi wrong-answer rule groups

Strict audit counts: <|"undecided" -> 13, "wrong-derivative" -> 22|>

## Most frequent rule applications

- `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n, x]]` - 3
- `HoldComplete[Integrate[x^m*(a + b*x^2 + c*x^4)^p, x]]` - 5
- `HoldComplete[Integrate[(a + b*x + c*x^2)^p/(d + e*x), x]]` - 14
- `HoldComplete[Integrate[x^m*(a + b*x^n)^p, x]]` - 4
- `HoldComplete[Integrate[1/Sqrt[a + b*x^2], x]]` - 1
- `HoldComplete[Integrate[(a + b*x^2)^(-1), x]]` - 2
- `HoldComplete[Integrate[Pq*(c*x)^m*(a*x^j + b*x^n)^p, x]]` - 4
- `HoldComplete[Integrate[(c*x)^m*(a*x^j + b*x^n)^p, x]]` - 4
- `HoldComplete[Integrate[(a*x^j + b*x^n)^p, x]]` - 2
- `HoldComplete[Integrate[(c*x)^m*(a + b*x^n)^p, x]]` - 3
- `HoldComplete[Integrate[1/Sqrt[a + b*x^6], x]]` - 2
- `HoldComplete[Integrate[(b*x)^m*(c + d*x)^n, x]]` - 1
- `HoldComplete[Integrate[E^(ArcTanh[a*x]*n)*u*(c + d*x)^p, x]]` - 9
- `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p, x]]` - 9
- `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p*(g + h*x)^q, x]]` - 2
- `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p*(g + h*x), x]]` - 6
- `HoldComplete[Integrate[(g + h*x)/(Sqrt[a + b*x]*Sqrt[c + d*x]*Sqrt[e + f*x]), x]]` - 3
- `HoldComplete[Integrate[Sqrt[e + f*x]/(Sqrt[a + b*x]*Sqrt[c + d*x]), x]]` - 3
- `HoldComplete[Integrate[u^p*v^q, x]]` - 1
- `HoldComplete[Integrate[Pq*(a + b*x + c*x^2)^p, x]]` - 1

## First rule: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n, x]]`

Rows: 1

- `undecided`: 1 Algebraic functions/1.1 Binomial products/1.1.1 Linear/1.1.1.2 (a+b x)^m (c+d x)^n.m/1881 - `(c + d*x)^(1 + 2*n - 2*(1 + n))/(a + b*x)^2`

## First rule: `HoldComplete[Integrate[x^m*(a + b*x^2 + c*x^4)^p, x]]`

Rows: 5

- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/481 - `1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4))`
- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/499 - `1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)^2)`
- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/428 - `(a^2 + 2*a*b*x^2 + b^2*x^4)^2/x`
- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/453 - `(a^2 + 2*a*b*x^2 + b^2*x^4)^3/x`
- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/520 - `1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)^3)`

## First rule: `HoldComplete[Integrate[x^m*(a + b*x^n)^p, x]]`

Rows: 4

- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1033 - `x/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4]`
- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1026 - `1/(x*Sqrt[2 + 2*a - 2*(1 + a) + c*x^4])`
- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1035 - `1/(x*Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4])`
- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1031 - `x^3/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4]`

## First rule: `HoldComplete[Integrate[Pq*(c*x)^m*(a*x^j + b*x^n)^p, x]]`

Rows: 2

- `wrong-derivative`: Blake/Blake_Problems.m/729 - `(Sqrt[-x + x^4]*(-b + a*x^6))/x^6`
- `wrong-derivative`: Blake/Blake_Problems.m/658 - `(Sqrt[x + x^4]*(-b + a*x^6))/x^6`

## First rule: `HoldComplete[Integrate[(a + b*x + c*x^2)^p/(d + e*x), x]]`

Rows: 9

- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1490 - `(a^2 + 2*a*b*x + b^2*x^2)^3/(d + e*x)`
- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1522 - `1/((d + e*x)*(a^2 + 2*a*b*x + b^2*x^2)^2)`
- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1027 - `1/((d + e*x)*(c*d^2 + 2*c*d*e*x + c*e^2*x^2)^3)`
- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1004 - `1/((d + e*x)*(c*d^2 + 2*c*d*e*x + c*e^2*x^2))`
- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/990 - `(c*d^2 + 2*c*d*e*x + c*e^2*x^2)^2/(d + e*x)`
- `wrong-derivative`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1470 - `(a^2 + 2*a*b*x + b^2*x^2)^2/(d + e*x)`
- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1534 - `1/((d + e*x)*(a^2 + 2*a*b*x + b^2*x^2)^3)`
- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1015 - `1/((d + e*x)*(c*d^2 + 2*c*d*e*x + c*e^2*x^2)^2)`
- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1511 - `1/((d + e*x)*(a^2 + 2*a*b*x + b^2*x^2))`

## First rule: `HoldComplete[Integrate[E^(ArcTanh[a*x]*n)*u*(c + d*x)^p, x]]`

Rows: 9

- `undecided`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/283 - `E^(n*ArcTanh[a*x])/(c - a*c*x)^(3/2)`
- `undecided`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/284 - `E^(n*ArcTanh[a*x])/(c - a*c*x)^(5/2)`
- `wrong-derivative`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/428 - `(x^3*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])`
- `undecided`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/285 - `E^(n*ArcTanh[a*x])/(c - a*c*x)^(7/2)`
- `wrong-derivative`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/429 - `(x^2*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])`
- `wrong-derivative`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/278 - `E^(n*ArcTanh[a*x])*(c - a*c*x)^(7/2)`
- `wrong-derivative`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/430 - `(x*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])`
- `wrong-derivative`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/279 - `E^(n*ArcTanh[a*x])*(c - a*c*x)^(5/2)`
- `wrong-derivative`: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/280 - `E^(n*ArcTanh[a*x])*(c - a*c*x)^(3/2)`

## First rule: `HoldComplete[Integrate[(c*x)^m*(a + b*x^n)^p, x]]`

Rows: 1

- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1028 - `1/(x^3*Sqrt[2 + 2*a - 2*(1 + a) + c*x^4])`

## First rule: `HoldComplete[Integrate[u^p*v^q, x]]`

Rows: 1

- `wrong-derivative`: Hebisch/Hebisch_Problems.m/4508 - `(3 - 3*x + x^2 + 2*(-3 + 2*x)*Log[7] + 4*Log[7]^2)/(-3*x + x^2 + 2*(-3 + 2*x)*Log[7] + 4*Log[7]^2)`

## First rule: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p, x]]`

Rows: 2

- `wrong-derivative`: 1 Algebraic functions/1.1 Binomial products/1.1.1 Linear/1.1.1.3 (a+b x)^m (c+d x)^n (e+f x)^p.m/813 - `(a + b*x)^n/(x^2*(-a - b*x)^n)`
- `wrong-derivative`: 1 Algebraic functions/1.1 Binomial products/1.1.1 Linear/1.1.1.3 (a+b x)^m (c+d x)^n (e+f x)^p.m/814 - `(a + b*x)^n/(x^3*(-a - b*x)^n)`

## First rule: `HoldComplete[Integrate[(a + b*x^2 + c*x^4)^p, x]]`

Rows: 1

- `undecided`: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1016 - `1/Sqrt[a + b*x^2 + (2 + 2*c - 2*(1 + c))*x^4]`