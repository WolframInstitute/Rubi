# Rubi baseline: 85,842 integrals

**Method:** Rubi 4.17.3.1 on Wolfram Language 15.0, loaded directly from the ordered source rules

**Coverage:** 85,842 of 85,842 rows; exact per-file index validation passed

## Headline results

| Problems | A | B | C | F (excluding unverified) | Unverified | Wrong | A % | F % |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 85,842 | 64,309 | 2,688 | 7,143 | 15,918 | 3,491 | 35 | 74.91 | 18.54 |

The full per-section table is in `section-table.tsv`. The W15 side-by-side comparison is in `../W15-vs-Rubi.md` and `../W15-vs-Rubi.tsv`. Rubi has a slightly lower overall A percentage than W15 (74.91% versus 75.23%) but substantially more unresolved or ungraded work, while its 35 numeric wrong-answer candidates are fewer than W15's 48.

All 319 verification repairs use the deterministic UTF-8/SHA-256 sampler. Numeric verification never uses kernel random state. `wrong.wl` contains the 35 wrong-answer candidates and `wrong-keys.txt` lists their stable keys; these are candidates for the same stricter real/complex derivative audit used for W15, not automatically confirmed Rubi bugs.

The larger `wrong-and-unverified.wl` audit file is retained in the research result archive.

## Rule grouping

`wrong-rule-groups.md` and `.wl` trace all 35 failures to their `RubiRule` applications. There are **10 first-rule groups**. The strict derivative audit confirms **22 wrong-derivative** results and leaves **13 undecided**; none was cleared as a false alarm. No rules have been changed.

`defective-steps.md` and `.wl` check each intermediate rewrite against the original integrand. In the quartic and ArcTanh groups, **18 first-failing steps** were identified: **5× rule 1176**, **6× rule 116**, and one each of rules **176, 39, 37, 758, 87, 755 and 1402**. Two ArcTanh rows require separate trace-layout review. Rule 1176 divides by `b^2 - 4 a c` without excluding zero.
