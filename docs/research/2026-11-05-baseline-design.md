# Integration baseline design

**Date:** 2026-11-05  
**Scope:** W15 `Integrate` and Rubi 4.17.3 running on W15, on the native Rubi corpus and Abbasi's Blake and Hebisch additions. Rubi on kernel v2 is a separate, later baseline.

## 1. Reproducible inputs and stable identities

The native corpus is the `RuleBasedIntegration/MathematicaSyntaxTestSuite` submodule pinned at `32b79cedb8a5a80e82e6db9f67e9cdf88cf11217`. A native record normally has the form

```wl
{integrand, variable, rubiStepCount, optimalAntiderivative}
```

One Bondarenko record has a fifth field containing an alternative optimal antiderivative. Four- and five-field records are accepted; grading uses the smaller optimal `LeafCount`. Standalone comment blocks read by W15 as `Null` are discarded, while every non-`Null` record is shape-validated.

The additional source files and their SHA-256 hashes are recorded in `tests/Abbasi/manifest.json`. The Blake rational file already contains WL triples `{integrand, variable, optimal}`. The Blake main and Hebisch files use a restricted Maple-like syntax despite the download page's "Mathematica format" label. They are not evaluated as source code. A small parser in `tools/baseline` translates their arithmetic, lists and the functions `exp`, `ln`, `arctan`, `arctanh`, and `RootSum` to WL. Originals remain unchanged.

Maple `RootSum[p, z -> f]` becomes WL `RootSum` over pure functions, with `z` replaced by `#` in both slots. Names such as `_C0` and mathematical constants remain symbols. The translator rejects unknown functions, malformed records and non-finite numeric syntax rather than guessing.

W15 reads every native file with `ReadList` and every generated addition with `Get`. The inventory—not line counts or published totals—is authoritative. Each input receives the stable key

```text
section / relative-file / record-index
```

Record indices are one-based. W15's validated inventory contains 72,254 native records, 3,154 Blake main records, 99 Blake rational records, and 10,335 Hebisch records: **85,842 problems** in total. This differs from the published labels 72,944 native and 111 Blake rational. As an independent check, Abbasi's `CAS_integration_tests_2023_Mathematica_format.m` (SHA-256 `fc3c3268d69be8d480faef5bf9ceff8743e6fb12cf2e0ace68abb01f35221cb5`) contains 85,479 records: 71,990 native, followed by exactly 3,154 Blake main and 10,335 Hebisch records. It has no optimal antiderivatives and cannot supply the missing reference answers. The baseline therefore runs every validated pinned record and reports the discrepancy rather than silently reducing the count or inventing records.

The original worker trimmed two characters rather than one path separator from native relative paths, leaving section aliases such as `" Algebraic functions"`. Existing raw rows retain those aliases. Resume, verification repair and aggregation map them to canonical inventory sections without rewriting the raw rows or changing their graded evidence.

The generated additions, inventory and run manifests are deterministic. A manifest records source hashes, translator hash, Rubi commit, test-suite commit, W15 version, method, timeout and memory limits.

## 2. Execution and resumability

Eight independent W15 workers run on the licensed Linux pod. A worker loads Rubi only for the Rubi method; native W15 workers do not load Rubi. Records are assigned by `Mod[index - 1, 8]` within each file, so large files such as Hebisch are split as well. Workers write separate files; no output file is shared.

Each integration is bounded by:

- 180 seconds of W15 wall time using `TimeConstrained`;
- 4 GiB using `MemoryConstrained`;
- a separate 5 GiB no-swap container cgroup for each of the eight workers, 40 GiB in total;
- a cumulative 172,800-second outer deadline per shard.

`MemoryConstrained` is not treated as a process-RSS cap: W15's `MemoryInUse` remained below 1 GiB in the first run while cumulative native process memory reached the former shared 40 GiB container limit. Each worker now calls `ClearSystemCache[]` after every row and exits after each 100-row chunk so the supervisor can restart it in a fresh kernel. An isolated worker OOM cannot kill the other seven shards. The host supervisor logs `memory.peak` when the kernel provides it; on the current pod it instead records clearly labelled one-second sampled maxima of cgroup `memory.current` and anonymous RSS from `memory.stat`.

Before evaluating a row, the worker writes a transient marker containing its stable key and a prepared bounded-memory row. A successful row is flushed before the marker is deleted. After an OOM, a fresh recovery kernel increments that key's confirmed OOM count without integrating it. The first OOM writes no grade and is retried once in a fresh kernel. Only a second OOM for the same unfinished key writes `F/memory`, naming the 5 GiB limit. Outer timeouts and other abnormal exits write no grade row.

Integration and verification times are measured separately. A worker writes and flushes one complete WL association per problem before starting the next. Reruns read completed keys and skip them. A crash can therefore lose only the in-flight record. Partial or malformed resume data stops the affected shard for diagnosis and is never counted as a result. Each method and shard can be rerun independently.

Results live outside the rsync-synchronized source directory. Raw rows are immutable after a successful run; aggregation reads them without modifying them.

## 3. Outcome, correctness and grading

Every row contains at least:

```text
key, section, file, index, method, grade, outcome, correct,
answerSize, optimalSize, integrationTime, verificationTime,
verificationMethod, expressionType, answerType, error
```

`answerSize` is `LeafCount`; times are seconds. The answer expression is retained in WL `InputForm` for wrong answers and verifier-undecided cases, so the wrong-answer report is self-contained without bloating ordinary rows.

The outcome vocabulary is:

- `solved`: an answer without an unresolved integral was returned;
- `unresolved`: `Integrate`/`Int` remains in the answer;
- `timeout` or `memory`: the corresponding bound was exceeded;
- `error`: evaluation failed or the worker returned an exception marker;
- `wrong`: differentiation established a mismatch;
- `unverified`: neither symbolic nor numeric verification decided correctness.

Timeout, memory, error, unresolved and unverified cases conservatively receive F in raw rows, but their outcomes remain separate in tables. The headline aggregate F count excludes unverified rows and lists unverified immediately beside F, so verifier limits do not silently score either integration method down. Wrong answers also receive F and are reported in a dedicated list; they are never relabelled as ordinary failures to integrate. If both the reference and result are unevaluated integrals, the known-non-integrable case is recorded separately and graded A only when they agree.

For a solved result, correctness is checked before size or function-class grading. Conditions in `ConditionalExpression` are retained in provenance and the value part is checked. Piecewise expressions remain intact.

### Symbolic check

Compute `D[answer, variable] - integrand` once. Within a separate 180-second verification budget, try inexpensive simplification first, then `Simplify`, `FullSimplify`, and `PossibleZeroQ`. A proven zero ends verification. The exact successful method is stored.

### Deterministic numeric fallback

If symbolic checks are undecided, use a fixed per-problem seed and exact rational sample values, evaluated at 50-digit precision. The integration variable and symbolic parameters are sampled away from zero and coordinate singularities. Non-real values are included on a second pass to avoid relying on one real branch. Singular, indeterminate and non-finite samples are discarded and replaced, up to a fixed attempt bound.

The residual is scaled by `Max[1, Abs[integrand], Abs[D[answer, variable]]]` at each valid point. Numeric acceptance requires at least four valid points and all scaled residuals below `10^-20`. Rejection requires at least two valid points with scaled residuals above `10^-10`; mixed or intermediate evidence is `unverified`, not wrong. Numeric correctness is explicitly labelled as evidence, not a symbolic proof.

### A/B/C grade

Only verified answers enter Abbasi-style size/class grading:

- **A:** acceptable function class and `LeafCount[answer] <= 2 LeafCount[optimal]`;
- **B:** acceptable class but larger than twice the optimal size;
- **C:** a higher function class than necessary, or complex numbers when the optimal has none;
- **F:** unresolved, timeout, memory, evaluation error, wrong, or conservatively unverified.

Function classes follow Abbasi's published `GradeAntiderivative.m`: rational, algebraic, elementary, special, hypergeometric, Appell, `RootSum`, unresolved integral, then unknown. C takes precedence over B. Unknown result heads are class 9 and therefore C when the answer contains no unresolved integral. The grading reference is <https://www.12000.org/my_notes/CAS_integration_tests/reports/summer_2024/code/GradeAntiderivative.m>.

This baseline deliberately reports correctness provenance alongside the letter grade. A, B and C all mean correct under the stated symbolic-or-numeric check; they do not mean three different levels of correctness.

## 4. Aggregation and audits

Aggregation produces, for each method and section:

- problem count and A/B/C/F counts and percentages;
- solved, unresolved, timeout, memory, error, wrong and unverified counts;
- mean, median, p95 and total integration time, excluding no rows silently;
- mean and total answer leaf count for verified answers;
- symbolic versus numeric verification counts.

The wrong-answer list includes stable key, integrand, returned answer, optimal answer, verification method and residual samples. Summary counts must equal raw row counts. Duplicate keys, missing keys and changed inputs fail aggregation. Verifier-only repair rows are merged separately by stable key, retain the original verification provenance and record their explicit verification time limit. If the unverified count is substantial, those stored answers are reverified without rerunning integration, using a longer verification limit before the final table.

Before the full run, a smoke suite exercises simple rational, algebraic, elementary and special-function integrals, deliberate timeout/memory markers, an unresolved integral, a deliberately wrong answer, translation of every added function, resume behavior and all eight shards. Full execution starts only after these checks pass on the pod.

## 5. Later non-regression use

The same stable keys and raw-row schema are reused for paclet and rule-improvement rounds. Diffs compare grade, correctness, answer size and time problem by problem. Timing comparisons use the same pod, worker count and limits. A rule-improvement round is not accepted from aggregate percentages alone: every improved key is checked for compensating regressions, and every wrong or newly unverified key is inspected.
