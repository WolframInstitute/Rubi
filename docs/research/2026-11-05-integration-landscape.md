# Research note: Rubi and the symbolic-integration landscape

**Project:** Wolfram Institute integration research

**Date:** 2026-11-05

**Status:** Research before implementation

**Scope:** Rubi's design, versions and limits; independent integration tests and published grades; techniques available in other integrators. No integration code was changed or benchmarked for this note.

## Executive summary

Rubi is best understood as a recursively applied, conditional term-rewriting system, not a table of final integral formulas and not an implementation of the Risch decision procedure. Its strengths are compact antiderivatives, transparent steps, and excellent coverage of the families represented in its own large test corpus. Its rules are only one part of the system: a substantial utility layer and the host Wolfram Language evaluator determine whether patterns match and whether the resulting expressions have the intended form.

The test results require two complementary readings:

* On the original 72,944-problem Rubi corpus, the published Rubi 4.16.1 result is 72,803 A, 53 B, 27 C and 61 F, compared with Mathematica 11.3's 53,178 A, 6,204 B, 10,294 C and 3,268 F [T1]. This demonstrates Rubi's exceptional answer quality on its native corpus.
* On Nasser Abbasi's expanded Summer 2024 corpus of 106,812 problems, Rubi 4.17.3 has the higher A percentage (84.74% versus Mathematica 14's 73.46%) and lower mean time (0.67 s versus 2.50 s), but more F results (6.86% versus 2.63%) [T2]. Rubi solves only 63.37% of the Sam Blake files and 62.56% of the Waldek Hebisch file, versus Mathematica's 94.09% and 96.81%. These added algebraic-heavy collections, not Rubi's original sections, are the largest coverage gap.

The design implication is a **verified hybrid**, not a replacement of Rubi by a monolithic Risch implementation. Keep Rubi first for compact, explainable answers. Add algorithmic fallbacks for uncovered algebraic and transcendental cases, and special-function methods where elementary answers do not exist. Differentiate every candidate before accepting it; grade size and function class only after correctness. A failed or unsupported method must remain distinguishable from a proof of non-elementarity.

## 1. Rubi itself

### 1.1 Architecture and rule semantics

Rubi's public description is a decision tree of more than 6,700 integration rules, organized by integrand form [R1]. The current source and later literature use larger approximate counts: Norman and Jeffrey describe over 7,000 rules in 4.17.3 and almost 7,500 parsed rewrite sites [R4]. These are approximations, not interchangeable measurements. The baseline should record the actual `Length[DownValues[Int]]` at load (`$RuleCount`) rather than infer it from files: a lexical scan finds 8,492 `Int[...]` definition sites, including auxiliary definitions and multiple conditional branches, which is not a valid rule total.

The central operation is `Int[integrand, x]`. Each rule has a structural left-hand side, a replacement, and usually a `/;` condition. A replacement can return an antiderivative, a simpler `Int`, a sum of integrals, or a substitution involving another `Int`; recursive evaluation continues until no rule applies. For example, the linear-binomial file defines the elementary power and logarithm rules and then a linear-substitution rule [R6]. This is deliberately different from an integral lookup table.

Rich and Jeffrey's 2009 design paper gives five important principles for a properly defined transformation rule [R3]:

1. **Functional replacement:** the right side is a mathematical expression with domain restrictions, not procedural code or global assignment.
2. **Domain validity:** conditions restrict a rewrite to values for which it is valid.
3. **Simplification and termination:** a rule should make the expression simpler and its conditions should prevent cycles.
4. **Local state only:** local bindings are allowed when needed; global/fluid assignments are not.
5. **Mutual exclusivity:** ideally at most one rule applies, so rules can be changed independently.

The same paper advocates a minimal collection of general, mutually exclusive rules rather than a maximal collection of special cases. It also notes that integration rules commonly produce other integrals, so recursion is essential. The desired platform services are conditional rewriting, efficient pattern matching through a discrimination net, exact arithmetic, and a suitable programming environment [R3].

In the actual Mathematica package, load order still matters. `Rubi.m` explicitly says that its rule-file order is crucial, and the README repeats this warning [R5, R6]. Wolfram Language's own specificity ordering, automatic evaluation of `Plus`/`Times`/`Power`, default pattern values, commutativity, and conditions interact with source order. Thus the 2009 ideal of stand-alone, order-independent rules is a design goal, not a safe assumption about every current definition. Any port or rule edit must preserve the complete load sequence and test for changed dispatch.

The 2024 Corundum.red porting study makes this host dependence concrete [R4]:

* The expression seen by the matcher is neither untouched input nor a fully simplified canonical form.
* Commutative matching and default pattern values allow one written rule to cover many input arrangements.
* Conditions must participate in backtracking, not just be checked after an arbitrary structural match.
* Some results depend on Mathematica's post-processing and simplification as well as the rule itself.

These are direct requirements for our kernel v2 compatibility work.

### 1.2 Source organization and loading

The repository has two representations of the rules [R5]:

* `IntegrationRuleNotebooks/**/*.nb` is the literate source, including mathematical notation, conditions, references and commentary.
* `Rubi/IntegrationRules/**/*.m` is automatically extracted, densely packed package source. The README says these generated files are not intended to be edited or read directly.

`RubiPackageTools.m` provides `BuildIntegrationRules[]` for extraction. This checkout contains 221 extracted `.m` rule files, not all of them enabled. `Rubi.m` loads the selected files in a deliberately non-alphabetic sequence. Algebraic rules are loaded first; elementary transcendental families follow when `$LoadElementaryFunctionRules` is true; special-function families and miscellaneous rules come last. Polynomial rules are deliberately interleaved after more specific binomial/trinomial rules [R6].

The rule families are:

0. independent tests in the **test corpus**, not integration rules;
1. algebraic functions;
2. exponentials;
3. logarithms;
4. trigonometric functions;
5. inverse trigonometric functions;
6. hyperbolic functions;
7. inverse hyperbolic functions;
8. special functions;
9. miscellaneous normalization, derivative, piecewise and integration rules.

Section 8 includes error, Fresnel, exponential-integral, trigonometric/hyperbolic-integral, gamma, zeta, polylogarithm and product-logarithm rules. The Bessel rule file exists but its `LoadRules` call is commented out in `Rubi.m` [R6]. This is an explicit coverage limitation, not evidence that all Bessel cases are supported.

`Kernel/init.m` caches the loaded context in an `.mx` image keyed by system ID, Mathematica version, Rubi version, and the two load flags. The historical documentation reports a first load of a minute or two and subsequent loads below one second [R2, R6]. These figures need fresh measurement on W15 and v2; the cache is platform/version dependent and should not be treated as portable source.

### 1.3 Utility functions are part of the algorithm

`IntegrationUtilityFunctions.m` is 7,841 lines in this checkout and contains 229 usage declarations. Its responsibilities include:

* expression and numeric predicates (`PolyQ`, `BinomialQ`, `TrinomialQ`, `RationalQ`, `EqQ`, ordered comparisons);
* decomposition into linear, binomial, trinomial and generalized parts;
* polynomial, rational-function and algebraic manipulation;
* substitution and recognition of function composition;
* controlled expansion, normalization and simplification;
* trigonometric and hyperbolic normalization, including inert `sin`, `cos`, `tan`, `cot`, `sec` and `csc` forms;
* integration helpers, sum handling, and the final `FixIntRules` transformation.

The file is not merely a convenience library. Rich's rules call these predicates in their applicability conditions and these transformations in their replacements. The Corundum.red study reports that around 8,000 lines of utility code were a larger porting obstacle than the superficially simple rule patterns, and that `Subst` alone has substantial supporting machinery [R4].

Two host-specific mechanisms deserve particular attention:

* `FixIntRules[]` rewrites `DownValues[Int]` after loading, including distribution of coefficients over sums [R6].
* Inert trig functions and the custom `Star` product inhibit unwanted host simplification until Rubi is ready to reactivate ordinary forms [R4, R6].

For v2, compatibility must be established by semantic tests of the utility functions and evaluator behavior, not just by successfully parsing all rule files.

### 1.4 Steps and statistics

`$LoadShowSteps` defaults to true. When enabled, `ShowStepRoutines.m` instruments the `Int` downvalues with held evaluation and information collection. `Steps` repeatedly releases one stage of evaluation with `FixedPoint`, while `Step` performs one step. `Reap`/`Sow` collect `RubiRule` and `RubiIntermediateResult` objects; `ShowStepFormatting.m` formats them [R5, R6].

The public interface is:

```wl
Steps[Int[expr, x]]
Step[Int[expr, x]]
Stats[Int[expr, x]]
```

`RubiPrintInformation -> False` returns the collected data instead of printing it. `Stats` reports:

* number of rule applications/steps;
* number of distinct rules used;
* input and output `LeafCount`;
* the distinct-rule list;
* `NumberOfRules / LeafCount[input]`, called the rule-to-size ratio [R2, R6].

Step count and distinct-rule count are different: rules can be reused. These measurements will be useful for difficulty analysis and for detecting cycles, but they are not correctness evidence.

### 1.5 Versions and changes since 4.16.x

There are two relevant recent baselines, not just 4.16.x:

| Version | Release/context | Main changes |
|---|---|---|
| 4.16.0.2–4.16.0.5 | 2018 | Rule/interface fixes; `Steps`/`Stats` return-data option; old-version display fixes; `.mx` fast-load cache; final small interface fix [R7]. |
| 4.16.1 | December 2018 | Last release overseen by Albert Rich; substantial improvements to algebraic, logarithmic, inverse-trig and inverse-hyperbolic rules [R4, R7]. |
| 4.17.3.0 | September 2023 source snapshot; released December 2023 | Albert Rich's final files, recovered posthumously by David Stoutemyer and released without additional bug fixes. The maintainers state that 4.17.2 was an erroneous tag [R7]. |
| Repository HEAD at this research commit | Latest source commit 2024-02-22 | Post-4.17.3 utility fixes, issue #52 fixes, and an explicit definite-integration warning with directed endpoint limits [R6]. |

The checkout's `PacletInfo.m` says **4.17.3.0**. Its `CHANGELOG.md` ends at 4.16.0.4 and is not a complete version history. This discrepancy should be resolved in the paclet design by recording both the upstream rule snapshot and our own paclet version, rather than calling the current work simply "Rubi 4.16".

### 1.6 Known limits and risks

1. **No completeness theorem.** Rubi is an extensive pattern repository, not a general Risch decision procedure. An unevaluated `Int` does not prove non-elementarity, and `CannotIntegrate` explicitly means that Rubi could not integrate the input [R3, R4, R6].
2. **Uncovered forms and cycles.** Norman and Jeffrey report test cases that loop and identify more rules and loop reduction as future work [R4]. Time, memory and recursion limits are therefore required in every automated run.
3. **Definite integration is only an endpoint-limit calculation.** `Int[u, {x,a,b}]` subtracts directed limits of an indefinite antiderivative. Current HEAD warns that it does not check continuity on the integration domain. The public documentation gives `Int[1/(1-x^2), {x,0,2}] -> ArcTanh[2]` although the integral diverges [R2, R6]. It also does not establish convergence.
4. **Branch and domain correctness still needs verification.** The project aims at antiderivatives valid on the real and complex domains, and the original rule-design paper stresses domain restrictions [R1, R3]. That goal is not a proof for every composition of host simplifications and rules. Differentiation and domain-aware checks remain mandatory.
5. **Host-evaluator dependence.** Exact pattern dispatch, automatic evaluation, `Simplify`, `Together`, `Apart`, `Limit`, zero testing and inert-form behavior can change answers or expose loops. Successful W15 execution does not establish v2 compatibility [R4].
6. **Incomplete special-function coverage.** Section 8 is broad but finite, and Bessel rules are disabled by default [R6].
7. **Corpus bias.** The native suite was developed with Rubi and stores Rubi step counts alongside optimal answers [T3]. Excellent native scores do not predict the Blake/Hebisch results.
8. **Failure categories are not proofs.** `Unintegrable`, `CannotIntegrate`, timeout, unimplemented host functionality and an actual non-elementary integral must remain separate in our runner.

## 2. Test suites, grading and published results

### 2.1 Rubi's original test suite

The Rubi test suite pairs each integrand and variable with an optimal antiderivative and a Rubi step count. It is available in Mathematica, Maple, Axiom and Maxima syntaxes [T3]. Our designated source is the separate `MathematicaSyntaxTestSuite` repository, to be pinned as a submodule during baseline setup.

The published 72,944-problem summary has nine sections. The table below reproduces Rubi's site's O:S:H:N values as A:B:C:F for readability [T1]. These are historical results on different CAS versions, not a W15 baseline.

| Section | Problems | Rubi 4.16.1 A | B | C | F | Mathematica 11.3 A | B | C | F |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Independent suites | 1,892 | 1,838 | 28 | 7 | 19 | 1,579 | 123 | 149 | 41 |
| Algebraic | 26,125 | 26,092 | 9 | 13 | 11 | 19,886 | 1,252 | 4,342 | 645 |
| Exponential | 965 | 963 | 0 | 0 | 2 | 844 | 50 | 9 | 62 |
| Logarithmic | 3,085 | 3,078 | 1 | 0 | 6 | 2,387 | 377 | 199 | 122 |
| Trigonometric | 22,551 | 22,515 | 12 | 5 | 19 | 13,443 | 3,445 | 4,436 | 1,227 |
| Inverse trigonometric | 4,585 | 4,582 | 1 | 0 | 2 | 3,965 | 225 | 193 | 202 |
| Hyperbolic | 5,166 | 5,164 | 0 | 2 | 0 | 3,989 | 503 | 386 | 288 |
| Inverse hyperbolic | 6,626 | 6,624 | 0 | 0 | 2 | 5,544 | 158 | 559 | 365 |
| Special functions | 1,949 | 1,947 | 2 | 0 | 0 | 1,541 | 71 | 21 | 316 |
| **Total** | **72,944** | **72,803** | **53** | **27** | **61** | **53,178** | **6,204** | **10,294** | **3,268** |

This is the cleanest published **per-section A/B/C/F** comparison. Its 120-second timeout and older CAS versions must be kept attached to the numbers.

Other distributions have different counts. For example, SymPy's `integration-test-suites` imports 64,740 cases from chapters 1–8 into 186 JSONL files and documents import omissions [T4]. That is a useful cross-check, not the same corpus as the pinned 72,944-problem Mathematica suite.

### 2.2 Abbasi's independent expanded tests

Abbasi's reports combine the Rubi corpus with independent collections and test multiple systems. The Summer 2024 report has **106,812 problems**, adds Sam Blake and Waldek Hebisch collections, MIT Bee and handbook problems, and compares Mathematica 14, Rubi 4.17.3 on Mathematica 14, Maple 2024, FriCAS 1.3.10, Maxima 5.47, Giac/Xcas 1.9.0-99, SymPy 1.12, MuPAD and Reduce [T2].

The core grading rule is:

* **A:** correct/optimal function class and no more than twice the optimal antiderivative's size;
* **B:** correct and acceptable function class, but more than twice the optimal size;
* **C:** correct but unnecessarily uses a higher function class or complex numbers;
* **F:** unresolved integral, no result, timeout, hang, crash or exception.

The appendix orders function classes from rational (1), algebraic (2), elementary (3), special (4), hypergeometric (5), Appell (6), RootSum (7), unresolved integral (8), to unknown (9) [T2]. Size is `LeafCount` for Wolfram results; other systems use different tree measures, including an approximation for SymPy, so cross-CAS size comparisons are not perfectly uniform.

There is an important exception: for specially identified problems with no known closed form, a timely unevaluated integral receives A, while a timeout remains F; any produced antiderivative is highlighted and automatically receives A [T2]. Therefore "A" does not always mean that an antiderivative was produced, and "F" does not prove non-integrability.

#### Overall Summer 2024 grades and timings

| System | A | B | C | F | Mean time (s) | Normalized mean size |
|---|---:|---:|---:|---:|---:|---:|
| Rubi 4.17.3 | 84.74% | 2.50% | 2.12% | 6.86% | 0.67 | 1.40 |
| Mathematica 14 | 73.46% | 5.21% | 15.02% | 2.63% | 2.50 | 2.40 |
| Maple 2024 | 58.11% | 14.06% | 7.21% | 16.24% | 5.16 | 336.10 |
| FriCAS 1.3.10 | 50.54% | 18.94% | 4.54% | 22.79% | 0.94 | 7.02 |
| Giac/Xcas | 37.65% | 14.92% | 1.14% | 42.49% | 0.90 | 43.61 |
| Maxima | 36.59% | 10.61% | 1.54% | 47.46% | 0.25 | 238.38 |
| SymPy | 24.09% | 9.76% | 4.80% | 57.83% | 5.74 | 21.33 |

Published totals are 99,480 solved and 7,332 failed for Rubi, versus 104,000 solved and 2,812 failed for Mathematica [T2]. Timeout time is excluded from mean timing, and SageMath process overhead affects several other CAS timings. These are not clean single-machine W15 timings for our purposes.

#### Summer 2024 solved rates by section/collection

The current introduction publishes solved rates by section, but not a per-section A/B/C/F cross-tab. The table below therefore reports solved percentage, not A percentage. F is approximately 100 minus this value, subject to rounding.

| Section/collection | Problems | Rubi solved | Mathematica solved | Main implication |
|---|---:|---:|---:|---|
| Independent tests | 1,968 | 98.88% | 99.24% | Near parity |
| Algebraic binomial | 25,785 | 97.84% | 97.91% | Near parity in coverage |
| Algebraic trinomial | 13,812 | 94.98% | 95.71% | Small Rubi gap |
| Algebraic miscellaneous | 2,432 | 95.11% | 96.63% | Small Rubi gap |
| Exponentials | 5,375 | 98.83% | 97.51% | Rubi ahead |
| Logarithms | 3,237 | 96.20% | 97.25% | Small Rubi gap |
| Trigonometric | 23,422 | 98.39% | 97.84% | Rubi ahead |
| Inverse trigonometric | 5,082 | 99.35% | 98.58% | Rubi ahead |
| Hyperbolic | 5,513 | 97.08% | 98.40% | Small Rubi gap |
| Inverse hyperbolic | 4,349 | 99.63% | 98.92% | Rubi ahead |
| Special functions | 1,738 | 95.51% | 93.10% | Rubi ahead |
| Sam Blake files | 3,265 | **63.37%** | **94.09%** | Largest Rubi gap |
| Waldek Hebisch file | 10,335 | **62.56%** | **96.81%** | Largest Rubi gap |
| MIT Bee | 321 | 94.70% | 99.38% | Small independent-set gap |
| Table of integrals | 163 | 100% | 100% | Parity |

FriCAS solves 99.92% of the Hebisch file, Maxima 93.19%, and Maple 99.17%, compared with Rubi's 62.56% [T2]. This strongly suggests that general algebraic algorithms, rather than more local pattern patches alone, should be investigated for this gap.

**Source-count caveat:** the published Summer 2024 row counts above sum to 106,797, fifteen fewer than the report's stated 106,812 total, and no reconciliation is given on the page. Its input list also describes 3,015 Blake problems while Table 1.5 says 3,265. The table is reproduced as printed; our baseline must derive totals from the pinned input files rather than silently repairing these published figures.

For version context, the Summer 2023 report used 85,978 problems, Mathematica 13.3.1 and Rubi 4.17.3. It gave Rubi 85.37% A and 6.25% F versus Mathematica 75.34% A and 1.77% F, with the same large Blake/Hebisch coverage gap [T5]. That report imposed a three-CPU-minute integration limit and a separate three-minute verification limit; only Rubi and Mathematica results entered its verification phase, and other systems were assumed correct [T5]. Verification limits and unverified results must therefore be reported separately rather than silently converted into wrong answers.

### 2.3 Grading caveats and requirements for our baseline

1. **Do not mix report editions.** The 72,944, 85,978 and 106,812 problem corpora differ; CAS versions and timeouts also differ.
2. **Correctness precedes A/B/C.** Our baseline will differentiate the candidate and simplify `D[candidate,x]-integrand`. A wrong result is a separate, highest-severity status, never an A/B/C or ordinary F.
3. **Record unresolved verification.** `PossibleZeroQ`/simplification can time out or remain inconclusive. Use a bounded symbolic pipeline and, where useful, domain-aware exact/numerical spot checks as supporting evidence, not an infallible proof. Mark `unknown-verification` explicitly.
4. **Preserve failure provenance.** Distinguish unevaluated, residual integral, unsupported, timeout, memory abort, exception, crash and host-kernel incompatibility. Only a decision procedure's certificate should be labeled proven non-elementary.
5. **Grade only verified answers for size/class.** Compare `LeafCount` with the pinned optimal answer and detect higher functions/complex numbers using a documented classifier compatible with Abbasi's hierarchy.
6. **Report both corpus views.** Native Rubi sections measure answer quality; the Blake/Hebisch additions expose coverage. A single aggregate can hide regressions in either.
7. **Measure warm and cold loads separately.** Report integration CPU time, wall time, timeouts and memory. Do not include package cold start in every per-integral time, and do not hide timeout costs.
8. **Use pinned inputs and raw per-case output.** Store suite commit, Rubi commit, kernel version, flags, limits and machine details. Make grade tables reproducible from raw results rather than handwritten summaries.

## 3. What other integrators do that Rubi does not

### 3.1 Risch and the transcendental decision procedure

For a supported differential field of elementary functions, Risch's algorithm decides whether an elementary antiderivative exists and constructs it when it does. Practical implementations use tower representations, Hermite reduction, residue/logarithmic analysis and solutions of Risch differential equations. The crucial distinction is that a valid `NonElementaryIntegral` result is a mathematical certificate; `NotImplementedError`, a heuristic failure or a timeout is not [A1].

Rubi does not provide such a certificate. It also does not systematically produce the useful decomposition

```text
computed elementary part + reduced residual integral
```

that several Risch implementations can return. A hybrid can use this decomposition after Rubi stalls instead of discarding all partial progress.

Implementation scope matters. SymPy documents a partial transcendental Risch implementation, not trig or general algebraic coverage; Maple describes its `Risch` method as partial and excludes general algebraic functions [A1, A2]. "Uses Risch" is not a sufficient description of capability.

### 3.2 Risch–Norman and parallel Risch

Risch–Norman, also called parallel Risch, handles all tower generators **simultaneously**. "Parallel" here means parallel treatment of field extensions, not multicore execution. The method proposes a denominator and logarithm arguments, bounds numerator degrees, introduces undetermined coefficients, and solves one linear system [A2, A3].

Advantages over recursive Risch are speed, simpler implementation and often simpler answers. Maple exposes both `Norman` and `ParallelRisch`; its documentation notes that parallel treatment can produce substantially simpler results [A2]. SymPy's `heurisch` is a heuristic Risch–Norman method [A1].

The weakness is completeness: unless denominator, logarithm and degree candidates are proved exhaustive, an empty linear-system solution is only a heuristic failure. Sam Blake's 2026 preprint extends the method to a simple radical layer using an integral basis, Hermite-type denominator bounds and algebraic `S`-units as logarithm candidates. It proves completeness in stated one-variable/genus/number-field conditions, while lower-variable tower bounds and general multi-variable `S`-unit construction remain open [A3]. This is promising research, not a drop-in universally complete algorithm.

### 3.3 The algebraic case: Trager, Bronstein and FriCAS

Algebraic integration requires machinery beyond Rubi's pattern families: algebraic function fields, integral bases, Puiseux/local expansions, residues, divisors and genus/torsion considerations. Trager's algebraic algorithm and Bronstein's mixed-tower extensions underpin AXIOM/FriCAS implementations [A4]. Maple exposes `Trager` for a pure algebraic function in one unnested `RootOf` extension [A2].

FriCAS is especially relevant to our largest benchmark gap. In Blake's 2026 Charlwood study, FriCAS 1.3.6 verified 49 of 50 difficult integrals with a 0.1 s median; the remaining integral was non-elementary, although FriCAS's unevaluated output did not itself certify that fact [A4]. The same study cautions that this is one 50-problem benchmark, not a general performance ordering. Abbasi's independent Hebisch results provide broader evidence of FriCAS's algebraic strength [T2].

The practical lesson is to study and, where feasible, implement algebraic Hermite/Trager-style reduction and residues rather than attempt thousands of isolated algebraic rules. We can use public papers and clean-room implementations only; no proprietary kernel implementation inspection is needed or permitted.

### 3.4 Substitution and pseudo-elliptic methods

General decision procedures are not the only useful fallback. Wolfram's public 2021 article on `IntegrateAlgebraic` describes Laurent-polynomial substitutions, a generalized Günther substitution, expansion/term-wise integration, nested-radical rationalization, `SolveAlways` and Gröbner bases, with back-substitution and differentiation checks [A5]. It explicitly presents these as incomplete heuristic complements to a nearly complete transcendental Risch implementation, with branch-cut and uncovered-case limitations.

These methods align well with Rubi: both seek compact elementary answers, and substitution candidates can be verified independently. They are candidate sources, not correctness authorities. Pseudo-elliptic searches are also valuable when an apparently elliptic integral has an elementary antiderivative; Blake's Charlwood comparison includes cases where FriCAS finds an elementary answer while other systems return elliptic functions [A4].

### 3.5 Special-function antiderivatives

Classical elementary Risch decides elementary antiderivatives; it does not exhaust the useful closed forms involving `Erf`, `ExpIntegralEi`, incomplete gamma, elliptic integrals, polylogarithms or other special functions. Rubi addresses selected families through section 8 pattern rules, but not a general special-function decision framework.

Relevant complementary approaches are:

* **Generalized Risch for special functions.** Raab's 2013 work extends differential-field integration methods to special functions and parameter-integral identities [A6]. It is a research basis, not evidence of a ready-made complete implementation in our kernel.
* **Special-function kernels in parallel integration.** Blake's 2026 Part III preprint adds kernels for incomplete gamma at rational parameters, Ei/li/Si/Ci, erf/erfi and elliptic F/E/Pi to the same undetermined-coefficient linear system. It preserves an elementary answer whenever the underlying elementary method finds one, has a strict mode that certifies special functions are necessary, verifies answers by differentiation, and can return a reduced remainder [A7]. Open hypotheses and unsupported genus/classes remain explicit.
* **Meijer G/hypergeometric and elliptic methods.** Maple exposes `MeijerG`, `Elliptic` and `Pseudoelliptic`; SymPy uses Meijer G methods especially for definite integration [A1, A2]. These can recover closed forms outside elementary Risch, but a higher-function answer should be C when a compact elementary optimal answer exists.
* **Holonomic/creative-telescoping approaches.** These are particularly relevant to definite and parameterized integrals and special-function identities. They are outside the first indefinite-integration baseline but should remain in the longer-term design space.

The key selection rule is **elementary first**: never replace a verified compact elementary Rubi answer with a larger special-function answer merely because a more general fallback also succeeds.

## 4. Recommended technical direction

### 4.1 Evaluation pipeline

1. Normalize input without destroying Rubi's expected structural forms.
2. Run Rubi with bounded time, memory, recursion and cycle detection.
3. Verify a returned candidate by differentiation before accepting it.
4. If Rubi stalls or returns a residual integral, try a fallback appropriate to the classified integrand:
   * rational/algebraic reduction and residue methods;
   * transcendental Risch or Risch–Norman;
   * targeted algebraic substitutions/pseudo-elliptic searches;
   * special-function kernels or Meijer/hypergeometric methods.
5. Verify every fallback candidate. Keep a reduced remainder only when its decomposition is valid.
6. Among verified candidates, prefer the lowest necessary function class, then smaller `LeafCount`, while retaining Rubi's steps when available.
7. If no candidate verifies, return an honest unevaluated/residual result with provenance; never promote an unchecked answer.

### 4.2 Priority order after the baseline and paclet

1. **Exploit the measured Blake/Hebisch failures.** Cluster by normal form and failed utility/rule before writing new rules. Compare against public algebraic algorithms.
2. **Fix wrong answers and loops before adding coverage.** A wrong answer is worse than no answer; a new fast path must not bypass verification.
3. **Preserve Rubi's native A grades.** Every rule round needs per-section A/B/C/F, wrong-answer and timing diffs against the full pinned suite, plus the expanded independent collections.
4. **Build utility-semantics tests for v2.** Pattern dispatch, automatic evaluation, zero testing, simplification, substitution and limit behavior are compatibility risks at least as important as parser coverage.
5. **Treat recent preprints as research directions.** Reproduce claims on our corpus before relying on them; do not claim decision guarantees outside their stated hypotheses.

## 5. Sources

All web sources were accessed 2026-11-05. Local-source references point into this repository.

### Rubi design and implementation

* **[R1]** Rule-based Integration Organization, [Rubi: Rule-based Integrator](https://rulebasedintegration.org/) — design goals, decision-tree organization, native test overview and grading summary.
* **[R2]** Rule-based Integration Organization, [Using Rubi](https://rulebasedintegration.org/usingRubi.html) — `Int`, `Step`, `Steps`, `Stats`, loading flags, definite-integration limitation and memory images.
* **[R3]** Albert D. Rich and David J. Jeffrey, [“Crafting a Repository of Knowledge Based on Transformation Rules”](https://www.uwo.ca/apmaths/faculty/jeffrey/pdfs/IntegrationRules.pdf), author-hosted preprint, 2009; published as “A Knowledge Repository for Indefinite Integration Based on Transformation Rules,” CICM 2009, LNCS 5625, pp. 480–485, [DOI](https://doi.org/10.1007/978-3-642-02614-0_39).
* **[R4]** A. C. Norman and D. J. Jeffrey, [“Software for indefinite integration: Corundum.red — Integration for all”](https://ceur-ws.org/Vol-3754/paper12.pdf), SCSS 2024, CEUR-WS Vol. 3754, pp. 74–83 — current state, host dependence, utilities, loops and incomplete Rubi 5 porting plans.
* **[R5]** This repository, [README.md](../../README.md) — notebook/generated-source relationship, load order, step instrumentation and formatting.
* **[R6]** This repository, [Rubi/Rubi.m](../../Rubi/Rubi.m), [Rubi/Kernel/init.m](../../Rubi/Kernel/init.m), [Rubi/IntegrationUtilityFunctions.m](../../Rubi/IntegrationUtilityFunctions.m), [Rubi/PacletInfo.m](../../Rubi/PacletInfo.m), [CHANGELOG.md](../../CHANGELOG.md), and a representative [linear-binomial rule file](../../Rubi/IntegrationRules/1%20Algebraic%20functions/1.1%20Binomial%20products/1.1.1%20Linear/1.1.1.1%20%28a+b%20x%29^m.m), at commit `61e9c18ea248061cd83c67882f7c91a73cef912d`.
* **[R7]** RuleBasedIntegration, [Rubi releases](https://github.com/RuleBasedIntegration/Rubi/releases) and tags [`4.16.1.0`](https://github.com/RuleBasedIntegration/Rubi/releases/tag/4.16.1.0) and [`4.17.3.0`](https://github.com/RuleBasedIntegration/Rubi/releases/tag/4.17.3.0).

### Tests and grades

* **[T1]** Rule-based Integration Organization, [Integration Test Results](https://rulebasedintegration.org/testResults.html) — 72,944-problem per-section Rubi 4.16.1 / Mathematica 11.3 / Maple 2018.2 table and 120-second limit.
* **[T2]** Nasser M. Abbasi, [Computer Algebra Independent Integration Tests, Summer 2024 introduction](https://www.12000.org/my_notes/CAS_integration_tests/reports/summer_2024/indexchapter1.htm) and [grading appendix](https://www.12000.org/my_notes/CAS_integration_tests/reports/summer_2024/indexchapter5.htm), report dated 2024-05-23 — corpus, CAS versions, grades, timings and per-section solved rates.
* **[T3]** Rule-based Integration Organization, [Integration Test Problems](https://rulebasedintegration.org/testProblems.html) — test record contents, organization, syntax translations and provenance caveat.
* **[T4]** SymPy, [Rubi data README in integration-test-suites](https://github.com/sympy/integration-test-suites/blob/main/data/rubi/README.md) — distinct 64,740-case import and its section counts.
* **[T5]** Nasser M. Abbasi, [Computer Algebra Independent Integration Tests, Summer 2023 Rubi 4.17.3 edition](https://www.12000.org/my_notes/CAS_integration_tests/reports/summer_2023_Rubi_4_17_3/indexchapter1.htm), compiled 2024-01-02 — 85,978-problem comparison, three-minute limits and verification caveats.
* Abbasi's [current report index](https://www.12000.org/my_notes/CAS_integration_tests/index.htm) links later report builds. This note quotes the fully extracted Summer 2024 edition rather than mixing it with newer summary fragments.

### Algorithms and other systems

* **[A1]** SymPy documentation, [Symbolic Integrals](https://docs.sympy.org/latest/modules/integrals/integrals.html) — implemented transcendental Risch scope, `NonElementaryIntegral` versus `NotImplementedError`, heuristic Risch–Norman and Meijer G methods.
* **[A2]** Maple documentation, [Integration Methods](https://www.maplesoft.com/support/help/maple/view.aspx?path=int%2Fmethods) — `Risch`, `Norman`, `ParallelRisch`, `Trager`, `MeijerG`, `Elliptic` and `Pseudoelliptic` scopes and limitations.
* **[A3]** Sam Blake, [“Parallel Integration over Simple Radical Extensions”](https://arxiv.org/html/2608.29482v1), 2026 preprint — parallel ansatz, denominator/logarithm/degree bounds, algebraic `S`-units and explicit completeness limits.
* **[A4]** Sam Blake, [“Parallel Integration over Simple Radical Extensions in Mixed Towers: Charlwood's Integrals”](https://arxiv.org/html/2609.25616v1), 2026 preprint — FriCAS/Trager–Bronstein comparison, verification methodology and caveats.
* **[A5]** Sam Blake, Wolfram Blog, [“New Methods for Computing Algebraic Integrals”](https://blog.wolfram.com/2021/08/18/new-methods-for-computing-algebraic-integrals/), 2021-08-18 — public description of heuristic algebraic substitutions, Gröbner methods, verification and limitations.
* **[A6]** Clemens G. Raab, [“Generalization of Risch's Algorithm to Special Functions”](https://arxiv.org/abs/1305.1481), 2013 — differential-field methods for special functions and parameter integrals.
* **[A7]** Sam Blake, [“Parallel Integration over Simple Radical Extensions III: Antiderivatives in Terms of Special Functions”](https://arxiv.org/html/2610.04477v1), 2026 preprint — special-function kernels, elementary preservation, strict certification and remaining hypotheses.
