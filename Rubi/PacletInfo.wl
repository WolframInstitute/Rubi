(* ::Package:: *)

(* Paclet metadata for Albert D. Rich's rule-based integrator. *)

PacletObject[<|
	"Name" -> "WolframInstitute/Rubi",
	"Version" -> "4.17.3.2",
	"WolframVersion" -> "13+",
	"Description" -> "Rule-based indefinite integration using Albert D. Rich's integration rules",
	"Creator" -> "Albert D. Rich, Patrick Scheibe",
	"Thumbnail" -> "logo.png",
	"URL" -> "https://rulebasedintegration.org",
	"License" -> "MIT",
	"PrimaryContext" -> "Rubi`",
	"Extensions" -> {
		{
			"Kernel",
			"Root" -> "Kernel",
			"Context" -> "Rubi`",
			"Symbols" -> {
				"Rubi`Int",
				"Rubi`Step",
				"Rubi`Steps",
				"Rubi`Stats",
				"Rubi`RubiPrintInformation",
				"Rubi`RubiRule",
				"Rubi`RubiIntermediateResult",
				"Rubi`RubiStats",
				"Rubi`Unintegrable",
				"Rubi`CannotIntegrate",
				"Rubi`$Unintegrable",
				"Rubi`RubiClearMemoryImages",
				"Rubi`$RubiVersion",
				"Rubi`$RubiSourceCommit"
			}
		},
		{
			"Asset",
			"Assets" -> {
				{"IntegrationRules", "IntegrationRules"},
				{"Loader", "Rubi.m"},
				{"MemoryImages", "MemoryImages.wl"},
				{"IntegrationUtilities", "IntegrationUtilityFunctions.m"},
				{"PackageTools", "RubiPackageTools.m"},
				{"StepFormatting", "ShowStepFormatting.m"},
				{"StepRoutines", "ShowStepRoutines.m"},
				{"License", "LICENSE"}
			}
		},
		{"Documentation", "Language" -> "English"}
	}
|>]
