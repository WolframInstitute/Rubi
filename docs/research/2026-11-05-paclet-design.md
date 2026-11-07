# Rubi modern paclet design

**Project:** Wolfram Institute integration research

**Date:** 2026-11-05

**Status:** Implementation design

## Name and compatibility

The paclet is **`WolframInstitute/Rubi`**, with Wolfram Language context **``Rubi` ``**. The context and public entry points remain compatible with Albert D. Rich's package. The paclet version starts at `4.17.3.0`, matching the upstream release lineage; `$RubiSourceCommit` separately identifies upstream source snapshot `61e9c18ea248061cd83c67882f7c91a73cef912d`. These two identifiers must not be conflated.

The initial compatibility floor is Wolfram Language 13+. It is a tested-support claim only after the loading and behavior suite passes on that version; until then it is provisional metadata, not evidence of compatibility.

## Repository and paclet layout

```text
Rubi-repository/
|-- Rubi/                         paclet root
|   |-- PacletInfo.wl             PacletObject metadata and extensions
|   |-- Kernel/init.wl            modern paclet entry point
|   |-- Rubi.m                    Albert Rich's ordered source loader
|   |-- MemoryImages.wl           user-cache identity and atomic writes
|   |-- IntegrationRules/         221 extracted rule files, order preserved
|   |-- IntegrationUtilityFunctions.m
|   |-- ShowStepRoutines.m
|   |-- ShowStepFormatting.m
|   |-- ResourceDefinition.md     PacletPage resource definition source
|   |-- docs/Guides/              literate-Markdown guide source
|   |-- docs/Symbols/             literate-Markdown reference source
|   |-- Documentation/            generated notebooks; not committed
|   `-- LICENSE                   exact MIT licence in the archive
|-- tests/Paclet/                 loading, metadata and W15-recorded behavior tests
|-- tools/BuildPaclet.wls         archive build without loading the rules
|-- tools/BuildDocumentation.wls  PacletPage/MarkdownToNotebook documentation build
`-- docs/research/                research and design notes, not paclet pages
```

`Kernel/init.wl` loads either a compatible user-cache memory image or `Rubi.m`. The source loader and every integration-rule file remain in their current locations so direct development loading and the baseline runner retain their existing behavior. In particular, the modernization does not reorder, regenerate or reformat Albert Rich's rules.

## Loading and cache safety

Cold paclet loading reads the ordered source files and makes a best-effort MX image. Warm loading reads an image only when its identity matches all of:

- paclet version and upstream source commit;
- `$SystemID`, `$VersionNumber`, and a SHA-256 digest of the full `$Version` string;
- `$LoadShowSteps` and `$LoadElementaryFunctionRules`.

The full version identity is required because W15 and kernel v2 can both report version number 15.0. Images live below `$UserBaseDirectory/Caches/Rubi`, never in a potentially read-only installation. Writes use a unique temporary file followed by rename. Cache read or write failure falls back to source and never makes Rubi unavailable. Direct `Get["Rubi/Rubi.m"]` bypasses the image cache so a stale image cannot hide rule edits.

## Documentation

Markdown is the documentation source of truth. `Rubi/docs/Guides/Rubi.md` is the main guide. Reference pages cover the primary supported interface: `Int`, `Step`, `Steps`, `Stats`, `RubiPrintInformation`, `RubiRule`, `RubiIntermediateResult`, `RubiStats`, `Unintegrable`, `CannotIntegrate`, `$Unintegrable`, `RubiClearMemoryImages`, `$RubiVersion`, and `$RubiSourceCommit`. The numerous utility symbols remain available for compatibility but are not presented as the initial curated interface.

PacletPage's `BuildPacletDocumentation` drives MarkdownToNotebook and its documentation-build stage. Generated `.nb` files, build caches and the generated `ResourceDefinition.nb` are gitignored. The guide and resource definition preserve Albert Rich's authorship, link to rulebasedintegration.org, and state the definite-integration limitation explicitly. No cloud deployment, repository submission or documentation-site publication is part of an offline build.

## Tests and release gate

Tests fall into three layers:

1. Lightweight metadata and cache-identity tests that do not load the rule corpus.
2. Cold and warm full-load tests in a fresh kernel, including real integration, no installation-directory writes, cache cleanup and distinct W15/v2 cache identities.
3. `.wlt` behavior tests whose expected antiderivatives and step/statistics behavior are recorded from Rubi running on W15. These tests cover each public entry point and representative rule families; the full corpus remains the non-regression gate for rule changes.

An archive must contain the licence, metadata, loader, documentation and exact rule corpus, but no MX images. The modernization is not complete until cold/warm loading and W15-recorded behavior tests pass. Later rule-improvement rounds additionally require the complete graded suite to be at least as good, with wrong answers treated as more severe than unresolved integrals.
