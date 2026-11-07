---
Template: Guide
Name: Rubi
Title: Rule-Based Integration
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/guide/Rubi
Description: Indefinite integration with Albert D. Rich's ordered rule corpus
Keywords: [integration, antiderivative, symbolic computation, rule-based integration, Rubi]
Links: ["[Rule-based Integration](https://rulebasedintegration.org)", "[Rubi source repository](https://github.com/RuleBasedIntegration/Rubi)"]
---

## Abstract

Rubi finds antiderivatives by recursively applying Albert D. Rich's conditional integration rules. The paclet preserves the ordered rule corpus and provides integration, step display and statistics through the `Rubi` context.

Rubi is not a complete decision procedure: an unresolved integral is not a proof of non-elementarity. Its definite-input form subtracts directed endpoint limits without checking continuity or convergence, so it must not be treated as a general definite-integration oracle.

## Functions

### Integration

- `Int` find an antiderivative or subtract directed endpoint limits
- `Unintegrable` represent a closed-form non-elementarity result when explicitly enabled
- `CannotIntegrate` represent an integral Rubi could not evaluate
- `$Unintegrable` control the explicit non-elementary result wrapper

### Steps and statistics

- `Step` apply and display the first integration step
- `Steps` display integration steps and return the antiderivative
- `Stats` collect rule counts, expression sizes and the rule-to-size ratio
- `RubiPrintInformation` print step or statistics information, or return it as data
- `RubiRule` represent one rule application in recorded step information
- `RubiIntermediateResult` represent an intermediate integration expression
- `RubiStats` represent integration statistics and expose named properties

### Loading and provenance

- `RubiClearMemoryImages` remove Rubi's user-cache memory images
- `$RubiVersion` give the loaded Rubi paclet version
- `$RubiSourceCommit` give the upstream source snapshot commit
