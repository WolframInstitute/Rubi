---
Template: Symbol
Name: Unintegrable
Context: Rubi`
Paclet: WolframInstitute/Rubi
URI: WolframInstitute/Rubi/ref/Unintegrable
Keywords: [integration, non-elementary, unresolved integral, Rubi]
SeeAlso: [Int, CannotIntegrate, $Unintegrable]
RelatedGuides: [Rubi]
---

## Usage

<code>[Unintegrable]()[*expression*, *variable*]</code> represents a result designated as not integrable in closed form when that result mode is enabled.

## Details & Options

- By default, [Unintegrable]() rewrites to an unresolved [Int]().
- [$Unintegrable]() controls whether the distinct [Unintegrable]() wrapper is retained.
- Rubi is not a complete decision procedure. An unresolved or unintegrated result from ordinary rule failure is not a proof of non-elementarity.

## Basic Examples

Retain the explicit wrapper for a non-elementary exponential integral:

```wl
Block[{$Unintegrable = True}, Unintegrable[Exp[x^2], x]]
```
