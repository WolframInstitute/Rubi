# Rubi - Rule-based Integration

This is a Mathematica implementation of the rule-based integrator called Rubi developed by Albert D. Rich.
Rubi is a large set of transformation rules that allows to determine the antiderivative of an expression by 
applying matching integration rules step by step until the final solution is found.
In principle, Rubi is independent of the implementation, because the integration rules could theoretically be used in any
sufficiently advanced language that supports symbolic pattern-matching and replacement rules.

Rubi out-performs Maple and Mathematica (the two major commercial computer algebra systems) on a grueling integration test suite,
consisting of over 70 thousand integrands and optimal antiderivatives.
One major advantage of Rubi is that it can provide the exact steps that are required to determine an antiderivative.
Since Rubi rules follow a decision tree, the transformation and the required conditions can be provided for each
integration step.

## Paclet

The `Rubi` directory is the **`WolframInstitute/Rubi`** paclet, with public context ``Rubi` ``. Build an archive without loading the rules:

```sh
wolframscript -file tools/BuildPaclet.wls
```

The paclet records upstream source snapshot `61e9c18ea248061cd83c67882f7c91a73cef912d` separately in `$RubiSourceCommit`. Paclet loading uses a versioned memory-image cache below `$UserBaseDirectory/Caches/Rubi`, never the installation directory. `RubiClearMemoryImages[]` removes those cache files. Direct development loading with `Get["Rubi/Rubi.m"]` still bypasses the cache so edited rules are not hidden by a stale image.

Albert D. Rich's rules remain under `Rubi/IntegrationRules`, with their original load order in `Rubi/Rubi.m`. The paclet includes the project's MIT licence and preserves the original authorship and attribution.

### Loading checks

Run the cold, warm and direct-source checks in separate fresh kernels with the same initially empty cache directory. Each check is bounded at 600 seconds and 4 GiB internally; run it in an externally memory-capped environment as well.

```sh
cache=$(mktemp -d)
wolframscript -file tools/CheckPacletLoading.wls cold "$cache"
wolframscript -file tools/CheckPacletLoading.wls warm "$cache"
wolframscript -file tools/CheckPacletLoading.wls direct "$cache"
rm -rf "$cache"
```

The warm check asserts that the MX image was actually loaded. The direct check runs with that image present and asserts that `Rubi.m` still bypasses it, as required for rule development and baseline workers.

## Documentation

The paclet's documentation is authored as literate Markdown under `Rubi/docs`, with `Rubi/ResourceDefinition.md` as its PacletPage definition. Build it with PacletPage and MarkdownToNotebook:

```sh
wolframscript -file tools/BuildDocumentation.wls
```

Set `PACLET_PAGE_DIRECTORY` to a local PacletPage checkout when it is not installed, and `MARKDOWN_TO_NOTEBOOK` to a local `MarkdownToNotebook.wl` to avoid retrieving the published converter. The build evaluates the examples, so it requires a licensed kernel and loads the full rule corpus. Generated notebooks and build caches are gitignored; an offline documentation build does not deploy or publish anything.

The original user documentation remains at [rulebasedintegration.org](https://rulebasedintegration.org), including the [installation and usage guide](https://rulebasedintegration.org/mathematicaPackage.html). Development information is also available in the [Rubi GitHub Wiki](https://github.com/RuleBasedIntegration/Rubi/wiki) and the [original Rubi website](http://www.apmaths.uwo.ca/~arich/).

## Repository structure and development

### General

1. The Rubi repository includes all notebooks containing the Rubi rules under the `IntegrationRuleNotebooks` directory.
This directory contains many sub-folders which reflect the separation of rules into logical sections (like rules for
algebraic functions or rules for exponentials). The advantage of the notebooks is that they contain detailed information
about integration rules like references to the literature and further information
2. The `Rubi` folder contains the Mathematica package and wrapper code that (1) provides required utility functions (2)
loads the integration rules in the correct order (3) provides features to show formatted integration steps and integration
statistics. This folder contains all Rubi rules from the notebook that were automatically extracted into densely packed
package files under the `Rubi/IntegrationRules` folder. These `.m` files are not meant to be edited or looked at!

To extract the rules from the notebooks, we provide a helper package `RubiPackageTools.m` that can be used in the following
way from within Mathematica

```mma
<< "/path/to/Rubi/RubiPackageTools.m"
BuildIntegrationRules[]
```

This will extract all rules from the notebooks into `.m` files and place them into the
correct location under `Rubi/IntegrationRules`. The created package files are loaded from within `Rubi.m` with the
`LoadRules[]` functions. Again, the order in which the rules are loaded in `Rubi.m` is **vitally important** to get a 
working Rubi package.

### How showing integration steps works

The file `Rubi/ShowStepRoutines.m` contains most of the functionality to provide step-by-step integration.
It works by changing all Rubi rules for `Int` so that they

1. Stop at each step
2. Provide important information about the current step

In its core, it works by injecting code that employs `Hold` to stop evaluation.
Here is a simple example how this can be done

```mma
sum[0] = 0;
sum[n_] := n + sum[n - 1];

changeRule[HoldPattern[rhs_ :> lhs_]] := rhs :> HoldForm[lhs];
DownValues[sum] = changeRule /@ DownValues[sum];
```

Now we have to restart the evaluation in each recursive call to `sum`, but we can print out intermediate steps easily

```mma
FixedPoint[(Print[#]; ReleaseHold[#]) &, sum[4]]
```

Rubi's `Steps`, `Step` and `Stats` functions work similarly, but instead of directly printing the information, they
are collected with `Sow` and `Reap` and later formatted and printed.

The main content of the `ShowStepRoutines.m` is code to turn the `Int` rules into a readable form.

### Formatted output

When using `Steps[Int[expr, x]]` (or `Step`), Rubi collects a list of steps where each element is either `RubiRule[..]`
or `RubiIntermediateResult[..]`. The `Stats` function collects its information inside `RubiStats[..]`.
Formatting of these expressions is completely handled inside `Rubi/ShowStepFormatting.m`.
This file contains definitions how to format a single e.g. `RubiRule` expression and the final representation is built
in the function `PrintRubiSteps[..]`. 

The representation of the statistics is directly attached to the `Stats` symbol in its `FormatValues`. At the moment
it uses Mathematica's built-in ``BoxForm`ArrangeSummaryBox[..]`` that is also used for e.g. `CompiledFunction`,
`InterpolatingFunction`, etc.






