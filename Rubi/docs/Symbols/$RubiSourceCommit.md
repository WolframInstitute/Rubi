---
Template: Symbol
Name: $RubiSourceCommit
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/$RubiSourceCommit
Keywords: [integration, source commit, provenance, Rubi]
SeeAlso: [$RubiVersion]
RelatedGuides: [Rubi]
---

## Usage

<code>[$RubiSourceCommit]()</code> gives the commit identifying the upstream Rubi source snapshot used by the paclet.

## Details & Options

- The value is a 40-character Git commit ID.
- Memory images are separated by this source identity so an image from another rule snapshot is not loaded.

## Basic Examples

Show the upstream source snapshot:

```wl
$RubiSourceCommit
```

<!-- => 61e9c18ea248061cd83c67882f7c91a73cef912d -->
