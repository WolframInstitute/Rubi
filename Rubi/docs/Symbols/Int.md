---
Template: Symbol
Name: Int
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/Int
Keywords: [integration, antiderivative, indefinite integral, Rubi]
SeeAlso: [Integrate, Step, Steps, Stats, CannotIntegrate]
RelatedGuides: [Rubi]
---

## Usage

<code>[Int]()[*expression*, *variable*]</code> gives the antiderivative of *expression* with respect to *variable*.

<code>[Int]()[{$expression_1$, $expression_2$, …}, *variable*]</code> gives a list of antiderivatives.

<code>[Int]()[*expression*, {*variable*, *a*, *b*}]</code> subtracts directed endpoint limits of an antiderivative at *a* and *b*.

## Details & Options

- [Int]() recursively applies Albert D. Rich's conditional integration rules. It is not a complete Risch decision procedure.
- An unresolved [Int]() or [CannotIntegrate]() result means that Rubi did not find an antiderivative; it does not prove non-elementarity.
- The definite-input form does not check continuity on the integration domain or establish convergence. The endpoint-limit difference is not always the definite integral.
- Step display and statistics are available through [Step](), [Steps]() and [Stats]().

## Basic Examples

Integrate a polynomial:

```wl
Int[x^2 + 3 x, x]
```

<!-- => (3 x^2)/2 + x^3/3 -->

---

Integrate a rational function:

```wl
Int[1/(1 + x^2), x]
```

<!-- => ArcTan[x] -->

---

Integrate several expressions with respect to the same variable:

```wl
Int[{x, x^2, x^3}, x]
```

<!-- => {x^2/2, x^3/3, x^4/4} -->

## Properties and Relations

Differentiation recovers the original polynomial:

```wl
D[Int[x^2 + 3 x, x], x] == x^2 + 3 x
```

<!-- => True -->

## Possible Issues

The endpoint-limit form does not detect a singularity inside the integration interval:

```wl
Int[1/(1 - x^2), {x, 0, 2}]
```

The result comes with `Int::definite` and must not be interpreted as a convergent definite integral.
