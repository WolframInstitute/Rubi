---
Template: Symbol
Name: Stats
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/Stats
Keywords: [integration, statistics, rule count, leaf count, Rubi]
SeeAlso: [Steps, Step, Int, RubiStats, RubiPrintInformation]
RelatedGuides: [Rubi]
---

## Usage

<code>[Stats]()[[Int]()[*expression*, *variable*]]</code> displays integration statistics and gives the antiderivative.

## Details & Options

- [Stats]() reports the number of rule applications, the number of distinct rules, input and output leaf counts, the rule-to-size ratio and the rules used.
- The statistics describe evaluation work; they are not correctness evidence.
- With <code>[RubiPrintInformation]() -> [False]()</code>, the result is a pair containing a [RubiStats]() object and the antiderivative.

| option | default | effect |
|---|---|---|
| <code>RubiPrintInformation</code> | <code>True</code> | print the statistics; use <code>False</code> to return them with the result |

## Basic Examples

Show statistics for a polynomial integration:

```wl
Stats[Int[x^2, x]]
```

---

Return the statistics object without printing it:

```wl
First @ Stats[Int[x^2, x], RubiPrintInformation -> False]
```

---

Read the number of distinct rules from the returned statistics:

```wl
With[{statistics = First @ Stats[Int[x^2, x], RubiPrintInformation -> False]}, statistics["NumberOfRules"]]
```
