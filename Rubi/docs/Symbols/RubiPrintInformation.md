---
Template: Symbol
Name: RubiPrintInformation
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/RubiPrintInformation
Keywords: [integration, option, steps, statistics, Rubi]
SeeAlso: [Step, Steps, Stats]
RelatedGuides: [Rubi]
---

## Usage

<code>[RubiPrintInformation]() -> [True]()</code> prints integration step or statistics information.

<code>[RubiPrintInformation]() -> [False]()</code> returns that information together with the integration result.

## Details & Options

- [RubiPrintInformation]() is an option of [Step](), [Steps]() and [Stats]().
- The returned pair has the recorded information first and the antiderivative or intermediate expression second.

## Basic Examples

Return step information and the antiderivative as a pair:

```wl
Steps[Int[x^2, x], RubiPrintInformation -> False]
```
