---
Template: Symbol
Name: Steps
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/Steps
Keywords: [integration, steps, rule trace, Rubi]
SeeAlso: [Step, Stats, Int, RubiPrintInformation, RubiRule]
RelatedGuides: [Rubi]
---

## Usage

<code>[Steps]()[[Int]()[*expression*, *variable*]]</code> displays the integration steps and gives the antiderivative.

<code>[Steps]()[[Int]()[*expression*, *variable*], *n*]</code> allows at most *n* iterative evaluations.

## Details & Options

- [Steps]() requires the paclet to have been loaded with step-display rules enabled. This is the default loading configuration.
- Recorded information contains [RubiRule]() and [RubiIntermediateResult]() expressions.
- With <code>[RubiPrintInformation]() -> [False]()</code>, the result is a pair containing the recorded information and antiderivative.

| option | default | effect |
|---|---|---|
| <code>RubiPrintInformation</code> | <code>True</code> | print the rule information; use <code>False</code> to return it with the result |

## Basic Examples

Show the rules used to integrate a polynomial:

```wl
Steps[Int[x^2, x]]
```

---

Return only the antiderivative while computing the recorded steps:

```wl
Last @ Steps[Int[x^2, x], RubiPrintInformation -> False]
```

<!-- => x^3/3 -->
