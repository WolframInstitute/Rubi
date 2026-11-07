---
Template: Symbol
Name: $RubiVersion
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/$RubiVersion
Keywords: [integration, version, provenance, Rubi]
SeeAlso: [$RubiSourceCommit, RubiClearMemoryImages]
RelatedGuides: [Rubi]
---

## Usage

<code>[$RubiVersion]()</code> gives the loaded Rubi paclet version string.

## Details & Options

- The paclet version and upstream source commit identify different things. Use [$RubiSourceCommit]() to identify the exact upstream rule snapshot.

## Basic Examples

Show the loaded Rubi version:

```wl
$RubiVersion
```
