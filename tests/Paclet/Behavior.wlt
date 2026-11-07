(* Recorded from Rubi on 15.0.0 for Mac OS X ARM (64-bit) (May 19, 2026).
   Upstream source: 61e9c18ea248061cd83c67882f7c91a73cef912d. *)

PacletDirectoryLoad[FileNameJoin[{Directory[], "Rubi"}]]
Needs["Rubi`"]

VerificationTest[Int[x^2, x], x^3/3, TestID -> "polynomial-antiderivative"]

VerificationTest[Int[1/(1 + x^2), x], ArcTan[x], TestID -> "inverse-tangent-antiderivative"]

VerificationTest[Int[x*Exp[x], x], -E^x + E^x*x, TestID -> "integration-by-parts"]

VerificationTest[Int[Sin[x]^2, x], -1/2*(Cos[x]*Sin[x]) + Defer[Int][1, x]/2, TestID -> "trigonometric-antiderivative"]

VerificationTest[Int[Sqrt[1 - x^2], x], (x*Sqrt[1 - x^2])/2 + ArcSin[x]/2, TestID -> "algebraic-antiderivative"]

VerificationTest[Int[Log[x], x], -x + x*Log[x], TestID -> "logarithmic-antiderivative"]

VerificationTest[Int[Exp[-x^2], x], (Sqrt[Pi]*Erf[x])/2, TestID -> "special-function-antiderivative"]

VerificationTest[Int[{x, x^2, x^3}, x], {x^2/2, x^3/3, x^4/4}, TestID -> "list-of-integrands"]

VerificationTest[D[Int[1/(1 + x^2)^2, x], x] == 1/(1 + x^2)^2, -(x^2/(1 + x^2)^2) + (1 + x^2)^(-1) == (1 + x^2)^(-2), TestID -> "differentiation-check"]

VerificationTest[Last[Step[Int[x^2, x], RubiPrintInformation -> False]], x^3/3, TestID -> "single-step-result"]

VerificationTest[Last[Steps[Int[x^2, x], RubiPrintInformation -> False]], x^3/3, TestID -> "all-steps-antiderivative"]

VerificationTest[With[{statistics = First[Stats[Int[x^2, x], RubiPrintInformation -> False]]}, statistics /@ {"Steps", "NumberOfRules", "InputLeafCount", "OutputLeafCount"}], {1, 1, 3, 7}, TestID -> "statistics-properties"]
