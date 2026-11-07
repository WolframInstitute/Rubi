---
Template: Symbol
Name: Step
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/Step
Keywords: [integration, step, rule application, Rubi]
SeeAlso: [Steps, Stats, Int, RubiPrintInformation]
RelatedGuides: [Rubi]
---

## Usage

<code>[Step]()[[Int]()[*expression*, *variable*]]</code> displays the first integration step and gives the intermediate result.

## Details & Options

- [Step]() requires the paclet to have been loaded with step-display rules enabled. This is the default loading configuration.
- With <code>[RubiPrintInformation]() -> [False]()</code>, the result is a pair containing the recorded information and intermediate expression.

| option | default | effect |
|---|---|---|
| <code>RubiPrintInformation</code> | <code>True</code> | print the rule information; use <code>False</code> to return it with the result |

## Basic Examples

Apply the first step of a polynomial integration:

```wl
Step[Int[x^2, x]]
```

---

Return the intermediate expression without printing rule information:

```wl
Last @ Step[Int[x^2, x], RubiPrintInformation -> False]
```
