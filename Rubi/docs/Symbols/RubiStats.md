---
Template: Symbol
Name: RubiStats
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/RubiStats
Keywords: [integration, statistics, rule count, leaf count, Rubi]
SeeAlso: [Stats, RubiPrintInformation]
RelatedGuides: [Rubi]
---

## Usage

<code>[RubiStats]()[{$steps$, $numberOfRules$, $inputLeafCount$, $outputLeafCount$, $ratio$, $rules$}]</code> represents integration statistics.

## Details & Options

- [Stats]() returns a [RubiStats]() object when <code>[RubiPrintInformation]() -> [False]()</code>.
- The properties are `"Steps"`, `"NumberOfRules"`, `"InputLeafCount"`, `"OutputLeafCount"`, `"Ratio"` and `"Rules"`.
- Statistics describe the integration computation and do not verify the antiderivative.

## Basic Examples

Read the output leaf count from a statistics object:

```wl
With[{statistics = First @ Stats[Int[x^2, x], RubiPrintInformation -> False]}, statistics["OutputLeafCount"]]
```
