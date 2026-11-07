# First defective Rubi rewrite steps

Counts: <|"defective-rule" -> 18, "undecided" -> 2|>

## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/481

- Integrand: `1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4))`
- Step: `2`; Rubi rule: `1176`
- LHS: `HoldComplete[Integrate[(a + b*x + c*x^2)^p/(d + e*x), x]]`
- RHS: `HoldComplete[((a + b*x + c*x^2)^p/((-c)*((a + b*x + c*x^2)/(b^2 - 4*a*c)))^p)*Integrate[((-a)*(c/(b^2 - 4*a*c)) - b*c*(x/(b^2 - 4*a*c)) - c^2*(x^2/(b^2 - 4*a*c)))^p/(d + e*x), x]]`
- Residual: `-(1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.00460437705727039214129830634574738462599237082834230804180755858663728381755`50.011971291644684, 0.90546012532909191553107544256975899008949847462702330386598624023640948535454`50.13415219900356, 0.29722743696568644753378527857077427397088208017879868586652402098974574581387`50.07671235596702}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1033

- Integrand: `x/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4]`
- Step: `3`; Rubi rule: `176`
- LHS: `HoldComplete[Integrate[(a + b*x^2)^(-1), x]]`
- RHS: `HoldComplete[(1/(Sqrt[a]*Sqrt[b]))*ArcTan[Sqrt[b]*(x/Sqrt[a])]]`
- Residual: `-(x/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4])`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {1.`49.79004704460005, 1.`49.81036764392085, 0.41762360898285466943369850620280816768337447405522864093260815416845729913726`50.00375624975403}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1026

- Integrand: `1/(x*Sqrt[2 + 2*a - 2*(1 + a) + c*x^4])`
- Step: `2`; Rubi rule: `39`
- LHS: `HoldComplete[Integrate[(b*x)^m*(c + d*x)^n, x]]`
- RHS: `HoldComplete[((c + d*x)^(n + 1)/(d*(n + 1)*(-d/(b*c))^m))*Hypergeometric2F1[-m, n + 1, n + 2, 1 + d*(x/c)]]`
- Residual: `-(1/(x*Sqrt[2 + 2*a - 2*(1 + a) + c*x^4]))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.99999999999999999999999999999999999999999999999999999999999999999999999999999`49.700273713814, 0.06924113716088035094436954162848205747299056994169979445118369030949691973392`50.01524101553446, 1.00000000000000000000000000000000000000000000000000000000000000000000000000001`49.84763416643038}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/499

- Integrand: `1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)^2)`
- Step: `2`; Rubi rule: `1176`
- LHS: `HoldComplete[Integrate[(a + b*x + c*x^2)^p/(d + e*x), x]]`
- RHS: `HoldComplete[((a + b*x + c*x^2)^p/((-c)*((a + b*x + c*x^2)/(b^2 - 4*a*c)))^p)*Integrate[((-a)*(c/(b^2 - 4*a*c)) - b*c*(x/(b^2 - 4*a*c)) - c^2*(x^2/(b^2 - 4*a*c)))^p/(d + e*x), x]]`
- Residual: `-(1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)^2))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.99999999999999999999999999999999999999999999999999999999999999999999999999998`49.704761957767246, 0.00155070975233264183333611859013132601665521910074845969460935732491104964249`50.05056754405877, 1.`49.720382465759904}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1035

- Integrand: `1/(x*Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4])`
- Step: `2`; Rubi rule: `37`
- LHS: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n, x]]`
- RHS: `HoldComplete[(p/b)*Subst[Integrate[x^(p*(m + 1) - 1)*(c - a*(d/b) + d*(x^p/b))^n, x], x, (a + b*x)^(1/p)]]`
- Residual: `-(1/(x*Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4]))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.99999999999999999999999999999999999999999999999999999999999999999999999999997`49.71286783912398, 1.`49.70690857262972, 0.81551496263190416249434007120967494743934824014894085810399830885571470726052`50.0278422704727}|>`
- Reason: first failing derivative identity


## defective-rule: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/283

- Integrand: `E^(n*ArcTanh[a*x])/(c - a*c*x)^(3/2)`
- Step: `2`; Rubi rule: `116`
- LHS: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p, x]]`
- RHS: `HoldComplete[((e + f*x)^FracPart[p]/((b/(b*e - a*f))^IntPart[p]*(b*((e + f*x)/(b*e - a*f)))^FracPart[p]))*Integrate[(a + b*x)^m*(c + d*x)^n*(b*(e/(b*e - a*f)) + b*f*(x/(b*e - a*f)))^p, x]]`
- Residual: `-(E^(n*ArcTanh[a*x])/(c - a*c*x)^(3/2))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.58673028217418920126747642666205325190041967674223901355315535423401726568886`50.08590828843395, 0.7626492139196995450489012241310261475103350181397507853507714928073697762631`50.11025764903616, 0.6366850853160990224649658714177367807213215711701874111776466266888042528451`50.02035909230944}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/428

- Integrand: `(a^2 + 2*a*b*x^2 + b^2*x^4)^2/x`
- Step: `2`; Rubi rule: `1176`
- LHS: `HoldComplete[Integrate[(a + b*x + c*x^2)^p/(d + e*x), x]]`
- RHS: `HoldComplete[((a + b*x + c*x^2)^p/((-c)*((a + b*x + c*x^2)/(b^2 - 4*a*c)))^p)*Integrate[((-a)*(c/(b^2 - 4*a*c)) - b*c*(x/(b^2 - 4*a*c)) - c^2*(x^2/(b^2 - 4*a*c)))^p/(d + e*x), x]]`
- Residual: `-((a^2 + 2*a*b*x^2 + b^2*x^4)^2/x)`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {1.00000000000000000000000000000000000000000000000000000000000000000000000000014`49.699124851521255, 0.99999999999999999999999999999999999999999999999999999999999999999999999999993`49.7123811074878, 0.99999999999999999999999999999999999999999999999999999999999999999999999999997`49.77198256689222}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1028

- Integrand: `1/(x^3*Sqrt[2 + 2*a - 2*(1 + a) + c*x^4])`
- Step: `1`; Rubi rule: `758`
- LHS: `HoldComplete[Integrate[(c*x)^m*(a + b*x^n)^p, x]]`
- RHS: `HoldComplete[(c*x)^(m + 1)*((a + b*x^n)^(p + 1)/(a*c*(m + 1)))]`
- Residual: `-(1/(x^3*Sqrt[2 + 2*a - 2*(1 + a) + c*x^4]))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {1.00000000000000000000000000000000000000000000000000000000000000000000000000001`49.78994983353726, 0.16572014794518163545890442434312468152686576081916252422856462000295557100443`50.0013112980455, 0.9999999999999999999999999999999999999999999999999999999999999999999999999999`49.699423343551615}|>`
- Reason: first failing derivative identity


## defective-rule: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/284

- Integrand: `E^(n*ArcTanh[a*x])/(c - a*c*x)^(5/2)`
- Step: `2`; Rubi rule: `116`
- LHS: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p, x]]`
- RHS: `HoldComplete[((e + f*x)^FracPart[p]/((b/(b*e - a*f))^IntPart[p]*(b*((e + f*x)/(b*e - a*f)))^FracPart[p]))*Integrate[(a + b*x)^m*(c + d*x)^n*(b*(e/(b*e - a*f)) + b*f*(x/(b*e - a*f)))^p, x]]`
- Residual: `-(E^(n*ArcTanh[a*x])/(c - a*c*x)^(5/2))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.99999999999999999999999999999999999999999999999999999999999999999999999999971`49.80240378297114, 0.28346436956978565897074065583760690327729486881919789592382256851605871750059`50.05032816666838, 1.`49.81840702653482}|>`
- Reason: first failing derivative identity


## undecided: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/428

- Integrand: `(x^3*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])`


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/453

- Integrand: `(a^2 + 2*a*b*x^2 + b^2*x^4)^3/x`
- Step: `2`; Rubi rule: `1176`
- LHS: `HoldComplete[Integrate[(a + b*x + c*x^2)^p/(d + e*x), x]]`
- RHS: `HoldComplete[((a + b*x + c*x^2)^p/((-c)*((a + b*x + c*x^2)/(b^2 - 4*a*c)))^p)*Integrate[((-a)*(c/(b^2 - 4*a*c)) - b*c*(x/(b^2 - 4*a*c)) - c^2*(x^2/(b^2 - 4*a*c)))^p/(d + e*x), x]]`
- Residual: `-((a^2 + 2*a*b*x^2 + b^2*x^4)^3/x)`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {1.`49.799083539214216, 1.00000000000000000000000000000000000000000000000000000000000000000000000000019`49.77023419925106, 0.06090612907901587000516749984204708402976130490521563028192861708465104476396`50.03863309948766}|>`
- Reason: first failing derivative identity


## defective-rule: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/285

- Integrand: `E^(n*ArcTanh[a*x])/(c - a*c*x)^(7/2)`
- Step: `2`; Rubi rule: `116`
- LHS: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p, x]]`
- RHS: `HoldComplete[((e + f*x)^FracPart[p]/((b/(b*e - a*f))^IntPart[p]*(b*((e + f*x)/(b*e - a*f)))^FracPart[p]))*Integrate[(a + b*x)^m*(c + d*x)^n*(b*(e/(b*e - a*f)) + b*f*(x/(b*e - a*f)))^p, x]]`
- Residual: `-(E^(n*ArcTanh[a*x])/(c - a*c*x)^(7/2))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.0658779451594433892181478720140123219736440116103896882453453198517442738204`50.114930691418216, 1.`49.70194160044614, 1.00000000000000000000000000000000000000000000000000000000000000000000000000006`49.71604958004339}|>`
- Reason: first failing derivative identity


## undecided: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/429

- Integrand: `(x^2*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])`


## defective-rule: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/278

- Integrand: `E^(n*ArcTanh[a*x])*(c - a*c*x)^(7/2)`
- Step: `2`; Rubi rule: `116`
- LHS: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p, x]]`
- RHS: `HoldComplete[((e + f*x)^FracPart[p]/((b/(b*e - a*f))^IntPart[p]*(b*((e + f*x)/(b*e - a*f)))^FracPart[p]))*Integrate[(a + b*x)^m*(c + d*x)^n*(b*(e/(b*e - a*f)) + b*f*(x/(b*e - a*f)))^p, x]]`
- Residual: `-(E^(n*ArcTanh[a*x])*(c - a*c*x)^(7/2))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.00248436221065404052741523399101469445207411450750659215663159732515669894964`50.04555862940844, 0.00122063454575490569316528887836712250085164931662510391961950826745929030941`50.06858849537326, 0.32743752254520945186493742192016689555883741031220445625031861187181642817253`50.112906555256494}|>`
- Reason: first failing derivative identity


## defective-rule: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/430

- Integrand: `(x*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])`
- Step: `6`; Rubi rule: `87`
- LHS: `HoldComplete[Integrate[Sqrt[e + f*x]/(Sqrt[a + b*x]*Sqrt[c + d*x]), x]]`
- RHS: `HoldComplete[Sqrt[e + f*x]*(Sqrt[b*((c + d*x)/(b*c - a*d))]/(Sqrt[c + d*x]*Sqrt[b*((e + f*x)/(b*e - a*f))]))*Integrate[Sqrt[b*(e/(b*e - a*f)) + b*f*(x/(b*e - a*f))]/(Sqrt[a + b*x]*Sqrt[b*(c/(b*c - a*d)) + b*d*(x/(b*c - a*d))]), x]]`
- Residual: `-((x*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])) - (3*(1 - a*x)^(3/2)*Sqrt[c - a*c*x])/(2*a*Sqrt[1 + a*x]) - ((1 - a*x)^(3/2)*(c - a*c*x)^(3/2))/(2*a*c*(1 + a*x)^(3/2)) - (3*Sqrt[1 - a*x]*(c - a*c*x)^(3/2))/(2*a*c*Sqrt[1 + a*x]) + ((-28*a*c^2*Sqrt[1 - a*x]*Sqrt[1 + a*x])/(15*Sqrt[c - a*c*x]) + (28*a*c*Sqrt[1 - a*x]*Sqrt[c - a*c*x])/(15*Sqrt[1 + a*x]) - (28*a*c*Sqrt[1 + a*x]*Sqrt[c - a*c*x])/(15*Sqrt[1 - a*x]) - (21*a*c*Sqrt[1 - a*x]*Sqrt[1 + a*x]*Sqrt[c - a*c*x])/10 + (7*a*Sqrt[1 - a*x]*(c - a*c*x)^(3/2))/(10*Sqrt[1 + a*x]) - (7*a*Sqrt[1 + a*x]*(c - a*c*x)^(3/2))/(10*Sqrt[1 - a*x]))/(a^2*c)`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {1.00000000000000000000000000000000000000000000000000000000000000000000000000001`49.763274871520466, 0.99999999999999999999999999999999999999999999999999999999999999999999999999999`49.791379760125345, 1.00000000000000000000000000000000000000000000000000000000000000000000000000003`49.7439972050072}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1031

- Integrand: `x^3/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4]`
- Step: `1`; Rubi rule: `755`
- LHS: `HoldComplete[Integrate[x^m*(a + b*x^n)^p, x]]`
- RHS: `HoldComplete[(a + b*x^n)^(p + 1)/(b*n*(p + 1))]`
- Residual: `-(x^3/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4])`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.04555626303943857649182889920246540089085664440473062665649938102494436905784`50.018364182180235, 0.33736945580700433202751648339937199114996919825634987897570454606849394132521`50.143338462793935, 0.03599501571144316904452456920785113739746674727270167231699422234583443114948`50.007954774129665}|>`
- Reason: first failing derivative identity


## defective-rule: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/279

- Integrand: `E^(n*ArcTanh[a*x])*(c - a*c*x)^(5/2)`
- Step: `2`; Rubi rule: `116`
- LHS: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p, x]]`
- RHS: `HoldComplete[((e + f*x)^FracPart[p]/((b/(b*e - a*f))^IntPart[p]*(b*((e + f*x)/(b*e - a*f)))^FracPart[p]))*Integrate[(a + b*x)^m*(c + d*x)^n*(b*(e/(b*e - a*f)) + b*f*(x/(b*e - a*f)))^p, x]]`
- Residual: `-(E^(n*ArcTanh[a*x])*(c - a*c*x)^(5/2))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.56594482705390027936142402689435861965320403213383972681315183768783462319368`50.00399525716703, 1.00000000000000000000000000000000000000000000000000000000000000000000000000001`49.760066397290466, 0.89305187355226875598141679167421713305435499263206259365853873205842244034465`50.12199385483445}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/520

- Integrand: `1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)^3)`
- Step: `2`; Rubi rule: `1176`
- LHS: `HoldComplete[Integrate[(a + b*x + c*x^2)^p/(d + e*x), x]]`
- RHS: `HoldComplete[((a + b*x + c*x^2)^p/((-c)*((a + b*x + c*x^2)/(b^2 - 4*a*c)))^p)*Integrate[((-a)*(c/(b^2 - 4*a*c)) - b*c*(x/(b^2 - 4*a*c)) - c^2*(x^2/(b^2 - 4*a*c)))^p/(d + e*x), x]]`
- Residual: `-(1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)^3))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {1.`49.73097050757333, 0.54209842781931571074494904550552713586088571771387882621189556228927381435981`50.11992631511757, 0.48931438569549566996484550306548569275879368088573870275941899133523945614916`50.00274840086189}|>`
- Reason: first failing derivative identity


## defective-rule: 1 Algebraic functions/1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1016

- Integrand: `1/Sqrt[a + b*x^2 + (2 + 2*c - 2*(1 + c))*x^4]`
- Step: `1`; Rubi rule: `1402`
- LHS: `HoldComplete[Integrate[(a + b*x^2 + c*x^4)^p, x]]`
- RHS: `HoldComplete[a^IntPart[p]*((a + b*x^2 + c*x^4)^FracPart[p]/((1 + 2*c*(x^2/(b + q)))^FracPart[p]*(1 + 2*c*(x^2/(b - q)))^FracPart[p]))*Integrate[(1 + 2*c*(x^2/(b + q)))^p*(1 + 2*c*(x^2/(b - q)))^p, x]]`
- Residual: `-(1/Sqrt[a + b*x^2 + (2 + 2*c - 2*(1 + c))*x^4])`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {1.`49.76570236784277, 0.70124559688011587990590765097372517930308179697435831088124972554295469333619`50.100850869857474, 0.87470739899402895259316836196080780510176789487437057330392752427038729441984`50.059471715469996}|>`
- Reason: first failing derivative identity


## defective-rule: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/280

- Integrand: `E^(n*ArcTanh[a*x])*(c - a*c*x)^(3/2)`
- Step: `2`; Rubi rule: `116`
- LHS: `HoldComplete[Integrate[(a + b*x)^m*(c + d*x)^n*(e + f*x)^p, x]]`
- RHS: `HoldComplete[((e + f*x)^FracPart[p]/((b/(b*e - a*f))^IntPart[p]*(b*((e + f*x)/(b*e - a*f)))^FracPart[p]))*Integrate[(a + b*x)^m*(c + d*x)^n*(b*(e/(b*e - a*f)) + b*f*(x/(b*e - a*f)))^p, x]]`
- Residual: `-(E^(n*ArcTanh[a*x])*(c - a*c*x)^(3/2))`
- Check: `<|"Method" -> "three-complex-50-digit", "Status" -> "defective-rule", "Scales" -> {0.40752685753176580495105473339621142783431996956983237561676767923484240090946`50.01001249887583, 0.16948908842221828233911280891794346268944470131359644524983154069907850210404`50.099915301689606, 0.99999999999999999999999999999999999999999999999999999999999999999999999999999`49.838322715765734}|>`
- Reason: first failing derivative identity
