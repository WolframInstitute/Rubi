---
Template: Paclet
ResourceType: Paclet
Name: WolframInstitute/Rubi
Context: Rubi`
Paclet: WolframInstitute/Rubi
Description: Rule-based indefinite integration using Albert D. Rich's integration rules
ContributedBy: Albert D. Rich, Patrick Scheibe, Rule-based Integration Organization
Keywords: [integration, antiderivative, symbolic computation, rule-based integration, Rubi]
MainGuide: Documentation/English/Guides/Rubi.nb
License: MIT
WolframVersion: 13+
Categories: [Symbolic & Numeric Computation, Higher Mathematical Computation]
Sources: ["Albert D. Rich, Rule-based Integration, https://rulebasedintegration.org", "RuleBasedIntegration/Rubi source snapshot 61e9c18ea248061cd83c67882f7c91a73cef912d"]
SourceControlURL: https://github.com/RuleBasedIntegration/Rubi
Links: ["[Rule-based Integration](https://rulebasedintegration.org)", "[Rubi installation and usage guide](https://rulebasedintegration.org/mathematicaPackage.html)", "[Rubi source repository](https://github.com/RuleBasedIntegration/Rubi)"]
---

## Details & Options

- Rubi applies Albert D. Rich's ordered conditional rewrite rules to find antiderivatives. It is a rule-based integrator, not a complete Risch decision procedure.
- The paclet preserves the upstream integration rules and their crucial load order. Albert Rich's authorship and the MIT licence accompany the archive.
- An unresolved [Int]() does not prove that an elementary antiderivative does not exist.
- The definite-input form subtracts directed endpoint limits of an antiderivative. Rubi does not check continuity on the integration domain or establish convergence, so this difference is not always the definite integral.
- Loading creates a memory image under the user cache when possible. Images are specific to the paclet source, loading flags and full kernel identity; the installation directory is never used for cache writes.

## Usage

[Int]() finds antiderivatives. [Step]() and [Steps]() expose rule application, [Stats]() collects integration statistics, and [RubiPrintInformation]() controls whether those functions print their information or return it. [RubiClearMemoryImages]() removes the paclet's user-cache images. [$RubiVersion]() and [$RubiSourceCommit]() identify the loaded paclet and upstream rule snapshot.

## Basic Examples

Integrate a polynomial with respect to $x$:

```wl
Int[x^2, x]
```

<!-- => x^3/3 -->

---

Integrate a rational function whose antiderivative uses the inverse tangent:

```wl
Int[1/(1 + x^2), x]
```

<!-- => ArcTan[x] -->

---

Return the antiderivative while retaining access to the recorded steps:

```wl
Last @ Steps[Int[x^2, x], RubiPrintInformation -> False]
```

<!-- => x^3/3 -->

## Author Notes

Albert D. Rich developed the integration rules and original package; Patrick Scheibe and the Rule-based Integration Organization maintained the upstream package. The modern paclet loader, packaging, documentation and tests were developed for the Wolfram Institute integration project. The upstream integration-rule files and their order are preserved; new paclet infrastructure and documentation require maintainer review before publication.
