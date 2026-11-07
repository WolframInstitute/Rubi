---
Template: Symbol
Name: $Unintegrable
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/$Unintegrable
Keywords: [integration, non-elementary, unresolved integral, Rubi]
SeeAlso: [Int, Unintegrable, CannotIntegrate]
RelatedGuides: [Rubi]
---

## Usage

<code>[$Unintegrable]()</code> controls whether Rubi retains the [Unintegrable]() wrapper for results designated as not integrable in closed form.

## Details & Options

- The default value is [False](), so [Unintegrable]() rewrites to an unresolved [Int]().
- Setting [$Unintegrable]() to [True]() changes result representation; it does not make Rubi a complete decision procedure.
- [CannotIntegrate]() remains a coverage failure, not a proof of non-elementarity.

## Basic Examples

Inspect the default result mode:

```wl
$Unintegrable
```

<!-- => False -->
