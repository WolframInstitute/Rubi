# W15 real-domain audit

Counts: <|"a-wrong-real" -> 27, "b-complex-or-out-of-region" -> 15, "undecided" -> 2|>

## a-wrong-real: 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/153

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `different-constant` - real-domain derivative matches but answer minus reference varies


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/425

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## b-complex-or-out-of-region: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/153

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## b-complex-or-out-of-region: 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/465

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## b-complex-or-out-of-region: 6 Hyperbolic functions/6.4 Hyperbolic cotangent/6.4.7 (d hyper)^m (a+b (c coth)^n)^p.m/49

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## b-complex-or-out-of-region: 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/130

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## b-complex-or-out-of-region: 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/322

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## a-wrong-real: 1 Algebraic functions/1.1 Binomial products/1.1.3 General/1.1.3.4 (e x)^m (a+b x^n)^p (c+d x^n)^q.m/826

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `different-constant` - real-domain derivative matches but answer minus reference varies


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/426

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## b-complex-or-out-of-region: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/154

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## b-complex-or-out-of-region: Blake/Blake_Problems.m/2066

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `false-alarm` - real-domain derivative and answer-minus-reference constant agree


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/355

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/363

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## b-complex-or-out-of-region: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/155

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## undecided: 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.2 Exponentials of inverse hyperbolic cotangent functions.m/731

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `undecided` - safe W15 audit exceeded its bound


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/364

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/741

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/365

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 4 Trig functions/4.5 Secant/4.5.1.3 (d sin)^n (a+b sec)^m.m/285

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/245

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `different-constant` - real-domain derivative matches but answer minus reference varies


## a-wrong-real: 4 Trig functions/4.7 Miscellaneous/4.7.7 Trig functions.m/373

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1133

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/366

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/430

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## b-complex-or-out-of-region: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/150

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## a-wrong-real: 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/246

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `different-constant` - real-domain derivative matches but answer minus reference varies


## undecided: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1134

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `undecided` - safe W15 audit exceeded its bound


## b-complex-or-out-of-region: 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic cotangent functions.m/238

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/415

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/431

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## b-complex-or-out-of-region: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/151

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## a-wrong-real: 4 Trig functions/4.1 Sine/4.1.2.2 (g cos)^p (a+b sin)^m (c+d sin)^n.m/1391

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `different-constant` - real-domain derivative matches but answer minus reference varies


## b-complex-or-out-of-region: 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic cotangent functions.m/255

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## a-wrong-real: Hebisch/Hebisch_Problems.m/2167

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/2576

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/408

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/424

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/432

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## b-complex-or-out-of-region: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/152

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## a-wrong-real: 3 Logarithms/3.4 u (a+b log(c (d+e x^m)^n))^p.m/168

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 3 Logarithms/3.4 u (a+b log(c (d+e x^m)^n))^p.m/376

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `wrong-derivative` - real-domain scaled derivative residual exceeds 10^-20 at two or more continuous samples


## a-wrong-real: 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/120

- Original optimal classification: `false-alarm`
- Safe optimal: `false-alarm` - real-domain derivative and answer-minus-reference constant agree
- Safe W15: `different-constant` - real-domain derivative matches but answer minus reference varies


## b-complex-or-out-of-region: 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/464

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples


## b-complex-or-out-of-region: 7 Inverse hyperbolic functions/7.2 Inverse hyperbolic cosine/7.2.4a (f x)^m (d-c^2 d x^2)^p (a+b arccosh(c x))^n.m/208

- Original optimal classification: `false-alarm`
- Safe optimal: `undecided` - too few real continuous samples
- Safe W15: `undecided` - too few real continuous samples
