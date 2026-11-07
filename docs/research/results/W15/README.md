# W15 baseline: 85,842 integrals

**Corpus:** native Rubi, Blake, Blake rational and Hebisch records

**Method:** Wolfram Language 15.0 `Integrate`

**Coverage:** 85,842 of 85,842 rows; exact per-file index validation passed

## Headline results

| Problems | A | B | C | F (excluding unverified) | Unverified | Wrong | A % | F % |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 85,842 | 64,582 | 3,704 | 9,012 | 5,493 | 3,051 | 48 | 75.23 | 6.40 |

The full per-section grade and timing table is in `section-table.tsv`. `wrong.wl` contains the 48 initial wrong-answer candidates with source evidence; `wrong-keys.txt` lists their stable keys. Their strict second audit is complete: **41 wrong-derivative, 3 different-constant, 3 false alarms and 1 undecided**. See `wrong-audit-evidence.md` for every row's integrand, W15 answer, classification and 50-digit point evidence.

## Verification

Integration and verification used separate 180-second limits, a 4 GiB Wolfram-level memory limit and a 5 GiB worker cgroup. Completed rows are immutable and resumable. Aggregation merged 235 legacy repair rows and 771 deterministic repair rows.

Numeric verification samples are derived from each stable row key's UTF-8 bytes with SHA-256 and exact integer arithmetic, not kernel random state. Stephen independently ran `tools/baseline/SampleParity.wl` on W15 15.0 and v2 `bbae020d`; all eight real-corpus keys produced byte-identical real and complex sample points.

Seven worker-cgroup OOM row keys are preserved in `verification-oom-rows.txt`. Their bounded retry used two real and two complex deterministic samples; all seven remained undecided, with evidence in `verification-oom-small-sample-classified.wl`. The original failures were individual 5 GiB worker exits, not pod-wide OOM events.

## Files

- `summary.wl` / `summary.json`: coverage, grade, outcome and timing summaries
- `section-table.tsv`: per-section table
- `wrong.wl`: 48 wrong-answer candidates and audit evidence
- `wrong-keys.txt`: stable keys for those candidates
- `verification-oom-rows.txt`: keys for the bounded smaller-sample retry

The larger `wrong-and-unverified.wl` audit file is retained in the research result archive.

## Rubi on the 44 confirmed-failure rows

`wrong-rubi-comparison.md` and `.wl` compare Rubi on the 41 wrong-derivative and 3 different-constant W15 rows. Rubi solved **35 at grade A**, left **7 unresolved**, and produced **2 wrong answers** (`4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/464` and `/465`). Every row includes Rubi's answer, grade, classification and the same 50-digit derivative or region-constant check.

## Real-domain split

`real-domain-audit.md` and `.wl` repeat all 44 checks on signed real sample regions with the suite's optimal answer as control. The split is **27 wrong on safe reals**, **15 wrong only at complex or out-of-region parameters**, **0 false alarms**, and **2 undecided**. Secant rows 464 and 465 belong to the complex/out-of-region group for W15, but Rubi still fails them on safe reals.
