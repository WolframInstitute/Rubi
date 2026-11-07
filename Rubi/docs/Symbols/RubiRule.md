---
Template: Symbol
Name: RubiRule
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/RubiRule
Keywords: [integration, rule, step information, Rubi]
SeeAlso: [Steps, Step, RubiIntermediateResult]
RelatedGuides: [Rubi]
---

## Usage

<code>[RubiRule]()[*condition*, *leftHandSide*, *rightHandSide*]</code> represents a rule application in recorded integration information.

<code>[RubiRule]()[*condition*, *leftHandSide*, *rightHandSide*, *rule*]</code> also identifies the rule.

## Details & Options

- [Step]() and [Steps]() produce [RubiRule]() expressions when recording their information.
- The wrapper is intended for inspection and formatting by Rubi; integration does not require constructing it directly.
