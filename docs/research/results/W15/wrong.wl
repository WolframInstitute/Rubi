{<|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.2 \
Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/153",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m",
  "index" -> 153, "method" -> "W15", "answerSize" -> 172,
  "optimalSize" -> 153, "integrationTime" -> 8.807169, "correct" -> False,
  "verificationTime" -> 0.133998, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.0431056355106756843`6., 0.1786435986431044017`6., \
0.2866820951670556994`6., 0.0922625429020094968`6., 0.1220982385836742567`6., \
0.4191136740123063296`6., 0.0191113259019864901`6., \
0.0525023553453898808`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 6, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> Missing["NotStored"], "originalVerificationTime" ->
   147.711795, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/((-a - b*x^2)^(1/3)*((9*a*d)/b + d*x^2))", "variable" -> "x",
  "optimal" -> "-1/12*(Sqrt[b]*ArcTan[(Sqrt[b]*x)/(3*Sqrt[a])])/(a^(5/6)*d) - \
(Sqrt[b]*ArcTan[(a^(1/3) + (-a - \
b*x^2)^(1/3))^2/(3*a^(1/6)*Sqrt[b]*x)])/(12*a^(5/6)*d) + \
(Sqrt[b]*ArcTanh[(Sqrt[3]*a^(1/6)*(a^(1/3) + (-a - \
b*x^2)^(1/3)))/(Sqrt[b]*x)])/(4*Sqrt[3]*a^(5/6)*d)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/425",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 425,
  "method" -> "W15", "answerSize" -> 132, "optimalSize" -> 102,
  "integrationTime" -> 0.436053, "correct" -> False,
  "verificationTime" -> 0.813429, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.3991330547908410908`6., 0.1610606558097516682`6., \
0.2078438351772740474`6., 0.9105390823669176539`6., 0.962497842221523006`6., \
0.5364500563805239129`6., 1.0325362754129161914`6., \
0.9238562167907043957`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((d*r*(a + b*Log[c*x^n]))/(d + e*x^r) + b*n*Log[d - \
d*x^r] - a*r*Log[d - d*x^r] + b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + \
b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + \
PolyLog[2, 1 + (e*x^r)/d]))/(d^2*r^2)", "originalVerificationTime" ->
   0.455466, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + b*Log[c*x^n])/(x*(d + e*x^r)^2)", "variable" -> "x",
  "optimal" -> "-((e*x^r*(a + b*Log[c*x^n]))/(d^2*r*(d + e*x^r))) - ((a + \
b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d^2*r) + (b*n*Log[d + e*x^r])/(d^2*r^2) + \
(b*n*PolyLog[2, -(d/(e*x^r))])/(d^2*r^2)"|>,
 <|"key" -> "3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/153",
  "section" -> "3 Logarithms", "file" -> "3.1.5 u (a+b log(c x^n))^p.m",
  "index" -> 153, "method" -> "W15", "answerSize" -> 162,
  "optimalSize" -> 304, "integrationTime" -> 0.518173, "correct" -> False,
  "verificationTime" -> 1.414958, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.8977612730720106316`6., 0.9605564463454038546`6., \
1.2964333998995896303`6., 1.0250601805294311244`6., 0.9987649436516530718`6., \
0.9447332459079399643`6., 1.2238473413440988174`6., \
1.0447564414535015736`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(-(b*f*k*m^2*n*x^m*Log[x]^2) - 2*(a*m + b*n + \
b*m*Log[c*x^n])*(f*k*x^m*Log[f - f/x^m] + e*Log[d*(e + f*x^m)^k]) + \
2*f*k*m*x^m*Log[x]*(a*m + b*n + b*m*Log[c*x^n] + b*n*Log[f - f/x^m] - \
b*n*Log[1 + (f*x^m)/e]) - 2*b*f*k*n*x^m*PolyLog[2, \
-((f*x^m)/e)])/(2*e*g*m^2*(g*x)^m)", "originalVerificationTime" -> 1.115311,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(g*x)^(-1 - m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]",
  "variable" -> "x", "optimal" -> "(b*f*k*n*x^m*Log[x])/(e*g*m*(g*x)^m) - \
(b*f*k*n*x^m*Log[x]^2)/(2*e*g*(g*x)^m) + (f*k*x^m*Log[x]*(a + \
b*Log[c*x^n]))/(e*g*(g*x)^m) - (b*f*k*n*x^m*Log[e + f*x^m])/(e*g*m^2*(g*x)^m) \
+ (b*f*k*n*x^m*Log[-((f*x^m)/e)]*Log[e + f*x^m])/(e*g*m^2*(g*x)^m) - \
(f*k*x^m*(a + b*Log[c*x^n])*Log[e + f*x^m])/(e*g*m*(g*x)^m) - (b*n*Log[d*(e + \
f*x^m)^k])/(g*m^2*(g*x)^m) - ((a + b*Log[c*x^n])*Log[d*(e + \
f*x^m)^k])/(g*m*(g*x)^m) + (b*f*k*n*x^m*PolyLog[2, 1 + \
(f*x^m)/e])/(e*g*m^2*(g*x)^m)"|>,
 <|"key" ->
   "4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/465",
  "section" -> "4 Trig functions",
  "file" -> "4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m",
  "index" -> 465, "method" -> "W15", "answerSize" -> 162,
  "optimalSize" -> 143, "integrationTime" -> 6.338888, "correct" -> False,
  "verificationTime" -> 15.355895, "verificationMethod" -> "numeric",
  "numericScales" -> "{0``97.94800006402244, 0``97.39805123369891, \
0.0205131969221071151`6., 0``96.19109112232415, 0``95.91891512295449, \
0.2643123243292244084`6., 0``95.96083762310893, 0.0119642333365475574`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 5,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "((a + b*(c*Sec[e + f*x])^n)^p*((2*Hypergeometric2F1[1, 1 + p, \
2 + p, 1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a]*(a + b*(c*Sqrt[Sec[e + \
f*x]^2])^n))/(a*n*(1 + p)) + (Hypergeometric2F1[2/n, -p, (2 + n)/n, \
-((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^2)/(1 + (b*(c*Sqrt[Sec[e + \
f*x]^2])^n)/a)^p))/(2*f)", "originalVerificationTime" -> 15.205469,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(a + b*(c*Sec[e + f*x])^n)^p*Tan[e + f*x]^3",
  "variable" -> "x", "optimal" -> "(Hypergeometric2F1[1, 1 + p, 2 + p, 1 + \
(b*(c*Sec[e + f*x])^n)/a]*(a + b*(c*Sec[e + f*x])^n)^(1 + p))/(a*f*n*(1 + p)) \
+ (Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sec[e + f*x])^n)/a)]*Sec[e + \
f*x]^2*(a + b*(c*Sec[e + f*x])^n)^p)/(2*f*(1 + (b*(c*Sec[e + f*x])^n)/a)^p)"|>\
, <|"key" -> "6 Hyperbolic functions/6.4 Hyperbolic cotangent/6.4.7 (d \
hyper)^m (a+b (c coth)^n)^p.m/49", "section" -> "6 Hyperbolic functions",
  "file" ->
   "6.4 Hyperbolic cotangent/6.4.7 (d hyper)^m (a+b (c coth)^n)^p.m",
  "index" -> 49, "method" -> "W15", "answerSize" -> 49, "optimalSize" -> 27,
  "integrationTime" -> 0.106991, "correct" -> False,
  "verificationTime" -> 1.150708, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.9894681962570608229`6., 0.4076198026722856111`6., \
1.0336268130703226407`6., 0.8128953051559095857`6., 1.3960946363418736474`6., \
1.1710959561093160775`6., 0.3675587936461523441`6., \
1.3925288322625192524`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 3, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(ArcSinh[(Sqrt[2]*Coth[x])/Sqrt[1 - Coth[x]^2]]*Sqrt[1 \
+ Coth[x]^2])/(Sqrt[2]*Sqrt[-1 - Coth[x]^2])", "originalVerificationTime" ->
   1.501521, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" -> "1/Sqrt[-1 - Coth[x]^2]",
  "variable" -> "x", "optimal" ->
   "ArcTan[(Sqrt[2]*Coth[x])/Sqrt[-1 - Coth[x]^2]]/Sqrt[2]"|>,
 <|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.1 Linear/1.1.1.3 \
(a+b x)^m (c+d x)^n (e+f x)^p.m/746", "section" -> "1 Algebraic functions",
  "file" -> "1.1 Binomial products/1.1.1 Linear/1.1.1.3 (a+b x)^m (c+d x)^n \
(e+f x)^p.m", "index" -> 746, "method" -> "W15", "grade" -> "F",
  "outcome" -> "wrong", "correct" -> False, "answerSize" -> 86,
  "optimalSize" -> 54, "integrationTime" -> 0.289966,
  "verificationTime" -> 0.114546, "verificationMethod" -> "numeric",
  "expressionType" -> 3, "answerType" -> 3, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "numericScales" -> "{0.4000298579313760937`6., 1.`6., 1.`6., 1.`6., \
1.`6., 0.6419567016179899223`6., 0.093475045278024015`6., 1.`6.}",
  "answer" -> Missing["NotStored"], "originalVerificationTime" -> 0.957153,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "1/(x*Sqrt[1 - a - b*x]*Sqrt[1 + a + b*x])",
  "variable" -> "x", "optimal" -> "(-2*ArcTanh[(Sqrt[1 - a]*Sqrt[1 + a + \
b*x])/(Sqrt[1 + a]*Sqrt[1 - a - b*x])])/Sqrt[1 - a^2]"|>,
 <|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.2 \
Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/130",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m",
  "index" -> 130, "method" -> "W15", "answerSize" -> 168,
  "optimalSize" -> 592, "integrationTime" -> 11.540457, "correct" -> False,
  "verificationTime" -> 0.065745, "verificationMethod" -> "numeric",
  "numericScales" ->
   "{1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> Missing["NotStored"], "originalVerificationTime" -> 33.774245,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(3*a + b*x^2)^2/(a - b*x^2)^(4/3)", "variable" -> "x",
  "optimal" -> "(45*x*(a - b*x^2)^(2/3))/7 + (6*x*(3*a + b*x^2))/(a - \
b*x^2)^(1/3) + (324*a*x)/(7*((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))) + \
(162*3^(1/4)*Sqrt[2 + Sqrt[3]]*a^(4/3)*(a^(1/3) - (a - \
b*x^2)^(1/3))*Sqrt[(a^(2/3) + a^(1/3)*(a - b*x^2)^(1/3) + (a - \
b*x^2)^(2/3))/((1 - Sqrt[3])*a^(1/3) - (a - \
b*x^2)^(1/3))^2]*EllipticE[ArcSin[((1 + Sqrt[3])*a^(1/3) - (a - \
b*x^2)^(1/3))/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))], -7 + \
4*Sqrt[3]])/(7*b*x*Sqrt[-((a^(1/3)*(a^(1/3) - (a - b*x^2)^(1/3)))/((1 - \
Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))^2)]) - \
(108*Sqrt[2]*3^(3/4)*a^(4/3)*(a^(1/3) - (a - b*x^2)^(1/3))*Sqrt[(a^(2/3) + \
a^(1/3)*(a - b*x^2)^(1/3) + (a - b*x^2)^(2/3))/((1 - Sqrt[3])*a^(1/3) - (a - \
b*x^2)^(1/3))^2]*EllipticF[ArcSin[((1 + Sqrt[3])*a^(1/3) - (a - \
b*x^2)^(1/3))/((1 - Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))], -7 + \
4*Sqrt[3]])/(7*b*x*Sqrt[-((a^(1/3)*(a^(1/3) - (a - b*x^2)^(1/3)))/((1 - \
Sqrt[3])*a^(1/3) - (a - b*x^2)^(1/3))^2)])"|>,
 <|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.2 \
Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/154",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m",
  "index" -> 154, "method" -> "W15", "answerSize" -> 148,
  "optimalSize" -> 151, "integrationTime" -> 9.086367, "correct" -> False,
  "verificationTime" -> 0.067686, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.0160258916491690793`6., 0.038196714607290037`6., \
0.0918977563180727749`6., 0.0387767949741941682`6., 0.0252113431015827515`6., \
0.0397928803552726938`6., 0.0162753545580212796`6., \
0.0150639309326503245`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 6, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> Missing["NotStored"], "originalVerificationTime" ->
   64.021164, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/((2 + b*x^2)^(1/3)*((18*d)/b + d*x^2))", "variable" -> "x",
  "optimal" -> "(Sqrt[b]*ArcTan[(Sqrt[b]*x)/(3*Sqrt[2])])/(12*2^(5/6)*d) + \
(Sqrt[b]*ArcTan[(2^(1/3) - (2 + \
b*x^2)^(1/3))^2/(3*2^(1/6)*Sqrt[b]*x)])/(12*2^(5/6)*d) - \
(Sqrt[b]*ArcTanh[(2^(1/6)*Sqrt[3]*(2^(1/3) - (2 + \
b*x^2)^(1/3)))/(Sqrt[b]*x)])/(4*2^(5/6)*Sqrt[3]*d)"|>,
 <|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.2 \
Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/322",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m",
  "index" -> 322, "method" -> "W15", "answerSize" -> 160,
  "optimalSize" -> 167, "integrationTime" -> 8.029189, "correct" -> False,
  "verificationTime" -> 0.082347, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.3327021631174462051`6., 1.`6., 1.`6., \
0.7680922547562476383`6., 0.2078098019436767282`6., 0.5508096591200473123`6., \
0.8707828211078969716`6., 1.`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 6, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> Missing["NotStored"], "originalVerificationTime" ->
   144.441733, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/((a + b*x^2)^(1/4)*(c + d*x^2))", "variable" -> "x",
  "optimal" -> "(a^(1/4)*Sqrt[-((b*x^2)/a)]*EllipticPi[-((Sqrt[a]*Sqrt[d])/Sq\
rt[-(b*c) + a*d]), ArcSin[(a + b*x^2)^(1/4)/a^(1/4)], \
-1])/(Sqrt[d]*Sqrt[-(b*c) + a*d]*x) - \
(a^(1/4)*Sqrt[-((b*x^2)/a)]*EllipticPi[(Sqrt[a]*Sqrt[d])/Sqrt[-(b*c) + a*d], \
ArcSin[(a + b*x^2)^(1/4)/a^(1/4)], -1])/(Sqrt[d]*Sqrt[-(b*c) + a*d]*x)"|>,
 <|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.3 \
General/1.1.3.4 (e x)^m (a+b x^n)^p (c+d x^n)^q.m/322",
  "section" -> "1 Algebraic functions", "file" -> "1.1 Binomial \
products/1.1.3 General/1.1.3.4 (e x)^m (a+b x^n)^p (c+d x^n)^q.m",
  "index" -> 322, "method" -> "W15", "answerSize" -> 166,
  "optimalSize" -> 64, "integrationTime" -> 15.1087, "correct" -> False,
  "verificationTime" -> 0.094542, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.4194716625922959506`6., 0.0917001750369202622`6., \
0.9129386151233249879`6., 0.2895704778392839706`6., 0.0730823405032741083`6., \
0.1485945163293131972`6., 0.1122046649011401973`6., \
0.0511886179057118479`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 6, "answerType" -> 6, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> Missing["NotStored"], "originalVerificationTime" ->
   89.718258, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/((8*c - d*x^3)*Sqrt[c + d*x^3])", "variable" -> "x",
  "optimal" -> "(x*Sqrt[1 + (d*x^3)/c]*AppellF1[1/3, 1, 1/2, 4/3, \
(d*x^3)/(8*c), -((d*x^3)/c)])/(8*c*Sqrt[c + d*x^3])"|>,
 <|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.3 \
General/1.1.3.4 (e x)^m (a+b x^n)^p (c+d x^n)^q.m/826",
  "section" -> "1 Algebraic functions", "file" -> "1.1 Binomial \
products/1.1.3 General/1.1.3.4 (e x)^m (a+b x^n)^p (c+d x^n)^q.m",
  "index" -> 826, "method" -> "W15", "answerSize" -> 110,
  "optimalSize" -> 85, "integrationTime" -> 0.334327, "correct" -> False,
  "verificationTime" -> 0.204336, "verificationMethod" -> "numeric",
  "numericScales" ->
   "{1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 5,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> Missing["NotStored"], "originalVerificationTime" -> 6.196882,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "((a + b/x^2)^p*(c + d/x^2)^q)/x^3", "variable" -> "x",
  "optimal" -> "-1/2*((a + b/x^2)^(1 + p)*(c + d/x^2)^q*Hypergeometric2F1[1 + \
p, -q, 2 + p, -((d*(a + b/x^2))/(b*c - a*d))])/(b*(1 + p)*((b*(c + \
d/x^2))/(b*c - a*d))^q)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/426",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 426,
  "method" -> "W15", "answerSize" -> 170, "optimalSize" -> 169,
  "integrationTime" -> 0.226053, "correct" -> False,
  "verificationTime" -> 1.004172, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.9537788952752706804`6., 0.9103044910398685223`6., \
0.9939708751286873059`6., 0.0229346849968828538`6., 0.9999812260471818918`6., \
1.1352174433848326448`6., 0.9982296233262798106`6., \
0.9999723520469620104`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((d^2*r*(a + b*Log[c*x^n]))/(d + e*x^r)^2 + (d*(-(b*n) \
+ 2*a*r + 2*b*r*Log[c*x^n]))/(d + e*x^r) + 3*b*n*Log[d - d*x^r] - 2*a*r*Log[d \
- d*x^r] + 2*b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + \
2*b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + \
PolyLog[2, 1 + (e*x^r)/d]))/(2*d^3*r^2)", "originalVerificationTime" ->
   0.495854, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + b*Log[c*x^n])/(x*(d + e*x^r)^3)", "variable" -> "x",
  "optimal" -> "-1/2*(b*n)/(d^2*r^2*(d + e*x^r)) - (b*n*Log[x])/(2*d^3*r) + \
(a + b*Log[c*x^n])/(2*d*r*(d + e*x^r)^2) - (e*x^r*(a + \
b*Log[c*x^n]))/(d^3*r*(d + e*x^r)) - ((a + b*Log[c*x^n])*Log[1 + \
d/(e*x^r)])/(d^3*r) + (3*b*n*Log[d + e*x^r])/(2*d^3*r^2) + (b*n*PolyLog[2, \
-(d/(e*x^r))])/(d^3*r^2)"|>,
 <|"key" -> "3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/154",
  "section" -> "3 Logarithms", "file" -> "3.1.5 u (a+b log(c x^n))^p.m",
  "index" -> 154, "method" -> "W15", "answerSize" -> 302,
  "optimalSize" -> 414, "integrationTime" -> 0.669834, "correct" -> False,
  "verificationTime" -> 1.758565, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.0017819744444054047`6., 0.6337112931941593224`6., \
1.0690968839736572323`6., 1.0602964941377209293`6., 0.3088559631454683215`6., \
1.0040971213385402821`6., 0.918783974387183793`6., 0.7719948777403195782`6.}"\
, "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 4, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "(-2*a*e*f*k*m*x^m - 3*b*e*f*k*n*x^m + \
b*f^2*k*m^2*n*x^(2*m)*Log[x]^2 - 2*b*e*f*k*m*x^m*Log[c*x^n] + \
2*a*f^2*k*m*x^(2*m)*Log[f - f/x^m] + b*f^2*k*n*x^(2*m)*Log[f - f/x^m] + \
2*b*f^2*k*m*x^(2*m)*Log[c*x^n]*Log[f - f/x^m] - 2*a*e^2*m*Log[d*(e + \
f*x^m)^k] - b*e^2*n*Log[d*(e + f*x^m)^k] - 2*b*e^2*m*Log[c*x^n]*Log[d*(e + \
f*x^m)^k] - f^2*k*m*x^(2*m)*Log[x]*(2*a*m + b*n + 2*b*m*Log[c*x^n] + \
2*b*n*Log[f - f/x^m] - 2*b*n*Log[1 + (f*x^m)/e]) + \
2*b*f^2*k*n*x^(2*m)*PolyLog[2, -((f*x^m)/e)])/(4*e^2*g*m^2*(g*x)^(2*m))",
  "originalVerificationTime" -> 1.220655, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(g*x)^(-1 - 2*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]",
  "variable" -> "x", "optimal" -> "(-3*b*f*k*n*x^m)/(4*e*g*m^2*(g*x)^(2*m)) - \
(b*f^2*k*n*x^(2*m)*Log[x])/(4*e^2*g*m*(g*x)^(2*m)) + \
(b*f^2*k*n*x^(2*m)*Log[x]^2)/(4*e^2*g*(g*x)^(2*m)) - (f*k*x^m*(a + \
b*Log[c*x^n]))/(2*e*g*m*(g*x)^(2*m)) - (f^2*k*x^(2*m)*Log[x]*(a + \
b*Log[c*x^n]))/(2*e^2*g*(g*x)^(2*m)) + (b*f^2*k*n*x^(2*m)*Log[e + \
f*x^m])/(4*e^2*g*m^2*(g*x)^(2*m)) - \
(b*f^2*k*n*x^(2*m)*Log[-((f*x^m)/e)]*Log[e + \
f*x^m])/(2*e^2*g*m^2*(g*x)^(2*m)) + (f^2*k*x^(2*m)*(a + b*Log[c*x^n])*Log[e + \
f*x^m])/(2*e^2*g*m*(g*x)^(2*m)) - (b*n*Log[d*(e + \
f*x^m)^k])/(4*g*m^2*(g*x)^(2*m)) - ((a + b*Log[c*x^n])*Log[d*(e + \
f*x^m)^k])/(2*g*m*(g*x)^(2*m)) - (b*f^2*k*n*x^(2*m)*PolyLog[2, 1 + \
(f*x^m)/e])/(2*e^2*g*m^2*(g*x)^(2*m))"|>,
 <|"key" -> "Blake/Blake_Problems.m/2066", "section" -> "Blake",
  "file" -> "Blake_Problems.m", "index" -> 2066, "method" -> "W15",
  "answerSize" -> 97, "optimalSize" -> 149, "integrationTime" -> 16.322461,
  "correct" -> False, "verificationTime" -> 2.028393,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.07247340275176768\
91`6., 0``98.58001731888805, 0``99.03438757674377, 0``98.44287960300795, \
1.3042527214760090412`6., 0``99.08831773660715, 0.2888446683548838309`6., \
0``99.01464924160071}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 5, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(4*((b + a*x^3)^2 - (7*a*(a + b)*x^6*(1 + \
(a*x^3)/b)^(1/4)*Hypergeometric2F1[1/4, 1/4, 5/4, (-2*a*x^3)/(b - a*x^3)])/(1 \
- (a*x^3)/b)^(1/4)))/(21*b^2*x^5*(x*(b + a*x^3))^(1/4))",
  "originalVerificationTime" -> 1.874554, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(b + a*x^6)/(x^6*(-b + a*x^3)*(b*x + a*x^4)^(1/4))", "variable" -> "x",
  "optimal" -> "(4*(b + a*x^3)*(b*x + a*x^4)^(3/4))/(21*b^2*x^6) - \
(2^(3/4)*(a^(7/4) + a^(3/4)*b)*ArcTan[(2^(1/4)*a^(1/4)*(b*x + \
a*x^4)^(3/4))/(b + a*x^3)])/(3*b^2) - (2^(3/4)*(a^(7/4) + \
a^(3/4)*b)*ArcTanh[(2^(1/4)*a^(1/4)*(b*x + a*x^4)^(3/4))/(b + \
a*x^3)])/(3*b^2)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/355",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 355,
  "method" -> "W15", "answerSize" -> 141, "optimalSize" -> 77,
  "integrationTime" -> 0.494037, "correct" -> False,
  "verificationTime" -> 1.188198, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.0054201273069422423`6., 0.5332046293265344971`6., \
0.5982031338536213753`6., 0.2061987423744778829`6., 0.0284148763179972788`6., \
1.2679756511550717475`6., 1.1560513860892537285`6., \
1.0398308907666912061`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((f*x)^m*(-(b*m^2*n*Log[x]^2) + a*m*Log[d - d*x^m] + \
b*m*Log[c*x^n]*Log[d - d*x^m] - b*n*Log[-((e*x^m)/d)]*Log[d + e*x^m] + \
m*Log[x]*(a*m + b*m*Log[c*x^n] - b*n*Log[d - d*x^m] + b*n*Log[d + e*x^m]) - \
b*n*PolyLog[2, 1 + (e*x^m)/d]))/(e*f*m^2*x^m)",
  "originalVerificationTime" -> 0.751043, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "((f*x)^(-1 + m)*(a + b*Log[c*x^n]))/(d + e*x^m)", "variable" -> "x",
  "optimal" -> "(x^(1 - m)*(f*x)^(-1 + m)*(a + b*Log[c*x^n])*Log[1 + \
(e*x^m)/d])/(e*m) + (b*n*x^(1 - m)*(f*x)^(-1 + m)*PolyLog[2, \
-((e*x^m)/d)])/(e*m^2)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/363",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 363,
  "method" -> "W15", "answerSize" -> 502, "optimalSize" -> 129,
  "integrationTime" -> 0.647033, "correct" -> False,
  "verificationTime" -> 1.30693, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.9745671724387977172`6., 1.0154443737222790381`6., \
0.0600121123949477542`6., 1.0347935162845530091`6., 0.9824671396341942677`6., \
1.2240440531002832165`6., 0.8760028206052560948`6., \
0.0098700265432229949`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((f*x)^m*(3*a^2*m^3*Log[x] - 6*a*b*m^3*n*Log[x]^2 + \
4*b^2*m^3*n^2*Log[x]^3 + 6*a*b*m^3*Log[x]*Log[c*x^n] - \
6*b^2*m^3*n*Log[x]^2*Log[c*x^n] + 3*b^2*m^3*Log[x]*Log[c*x^n]^2 + \
3*b^2*m^2*n^2*Log[x]^2*Log[1 + d/(e*x^m)] + 3*a^2*m^2*Log[d - d*x^m] - \
6*a*b*m^2*n*Log[x]*Log[d - d*x^m] + 3*b^2*m^2*n^2*Log[x]^2*Log[d - d*x^m] + \
6*a*b*m^2*Log[c*x^n]*Log[d - d*x^m] - 6*b^2*m^2*n*Log[x]*Log[c*x^n]*Log[d - \
d*x^m] + 3*b^2*m^2*Log[c*x^n]^2*Log[d - d*x^m] + 6*a*b*m^2*n*Log[x]*Log[d + \
e*x^m] - 6*b^2*m^2*n^2*Log[x]^2*Log[d + e*x^m] - \
6*a*b*m*n*Log[-((e*x^m)/d)]*Log[d + e*x^m] + \
6*b^2*m*n^2*Log[x]*Log[-((e*x^m)/d)]*Log[d + e*x^m] + \
6*b^2*m^2*n*Log[x]*Log[c*x^n]*Log[d + e*x^m] - \
6*b^2*m*n*Log[-((e*x^m)/d)]*Log[c*x^n]*Log[d + e*x^m] - \
6*b^2*m*n^2*Log[x]*PolyLog[2, -(d/(e*x^m))] - 6*b*m*n*(a - b*n*Log[x] + \
b*Log[c*x^n])*PolyLog[2, 1 + (e*x^m)/d] - 6*b^2*n^2*PolyLog[3, \
-(d/(e*x^m))]))/(3*e*f*m^3*x^m)", "originalVerificationTime" -> 1.314505,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)",
  "variable" -> "x", "optimal" -> "(x^(1 - m)*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n])^2*Log[1 + (e*x^m)/d])/(e*m) + (2*b*n*x^(1 - m)*(f*x)^(-1 + \
m)*(a + b*Log[c*x^n])*PolyLog[2, -((e*x^m)/d)])/(e*m^2) - (2*b^2*n^2*x^(1 - \
m)*(f*x)^(-1 + m)*PolyLog[3, -((e*x^m)/d)])/(e*m^3)"|>,
 <|"key" -> "3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/155",
  "section" -> "3 Logarithms", "file" -> "3.1.5 u (a+b log(c x^n))^p.m",
  "index" -> 155, "method" -> "W15", "answerSize" -> 358,
  "optimalSize" -> 484, "integrationTime" -> 0.513026, "correct" -> False,
  "verificationTime" -> 2.075616, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.9011930637468358263`6., \
0.00001721205036652932431334967027107937`6., 0.2393501558599201935`6., \
0.0053490679850567105`6., 0.0359513683251775216`6., 0.6957911175041455854`6., \
1.0081456337321242793`6., 0.9401450306129968303`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 4, "answerType" -> 4,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "(-6*a*e^2*f*k*m*x^m - \
5*b*e^2*f*k*n*x^m + 12*a*e*f^2*k*m*x^(2*m) + 16*b*e*f^2*k*n*x^(2*m) - \
6*b*f^3*k*m^2*n*x^(3*m)*Log[x]^2 - 6*b*e^2*f*k*m*x^m*Log[c*x^n] + \
12*b*e*f^2*k*m*x^(2*m)*Log[c*x^n] - 12*a*f^3*k*m*x^(3*m)*Log[f - f/x^m] - \
4*b*f^3*k*n*x^(3*m)*Log[f - f/x^m] - 12*b*f^3*k*m*x^(3*m)*Log[c*x^n]*Log[f - \
f/x^m] - 12*a*e^3*m*Log[d*(e + f*x^m)^k] - 4*b*e^3*n*Log[d*(e + f*x^m)^k] - \
12*b*e^3*m*Log[c*x^n]*Log[d*(e + f*x^m)^k] + 4*f^3*k*m*x^(3*m)*Log[x]*(3*a*m \
+ b*n + 3*b*m*Log[c*x^n] + 3*b*n*Log[f - f/x^m] - 3*b*n*Log[1 + (f*x^m)/e]) - \
12*b*f^3*k*n*x^(3*m)*PolyLog[2, -((f*x^m)/e)])/(36*e^3*g*m^2*(g*x)^(3*m))",
  "originalVerificationTime" -> 1.341013, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(g*x)^(-1 - 3*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]",
  "variable" -> "x", "optimal" -> "(-5*b*f*k*n*x^m)/(36*e*g*m^2*(g*x)^(3*m)) \
+ (4*b*f^2*k*n*x^(2*m))/(9*e^2*g*m^2*(g*x)^(3*m)) + \
(b*f^3*k*n*x^(3*m)*Log[x])/(9*e^3*g*m*(g*x)^(3*m)) - \
(b*f^3*k*n*x^(3*m)*Log[x]^2)/(6*e^3*g*(g*x)^(3*m)) - (f*k*x^m*(a + \
b*Log[c*x^n]))/(6*e*g*m*(g*x)^(3*m)) + (f^2*k*x^(2*m)*(a + \
b*Log[c*x^n]))/(3*e^2*g*m*(g*x)^(3*m)) + (f^3*k*x^(3*m)*Log[x]*(a + \
b*Log[c*x^n]))/(3*e^3*g*(g*x)^(3*m)) - (b*f^3*k*n*x^(3*m)*Log[e + \
f*x^m])/(9*e^3*g*m^2*(g*x)^(3*m)) + \
(b*f^3*k*n*x^(3*m)*Log[-((f*x^m)/e)]*Log[e + \
f*x^m])/(3*e^3*g*m^2*(g*x)^(3*m)) - (f^3*k*x^(3*m)*(a + b*Log[c*x^n])*Log[e + \
f*x^m])/(3*e^3*g*m*(g*x)^(3*m)) - (b*n*Log[d*(e + \
f*x^m)^k])/(9*g*m^2*(g*x)^(3*m)) - ((a + b*Log[c*x^n])*Log[d*(e + \
f*x^m)^k])/(3*g*m*(g*x)^(3*m)) + (b*f^3*k*n*x^(3*m)*PolyLog[2, 1 + \
(f*x^m)/e])/(3*e^3*g*m^2*(g*x)^(3*m))"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.4 Inverse hyperbolic \
cotangent/7.4.2 Exponentials of inverse hyperbolic cotangent functions.m/731"\
, "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.4 Inverse hyperbolic cotangent/7.4.2 Exponentials of inverse \
hyperbolic cotangent functions.m", "index" -> 731, "method" -> "W15",
  "answerSize" -> 129, "optimalSize" -> 172, "integrationTime" -> 0.289509,
  "correct" -> False, "verificationTime" -> 106.756233,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.29891853018821971\
56`6., 0.6212061960363130241`6., 0``97.40577774349426, 0``97.003385893698, \
1.8575440388052080674`6., 1.5218170950388523611`6., 1.6460305899490167517`6., \
0.2663190073810157`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 5, "answerType" -> 6, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(x^(1 + m)*((2*Sqrt[1 - a*x]*Sqrt[-(c*(1 + \
a*x))]*AppellF1[1 + m, 1/2, -1/2, 2 + m, a*x, -(a*x)])/(Sqrt[-1 + a*x]*Sqrt[1 \
+ a*x]) + (Sqrt[c - a^2*c*x^2]*Hypergeometric2F1[-1/2, (1 + m)/2, (3 + m)/2, \
a^2*x^2])/Sqrt[1 - a^2*x^2]))/(1 + m)", "originalVerificationTime" ->
   179.968824, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "E^(2*ArcCoth[a*x])*x^m*Sqrt[c - a^2*c*x^2]", "variable" -> "x",
  "optimal" -> "(x^(1 + m)*Sqrt[c - a^2*c*x^2])/(2 + m) - (c*(3 + 2*m)*x^(1 + \
m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (1 + m)/2, (3 + m)/2, \
a^2*x^2])/((1 + m)*(2 + m)*Sqrt[c - a^2*c*x^2]) - (2*a*c*x^(2 + m)*Sqrt[1 - \
a^2*x^2]*Hypergeometric2F1[1/2, (2 + m)/2, (4 + m)/2, a^2*x^2])/((2 + \
m)*Sqrt[c - a^2*c*x^2])"|>,
 <|"key" -> "8 Special functions/8.4 Trig integral functions.m/115",
  "section" -> "8 Special functions",
  "file" -> "8.4 Trig integral functions.m", "index" -> 115,
  "method" -> "W15", "answerSize" -> 13, "optimalSize" -> 50,
  "integrationTime" -> 0.043822, "correct" -> False,
  "verificationTime" -> 0.15332, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.8130973524982147743`6., 0.6329409472404206098`6., \
0.7959879303616590369`6., 0.2958210607257952838`6., 0.4994196848098606743`6., \
0.2647962761981632892`6., 0.178498269820128018`6., 0.3151147804772017244`6.}"\
, "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 9,
  "answerType" -> 4, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "-((Cos[b*x]*CosIntegral[b*x])/x)",
  "originalVerificationTime" -> 0.123696, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(Cos[b*x]*CosIntegral[b*x])/x^2", "variable" -> "x",
  "optimal" -> "-(b*CannotIntegrate[(CosIntegral[b*x]*Sin[b*x])/x, x]) - \
Cos[b*x]^2/x - (Cos[b*x]*CosIntegral[b*x])/x - b*SinIntegral[2*b*x]"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/364",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 364,
  "method" -> "W15", "answerSize" -> 157, "optimalSize" -> 138,
  "integrationTime" -> 0.859149, "correct" -> False,
  "verificationTime" -> 1.365892, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.9959380153600324327`6., 0.6155855288147040118`6., \
0.9999465046849800043`6., 1.1752727010115605667`6., 0.7121565963451911163`6., \
0.9892341489475880766`6., 0.1008686639463544137`6., \
0.0375777154101160131`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((f*x)^m*(-((m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)) - \
(2*a*b*m*n*Log[d - d*x^m])/d + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - \
d*x^m])/d + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + \
Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + \
(e*x^m)/d]))/d))/(e*f*m^3*x^m)", "originalVerificationTime" -> 1.081688,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^2",
  "variable" -> "x", "optimal" -> "-((x^(1 - m)*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n])^2)/(e*m*(d + e*x^m))) - (2*b*n*x^(1 - m)*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n])*Log[1 + d/(e*x^m)])/(d*e*m^2) + (2*b^2*n^2*x^(1 - m)*(f*x)^(-1 \
+ m)*PolyLog[2, -(d/(e*x^m))])/(d*e*m^3)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/741",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 741, "method" -> "W15", "answerSize" -> 200,
  "optimalSize" -> 209, "integrationTime" -> 0.405964, "correct" -> False,
  "verificationTime" -> 3.676689, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.2284254253793356349`6., 0.5710256387361810699`6., \
0``96.32383732007077, 1.2154654061610633482`6., 0.9753898876272690907`6., \
0``95.53141540256087, 0``98.61612314620123, 0``97.47636954210552}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 5,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "((-Sqrt[-a] + Sqrt[c]*x)*(d + e*x)^(-1 - 2*p)*(a + c*x^2)^p*(1 \
- (c*(d + e*x))/(c*d + Sqrt[-a]*Sqrt[c]*e))^p*Hypergeometric2F1[-1 - 2*p, -p, \
-2*p, (2*Sqrt[-a]*Sqrt[c]*(d + e*x))/((Sqrt[c]*d - Sqrt[-a]*e)*(Sqrt[-a] - \
Sqrt[c]*x))])/((Sqrt[c]*d + Sqrt[-a]*e)*(1 + 2*p)*(1 - (c*(d + e*x))/(c*d - \
Sqrt[-a]*Sqrt[c]*e))^p)", "originalVerificationTime" -> 2.908924,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(d + e*x)^(-2 - 2*p)*(a + c*x^2)^p", "variable" -> "x",
  "optimal" -> "-(((Sqrt[-a] - Sqrt[c]*x)*(d + e*x)^(-1 - 2*p)*(a + \
c*x^2)^p*Hypergeometric2F1[-1 - 2*p, -p, -2*p, (2*Sqrt[-a]*Sqrt[c]*(d + \
e*x))/((Sqrt[c]*d - Sqrt[-a]*e)*(Sqrt[-a] - Sqrt[c]*x))])/((Sqrt[c]*d + \
Sqrt[-a]*e)*(1 + 2*p)*(-(((Sqrt[c]*d + Sqrt[-a]*e)*(Sqrt[-a] + \
Sqrt[c]*x))/((Sqrt[c]*d - Sqrt[-a]*e)*(Sqrt[-a] - Sqrt[c]*x))))^p))"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/365",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 365,
  "method" -> "W15", "answerSize" -> 207, "optimalSize" -> 214,
  "integrationTime" -> 0.713452, "correct" -> False,
  "verificationTime" -> 1.411912, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.6176990850501649478`6., 0.3233053756991419037`6., \
1.0716410861879065951`6., 0.9565690057653696921`6., 0.6601747429936767651`6., \
1.18284910174440684`6., 1.0007321085598756151`6., 1.0005645679180962182`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 4, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "((f*x)^m*((2*b*m*n*(a + b*Log[c*x^n]))/(d*(d + e*x^m)) - \
(m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)^2 - (2*a*b*m*n*Log[d - d*x^m])/d^2 + \
(2*b^2*n^2*Log[d - d*x^m])/d^2 + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - \
d*x^m])/d^2 + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + \
Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + \
(e*x^m)/d]))/d^2))/(2*e*f*m^3*x^m)", "originalVerificationTime" -> 1.030537,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^3",
  "variable" -> "x", "optimal" -> "-((b*n*x*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n]))/(d^2*m^2*(d + e*x^m))) - (x^(1 - m)*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n])^2)/(2*e*m*(d + e*x^m)^2) - (b*n*x^(1 - m)*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n])*Log[1 + d/(e*x^m)])/(d^2*e*m^2) + (b^2*n^2*x^(1 - m)*(f*x)^(-1 \
+ m)*Log[d + e*x^m])/(d^2*e*m^3) + (b^2*n^2*x^(1 - m)*(f*x)^(-1 + \
m)*PolyLog[2, -(d/(e*x^m))])/(d^2*e*m^3)"|>,
 <|"key" ->
   "4 Trig functions/4.5 Secant/4.5.1.3 (d sin)^n (a+b sec)^m.m/285",
  "section" -> "4 Trig functions",
  "file" -> "4.5 Secant/4.5.1.3 (d sin)^n (a+b sec)^m.m", "index" -> 285,
  "method" -> "W15", "answerSize" -> 165, "optimalSize" -> 182,
  "integrationTime" -> 7.06259, "correct" -> False,
  "verificationTime" -> 31.61, "verificationMethod" -> "numeric",
  "numericScales" -> "{0``96.25662661546549, 0``97.97929930147298, \
0.246522469080733967`6., 0``97.1441880646415, 0``97.76211683556636, \
0``98.23226407832927, 0``97.80550066067617, 0.9426886515833412448`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "(a*e*Sec[(c + d*x)/2]^2*(1 + Sec[c + d*x])*(-10*Cot[c + d*x]^2 \
+ (2*(3 + Cot[c + d*x]*Csc[c + d*x])*(5*Cot[c + d*x]^2*Hypergeometric2F1[1/4, \
3/4, 5/4, -Tan[c + d*x]^2] + 3*Hypergeometric2F1[5/4, 5/4, 9/4, -Tan[c + \
d*x]^2])*Sec[c + d*x]*(Sec[c + d*x]^2)^(1/4))/(3 + Cot[c + d*x]^2*Sqrt[Sec[c \
+ d*x]^2])))/(30*d*(e*Csc[c + d*x])^(5/2))", "originalVerificationTime" ->
   28.537418, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + a*Sec[c + d*x])/(e*Csc[c + d*x])^(3/2)", "variable" -> "x",
  "optimal" -> "(-2*a)/(d*e*Sqrt[e*Csc[c + d*x]]) - (2*a*Cos[c + \
d*x])/(3*d*e*Sqrt[e*Csc[c + d*x]]) + (a*ArcTan[Sqrt[Sin[c + \
d*x]]])/(d*e*Sqrt[e*Csc[c + d*x]]*Sqrt[Sin[c + d*x]]) + (a*ArcTanh[Sqrt[Sin[c \
+ d*x]]])/(d*e*Sqrt[e*Csc[c + d*x]]*Sqrt[Sin[c + d*x]]) + (2*a*EllipticF[(c - \
Pi/2 + d*x)/2, 2])/(3*d*e*Sqrt[e*Csc[c + d*x]]*Sqrt[Sin[c + d*x]])"|>,
 <|"key" ->
   "4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/245",
  "section" -> "4 Trig functions",
  "file" -> "4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m", "index" -> 245,
  "method" -> "W15", "answerSize" -> 249, "optimalSize" -> 347,
  "integrationTime" -> 9.492047, "correct" -> False,
  "verificationTime" -> 69.755507, "verificationMethod" -> "numeric",
  "numericScales" -> "{0``95.40283973906205, 0.9065800101600175029`6., \
0``94.31108704729166, 0.931824574151317697`6., 0``91.6905774123738, \
0.9174932971475390919`6., 0.9009530727136763456`6., 0``95.59681630914051}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "-1/6*(Csc[c + d*x]*(24*Cot[c + d*x]^2*Hypergeometric2F1[-1/2, \
-1/4, 3/4, -Tan[c + d*x]^2] + 8*Hypergeometric2F1[1/2, 3/4, 7/4, -Tan[c + \
d*x]^2] - 3*Cot[c + d*x]^(3/2)*(2*Sqrt[2]*ArcTan[1 - Sqrt[2]*Sqrt[Cot[c + \
d*x]]] - 2*Sqrt[2]*ArcTan[1 + Sqrt[2]*Sqrt[Cot[c + d*x]]] + 8*Sqrt[Cot[c + \
d*x]] + Sqrt[2]*Log[1 - Sqrt[2]*Sqrt[Cot[c + d*x]] + Cot[c + d*x]] - \
Sqrt[2]*Log[1 + Sqrt[2]*Sqrt[Cot[c + d*x]] + Cot[c + d*x]]))*(1 + Sqrt[Sec[c \
+ d*x]^2])*Sin[(c + d*x)/2]^2)/(a*d*Sqrt[e*Cot[c + d*x]])",
  "originalVerificationTime" -> 53.463612, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/(Sqrt[e*Cot[c + d*x]]*(a + a*Sec[c + d*x]))", "variable" -> "x",
  "optimal" -> "(2*Cot[c + d*x]*(1 - Sec[c + d*x]))/(a*d*Sqrt[e*Cot[c + \
d*x]]) + (2*Sin[c + d*x])/(a*d*Sqrt[e*Cot[c + d*x]]) - (2*Cos[c + \
d*x]*EllipticE[c - Pi/4 + d*x, 2])/(a*d*Sqrt[e*Cot[c + d*x]]*Sqrt[Sin[2*c + \
2*d*x]]) - ArcTan[1 - Sqrt[2]*Sqrt[Tan[c + d*x]]]/(Sqrt[2]*a*d*Sqrt[e*Cot[c + \
d*x]]*Sqrt[Tan[c + d*x]]) + ArcTan[1 + Sqrt[2]*Sqrt[Tan[c + \
d*x]]]/(Sqrt[2]*a*d*Sqrt[e*Cot[c + d*x]]*Sqrt[Tan[c + d*x]]) + Log[1 - \
Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]]/(2*Sqrt[2]*a*d*Sqrt[e*Cot[c + \
d*x]]*Sqrt[Tan[c + d*x]]) - Log[1 + Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + \
d*x]]/(2*Sqrt[2]*a*d*Sqrt[e*Cot[c + d*x]]*Sqrt[Tan[c + d*x]])"|>,
 <|"key" -> "4 Trig functions/4.7 Miscellaneous/4.7.7 Trig functions.m/373",
  "section" -> "4 Trig functions",
  "file" -> "4.7 Miscellaneous/4.7.7 Trig functions.m", "index" -> 373,
  "method" -> "W15", "answerSize" -> 94, "optimalSize" -> 168,
  "integrationTime" -> 0.537046, "correct" -> False,
  "verificationTime" -> 0.275443, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.9804745835379897839`6., 0.0308948006392429259`6., \
0.0115127047844345715`6., 0.7691179341060539621`6., 0.9605603214187464425`6., \
1.54887920893848708940637218537502`6.*^-6, 0.9657801007007505833`6., \
0.9777891310067385784`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 3, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(Sec[(d + e*x)/2]^6*(152 + 69*Cos[d + e*x] - \
132*Cos[2*(d + e*x)] - 57*Cos[3*(d + e*x)] + 273*Sin[d + e*x] + 114*Sin[2*(d \
+ e*x)] - 19*Sin[3*(d + e*x)]))/(3072*a^4*e*(1 + Tan[(d + e*x)/2])^3)",
  "originalVerificationTime" -> 0.291991, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(2*a + 2*a*Cos[d + e*x] + 2*a*Sin[d + e*x])^(-4)", "variable" -> "x",
  "optimal" -> "-1/4*Log[1 + Tan[(d + e*x)/2]]/(a^4*e) - (Cos[d + e*x] - \
Sin[d + e*x])/(48*a*e*(a + a*Cos[d + e*x] + a*Sin[d + e*x])^3) + (5*(Cos[d + \
e*x] - Sin[d + e*x]))/(96*e*(a^2 + a^2*Cos[d + e*x] + a^2*Sin[d + e*x])^2) - \
(19*(a*Cos[d + e*x] - a*Sin[d + e*x]))/(96*e*(a^5 + a^5*Cos[d + e*x] + \
a^5*Sin[d + e*x]))"|>, <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse \
hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent \
functions.m/1133", "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 1133, "method" -> "W15",
  "answerSize" -> 130, "optimalSize" -> 172, "integrationTime" -> 0.27406,
  "correct" -> False, "verificationTime" -> 103.056655,
  "verificationMethod" -> "numeric", "numericScales" -> "{1.53992848629320619\
78`6., 1.4162265962554008642`6., 2.38699714255556024824095100719242`6.*^-45, \
1.9185185185185185185`6., 1.7925988462079639792`6., 1.7742782152230971128`6., \
1.5742642026009582478`6., 1.4401190181006694768`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 5, "answerType" -> 6,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "(x^(1 + m)*((-2*Sqrt[1 - \
a*x]*Sqrt[-(c*(1 + a*x))]*AppellF1[1 + m, 1/2, -1/2, 2 + m, a*x, \
-(a*x)])/(Sqrt[-1 + a*x]*Sqrt[1 + a*x]) - (Sqrt[c - \
a^2*c*x^2]*Hypergeometric2F1[-1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/Sqrt[1 - \
a^2*x^2]))/(1 + m)", "originalVerificationTime" -> 142.515047,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "E^(2*ArcTanh[a*x])*x^m*Sqrt[c - a^2*c*x^2]",
  "variable" -> "x", "optimal" -> "-((x^(1 + m)*Sqrt[c - a^2*c*x^2])/(2 + m)) \
+ (c*(3 + 2*m)*x^(1 + m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (1 + m)/2, \
(3 + m)/2, a^2*x^2])/((1 + m)*(2 + m)*Sqrt[c - a^2*c*x^2]) + (2*a*c*x^(2 + \
m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (2 + m)/2, (4 + m)/2, \
a^2*x^2])/((2 + m)*Sqrt[c - a^2*c*x^2])"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/366",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 366,
  "method" -> "W15", "answerSize" -> 240, "optimalSize" -> 346,
  "integrationTime" -> 0.81936, "correct" -> False,
  "verificationTime" -> 1.373821, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.0003047726403254797`6., 0.7249795149620447717`6., \
1.0000333927729818366`6., 0.618052325517566618`6., 0.9289332939428475657`6., \
1.0116259575795982885`6., 0.9999919362414050943`6., \
1.0000000395905678635`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((f*x)^m*((b*m*n*(a + b*Log[c*x^n]))/(d*(d + e*x^m)^2) \
- (m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)^3 + (b*n*(2*a*m - b*n + \
2*b*m*Log[c*x^n]))/(d^2*(d + e*x^m)) - (2*a*b*m*n*Log[d - d*x^m])/d^3 + \
(3*b^2*n^2*Log[d - d*x^m])/d^3 + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - \
d*x^m])/d^3 + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + \
Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + \
(e*x^m)/d]))/d^3))/(3*e*f*m^3*x^m)", "originalVerificationTime" -> 1.072285,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^4",
  "variable" -> "x", "optimal" -> "-1/3*(b^2*n^2*x^(1 - m)*(f*x)^(-1 + \
m))/(d^2*e*m^3*(d + e*x^m)) - (b^2*n^2*x^(1 - m)*(f*x)^(-1 + \
m)*Log[x])/(3*d^3*e*m^2) + (b*n*x^(1 - m)*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n]))/(3*d*e*m^2*(d + e*x^m)^2) - (2*b*n*x*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n]))/(3*d^3*m^2*(d + e*x^m)) - (x^(1 - m)*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n])^2)/(3*e*m*(d + e*x^m)^3) - (2*b*n*x^(1 - m)*(f*x)^(-1 + m)*(a + \
b*Log[c*x^n])*Log[1 + d/(e*x^m)])/(3*d^3*e*m^2) + (b^2*n^2*x^(1 - \
m)*(f*x)^(-1 + m)*Log[d + e*x^m])/(d^3*e*m^3) + (2*b^2*n^2*x^(1 - \
m)*(f*x)^(-1 + m)*PolyLog[2, -(d/(e*x^m))])/(3*d^3*e*m^3)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/430",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 430,
  "method" -> "W15", "answerSize" -> 270, "optimalSize" -> 94,
  "integrationTime" -> 0.315112, "correct" -> False,
  "verificationTime" -> 0.544091, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.261889519670885866`6., 0.2408296577616794288`6., \
0.404986325403289625`6., 0.0270913040749295938`6., 0.0459139077107772349`6., \
0.3025922318927974392`6., 0.1476494993625806835`6., \
0.0186385151123081987`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "-((a^2*r^2*Log[d - d*x^r] - 2*a*b*r^2*(n*Log[x] - \
Log[c*x^n])*Log[d - d*x^r] + b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - \
d*x^r] - 2*a*b*n*r*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + \
Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + \
2*b^2*n*r*(n*Log[x] - Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + \
Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + \
b^2*n^2*(r^2*Log[x]^2*Log[1 + d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, \
-(d/(e*x^r))] - 2*PolyLog[3, -(d/(e*x^r))]))/(d*r^3))",
  "originalVerificationTime" -> 0.32583, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + b*Log[c*x^n])^2/(x*(d + e*x^r))", "variable" -> "x",
  "optimal" -> "-(((a + b*Log[c*x^n])^2*Log[1 + d/(e*x^r)])/(d*r)) + \
(2*b*n*(a + b*Log[c*x^n])*PolyLog[2, -(d/(e*x^r))])/(d*r^2) + \
(2*b^2*n^2*PolyLog[3, -(d/(e*x^r))])/(d*r^3)"|>,
 <|"key" -> "3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/150",
  "section" -> "3 Logarithms", "file" -> "3.1.5 u (a+b log(c x^n))^p.m",
  "index" -> 150, "method" -> "W15", "answerSize" -> 410,
  "optimalSize" -> 433, "integrationTime" -> 0.492499, "correct" -> False,
  "verificationTime" -> 1.683837, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.0796678673620502916`6., 0.136209965097380124`6., \
0.0015124140651431787`6., 0.1369352550792724366`6., 1.1051241700822509579`6., \
0.1922040955370158276`6., 1.0276102936436122267`6., \
0.0010620693343827682`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((g*x)^(3*m)*(-36*a*e^2*f*k*m*x^m + 48*b*e^2*f*k*n*x^m \
+ 18*a*e*f^2*k*m*x^(2*m) - 15*b*e*f^2*k*n*x^(2*m) - 12*a*f^3*k*m*x^(3*m) + \
8*b*f^3*k*n*x^(3*m) - 36*b*e^3*k*m^2*n*Log[x]^2 - \
36*b*e^2*f*k*m*x^m*Log[c*x^n] + 18*b*e*f^2*k*m*x^(2*m)*Log[c*x^n] - \
12*b*f^3*k*m*x^(3*m)*Log[c*x^n] + 36*a*e^3*k*m*Log[e - e*x^m] - \
12*b*e^3*k*n*Log[e - e*x^m] + 36*b*e^3*k*m*Log[c*x^n]*Log[e - e*x^m] - \
36*b*e^3*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] + 12*e^3*k*m*Log[x]*(3*a*m - \
b*n + 3*b*m*Log[c*x^n] - 3*b*n*Log[e - e*x^m] + 3*b*n*Log[e + f*x^m]) + \
36*a*f^3*m*x^(3*m)*Log[d*(e + f*x^m)^k] - 12*b*f^3*n*x^(3*m)*Log[d*(e + \
f*x^m)^k] + 36*b*f^3*m*x^(3*m)*Log[c*x^n]*Log[d*(e + f*x^m)^k] - \
36*b*e^3*k*n*PolyLog[2, 1 + (f*x^m)/e]))/(108*f^3*g*m^2*x^(3*m))",
  "originalVerificationTime" -> 1.4591, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(g*x)^(-1 + 3*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]",
  "variable" -> "x", "optimal" -> "(2*b*k*n*(g*x)^(3*m))/(27*g*m^2) + \
(4*b*e^2*k*n*(g*x)^(3*m))/(9*f^2*g*m^2*x^(2*m)) - \
(5*b*e*k*n*(g*x)^(3*m))/(36*f*g*m^2*x^m) - (k*(g*x)^(3*m)*(a + \
b*Log[c*x^n]))/(9*g*m) - (e^2*k*(g*x)^(3*m)*(a + \
b*Log[c*x^n]))/(3*f^2*g*m*x^(2*m)) + (e*k*(g*x)^(3*m)*(a + \
b*Log[c*x^n]))/(6*f*g*m*x^m) - (b*e^3*k*n*(g*x)^(3*m)*Log[e + \
f*x^m])/(9*f^3*g*m^2*x^(3*m)) - \
(b*e^3*k*n*(g*x)^(3*m)*Log[-((f*x^m)/e)]*Log[e + \
f*x^m])/(3*f^3*g*m^2*x^(3*m)) + (e^3*k*(g*x)^(3*m)*(a + b*Log[c*x^n])*Log[e + \
f*x^m])/(3*f^3*g*m*x^(3*m)) - (b*n*(g*x)^(3*m)*Log[d*(e + \
f*x^m)^k])/(9*g*m^2) + ((g*x)^(3*m)*(a + b*Log[c*x^n])*Log[d*(e + \
f*x^m)^k])/(3*g*m) - (b*e^3*k*n*(g*x)^(3*m)*PolyLog[2, 1 + \
(f*x^m)/e])/(3*f^3*g*m^2*x^(3*m))"|>,
 <|"key" ->
   "4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/246",
  "section" -> "4 Trig functions",
  "file" -> "4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m", "index" -> 246,
  "method" -> "W15", "answerSize" -> 136, "optimalSize" -> 290,
  "integrationTime" -> 9.89461, "correct" -> False,
  "verificationTime" -> 134.853846, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.253588388826689915`6., 1.2233211363083927865`6., \
1.0865103951072682306`6., 1.0434211582875860401`6., 1.0009794764132811562`6., \
1.4233862626108166372`6., 0``95.5881100504654, 0``96.25928331722524}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "(2*Cot[c + d*x]^2*Csc[c + \
d*x]*((-1)^(3/4)*(ArcTan[(-1)^(3/4)*Sqrt[Cot[c + d*x]]] - \
ArcTanh[(-1)^(3/4)*Sqrt[Cot[c + d*x]]])*Sqrt[Cot[c + d*x]] + \
2*Hypergeometric2F1[1/4, 1/2, 5/4, -Tan[c + d*x]^2])*(1 + Sqrt[Sec[c + \
d*x]^2])*Sin[(c + d*x)/2]^2)/(a*d*(e*Cot[c + d*x])^(3/2))",
  "originalVerificationTime" -> 131.529321, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/((e*Cot[c + d*x])^(3/2)*(a + a*Sec[c + d*x]))", "variable" -> "x",
  "optimal" -> "(Cot[c + d*x]*Csc[c + d*x]*EllipticF[c - Pi/4 + d*x, \
2]*Sqrt[Sin[2*c + 2*d*x]])/(a*d*(e*Cot[c + d*x])^(3/2)) + ArcTan[1 - \
Sqrt[2]*Sqrt[Tan[c + d*x]]]/(Sqrt[2]*a*d*(e*Cot[c + d*x])^(3/2)*Tan[c + \
d*x]^(3/2)) - ArcTan[1 + Sqrt[2]*Sqrt[Tan[c + d*x]]]/(Sqrt[2]*a*d*(e*Cot[c + \
d*x])^(3/2)*Tan[c + d*x]^(3/2)) + Log[1 - Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c \
+ d*x]]/(2*Sqrt[2]*a*d*(e*Cot[c + d*x])^(3/2)*Tan[c + d*x]^(3/2)) - Log[1 + \
Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]]/(2*Sqrt[2]*a*d*(e*Cot[c + \
d*x])^(3/2)*Tan[c + d*x]^(3/2))"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1134",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 1134, "method" -> "W15",
  "answerSize" -> 66, "optimalSize" -> 169, "integrationTime" -> 0.232563,
  "correct" -> False, "verificationTime" -> 108.828521,
  "verificationMethod" -> "numeric", "numericScales" -> "{0``97.0183605694449\
2, 2.`6., 0.8198927654572687036`6., 0``97.24726460270728, \
1.12804900808086900106962437`6.*^-70, 1.5576895672735881721`6., \
1.435192816549317261`6., 2.`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 5, "answerType" -> 6, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(x^(1 + m)*Sqrt[1 - a^2*x^2]*AppellF1[1 + m, 3/2, \
-1/2, 2 + m, a*x, -(a*x)])/((1 + m)*Sqrt[-1 + a*x]*Sqrt[-(c*(1 + a*x))])",
  "originalVerificationTime" -> 114.924469, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(E^(2*ArcTanh[a*x])*x^m)/Sqrt[c - a^2*c*x^2]", "variable" -> "x",
  "optimal" -> "(2*x^(1 + m)*(1 + a*x))/Sqrt[c - a^2*c*x^2] - ((1 + 2*m)*x^(1 \
+ m)*Sqrt[1 - a^2*x^2]*Hypergeometric2F1[1/2, (1 + m)/2, (3 + m)/2, \
a^2*x^2])/((1 + m)*Sqrt[c - a^2*c*x^2]) - (2*a*(1 + m)*x^(2 + m)*Sqrt[1 - \
a^2*x^2]*Hypergeometric2F1[1/2, (2 + m)/2, (4 + m)/2, a^2*x^2])/((2 + \
m)*Sqrt[c - a^2*c*x^2])"|>, <|"key" -> "7 Inverse hyperbolic functions/7.4 \
Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic cotangent \
functions.m/238", "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.4 Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic \
cotangent functions.m", "index" -> 238, "method" -> "W15",
  "answerSize" -> 365, "optimalSize" -> 194, "integrationTime" -> 5.170128,
  "correct" -> False, "verificationTime" -> 11.538431,
  "verificationMethod" -> "numeric", "numericScales" -> "{1.14033155265710531\
89`6., 0.5048377715209480458`6., 0``97.28167218219332, \
1.3077324426513764233`6., 0``63.05397603096856, 0.1466328914855663518`6., \
0``97.0394624294234, 0``97.87166949894116}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 4, "answerType" -> 4,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "x*(ArcCoth[c + d*Tan[a + \
b*x]] + (2*a*Log[1 - c - d*Tan[a + b*x]] - I*Log[1 - I*Tan[a + b*x]]*Log[(-1 \
+ c + d*Tan[a + b*x])/(-1 + c - I*d)] + I*Log[1 + I*Tan[a + b*x]]*Log[(-1 + c \
+ d*Tan[a + b*x])/(-1 + c + I*d)] - 2*a*Log[1 + c + d*Tan[a + b*x]] + I*Log[1 \
- I*Tan[a + b*x]]*Log[(1 + c + d*Tan[a + b*x])/(1 + c - I*d)] - I*Log[1 + \
I*Tan[a + b*x]]*Log[(1 + c + d*Tan[a + b*x])/(1 + c + I*d)] + I*PolyLog[2, \
-((d*(-I + Tan[a + b*x]))/(-1 + c + I*d))] - I*PolyLog[2, -((d*(-I + Tan[a + \
b*x]))/(1 + c + I*d))] - I*PolyLog[2, -((d*(I + Tan[a + b*x]))/(-1 + c - \
I*d))] + I*PolyLog[2, -((d*(I + Tan[a + b*x]))/(1 + c - I*d))])/(4*a - \
(2*I)*Log[1 - I*Tan[a + b*x]] + (2*I)*Log[1 + I*Tan[a + b*x]]))",
  "originalVerificationTime" -> 15.444183, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "ArcCoth[c + d*Tan[a + b*x]]", "variable" -> "x",
  "optimal" -> "x*ArcCoth[c + d*Tan[a + b*x]] + (x*Log[1 + ((1 - c + \
I*d)*E^((2*I)*a + (2*I)*b*x))/(1 - c - I*d)])/2 - (x*Log[1 + ((1 + c - \
I*d)*E^((2*I)*a + (2*I)*b*x))/(1 + c + I*d)])/2 - ((I/4)*PolyLog[2, -(((1 - c \
+ I*d)*E^((2*I)*a + (2*I)*b*x))/(1 - c - I*d))])/b + ((I/4)*PolyLog[2, -(((1 \
+ c - I*d)*E^((2*I)*a + (2*I)*b*x))/(1 + c + I*d))])/b"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/415",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 415,
  "method" -> "W15", "answerSize" -> 132, "optimalSize" -> 102,
  "integrationTime" -> 0.41616, "correct" -> False,
  "verificationTime" -> 1.121614, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.020910888069858821`6., 1.0398124855800409736`6., \
0.0269343895845476474`6., 0.0333791345476329734`6., 0.9696314096633320834`6., \
0.9026716720371291908`6., 1.4063102307365359453`6., \
1.0505770014413794452`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((d*r*(a + b*Log[c*x^n]))/(d + e*x^r) + b*n*Log[d - \
d*x^r] - a*r*Log[d - d*x^r] + b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + \
b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + \
PolyLog[2, 1 + (e*x^r)/d]))/(d^2*r^2)", "originalVerificationTime" ->
   0.482758, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + b*Log[c*x^n])/(x*(d + e*x^r)^2)", "variable" -> "x",
  "optimal" -> "-((e*x^r*(a + b*Log[c*x^n]))/(d^2*r*(d + e*x^r))) - ((a + \
b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d^2*r) + (b*n*Log[d + e*x^r])/(d^2*r^2) + \
(b*n*PolyLog[2, -(d/(e*x^r))])/(d^2*r^2)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/431",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 431,
  "method" -> "W15", "answerSize" -> 397, "optimalSize" -> 182,
  "integrationTime" -> 0.365035, "correct" -> False,
  "verificationTime" -> 0.96339, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.0943623594743577866`6., 1.0010853157676391533`6., \
1.1196606595669243716`6., 1.0020805334805887892`6., 1.0016287922318432933`6., \
0.8602005686357037532`6., 1.0020820634915823723`6., \
0.0242843088755050939`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((d*r^2*(a + b*Log[c*x^n])^2)/(d + e*x^r) + \
2*a*b*n*r*Log[d - d*x^r] - a^2*r^2*Log[d - d*x^r] + 2*a*b*r^2*(n*Log[x] - \
Log[c*x^n])*Log[d - d*x^r] + 2*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*Log[d - \
d*x^r] - b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - d*x^r] - \
2*b^2*n^2*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + \
e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 2*a*b*n*r*((r^2*Log[x]^2)/2 + \
(-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) \
+ 2*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + \
Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) - \
b^2*n^2*(r^2*Log[x]^2*Log[1 + d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, \
-(d/(e*x^r))] - 2*PolyLog[3, -(d/(e*x^r))]))/(d^2*r^3)",
  "originalVerificationTime" -> 0.620719, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + b*Log[c*x^n])^2/(x*(d + e*x^r)^2)", "variable" -> "x",
  "optimal" -> "(a + b*Log[c*x^n])^2/(d*r*(d + e*x^r)) + (2*b*n*(a + \
b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d^2*r^2) - ((a + b*Log[c*x^n])^2*Log[1 + \
d/(e*x^r)])/(d^2*r) - (2*b^2*n^2*PolyLog[2, -(d/(e*x^r))])/(d^2*r^3) + \
(2*b*n*(a + b*Log[c*x^n])*PolyLog[2, -(d/(e*x^r))])/(d^2*r^2) + \
(2*b^2*n^2*PolyLog[3, -(d/(e*x^r))])/(d^2*r^3)"|>,
 <|"key" -> "3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/151",
  "section" -> "3 Logarithms", "file" -> "3.1.5 u (a+b log(c x^n))^p.m",
  "index" -> 151, "method" -> "W15", "answerSize" -> 352,
  "optimalSize" -> 363, "integrationTime" -> 0.544039, "correct" -> False,
  "verificationTime" -> 1.995742, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.9472010403742699245`6., 0.9914663727700400487`6., \
0.3902815989332568402`6., 0.078291799888825849`6., 0.3891490880573823067`6., \
0.3514583152429398699`6., 1.0431971097599740807`6., \
1.0114690365518111753`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((g*x)^(2*m)*(2*a*e*f*k*m*x^m - 3*b*e*f*k*n*x^m - \
a*f^2*k*m*x^(2*m) + b*f^2*k*n*x^(2*m) + 2*b*e^2*k*m^2*n*Log[x]^2 + \
2*b*e*f*k*m*x^m*Log[c*x^n] - b*f^2*k*m*x^(2*m)*Log[c*x^n] - 2*a*e^2*k*m*Log[e \
- e*x^m] + b*e^2*k*n*Log[e - e*x^m] - 2*b*e^2*k*m*Log[c*x^n]*Log[e - e*x^m] + \
2*b*e^2*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] + e^2*k*m*Log[x]*(-2*a*m + b*n - \
2*b*m*Log[c*x^n] + 2*b*n*Log[e - e*x^m] - 2*b*n*Log[e + f*x^m]) + \
2*a*f^2*m*x^(2*m)*Log[d*(e + f*x^m)^k] - b*f^2*n*x^(2*m)*Log[d*(e + f*x^m)^k] \
+ 2*b*f^2*m*x^(2*m)*Log[c*x^n]*Log[d*(e + f*x^m)^k] + 2*b*e^2*k*n*PolyLog[2, \
1 + (f*x^m)/e]))/(4*f^2*g*m^2*x^(2*m))", "originalVerificationTime" ->
   1.480442, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(g*x)^(-1 + 2*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]",
  "variable" -> "x", "optimal" -> "(b*k*n*(g*x)^(2*m))/(4*g*m^2) - \
(3*b*e*k*n*(g*x)^(2*m))/(4*f*g*m^2*x^m) - (k*(g*x)^(2*m)*(a + \
b*Log[c*x^n]))/(4*g*m) + (e*k*(g*x)^(2*m)*(a + b*Log[c*x^n]))/(2*f*g*m*x^m) + \
(b*e^2*k*n*(g*x)^(2*m)*Log[e + f*x^m])/(4*f^2*g*m^2*x^(2*m)) + \
(b*e^2*k*n*(g*x)^(2*m)*Log[-((f*x^m)/e)]*Log[e + \
f*x^m])/(2*f^2*g*m^2*x^(2*m)) - (e^2*k*(g*x)^(2*m)*(a + b*Log[c*x^n])*Log[e + \
f*x^m])/(2*f^2*g*m*x^(2*m)) - (b*n*(g*x)^(2*m)*Log[d*(e + \
f*x^m)^k])/(4*g*m^2) + ((g*x)^(2*m)*(a + b*Log[c*x^n])*Log[d*(e + \
f*x^m)^k])/(2*g*m) + (b*e^2*k*n*(g*x)^(2*m)*PolyLog[2, 1 + \
(f*x^m)/e])/(2*f^2*g*m^2*x^(2*m))"|>,
 <|"key" ->
   "4 Trig functions/4.1 Sine/4.1.2.2 (g cos)^p (a+b sin)^m (c+d \
sin)^n.m/1391", "section" -> "4 Trig functions",
  "file" -> "4.1 Sine/4.1.2.2 (g cos)^p (a+b sin)^m (c+d sin)^n.m",
  "index" -> 1391, "method" -> "W15", "answerSize" -> 404,
  "optimalSize" -> 380, "integrationTime" -> 46.036154, "correct" -> False,
  "verificationTime" -> 122.953797, "verificationMethod" -> "numeric",
  "numericScales" -> "{0``94.90720686907068, 0``88.59833591798505, \
1.0013225708311147289`6., 0``96.19962730044466, 0``89.18509418743078, \
0``94.57355954799837, 1.0722659402497006215`6., 0``94.44503561327954}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "(Cos[e + f*x]^2*(a^2 - b^2 + b^2*Cos[e + f*x]^2)*(Sec[e + \
f*x]^2)^(3/4)*((a*Hypergeometric2F1[1/2, 3/4, 3/2, -Tan[e + f*x]^2]*Tan[e + \
f*x])/(a^2 - b^2) + ((a^2*Sqrt[b]*ArcTan[((-a^2 + b^2)^(1/4)*(Sec[e + \
f*x]^2)^(1/4))/Sqrt[b]])/(-a^2 + b^2)^(3/4) - (a^2*Sqrt[b]*ArcTanh[((-a^2 + \
b^2)^(1/4)*(Sec[e + f*x]^2)^(1/4))/Sqrt[b]])/(-a^2 + b^2)^(3/4) - \
(2*b)/(Sec[e + f*x]^2)^(1/4) + (a^3*EllipticPi[-(Sqrt[-a^2 + b^2]/b), \
ArcSin[(Sec[e + f*x]^2)^(1/4)], -1]*Tan[e + f*x])/((a^2 - b^2)*Sqrt[-Tan[e + \
f*x]^2]) + (a^3*EllipticPi[Sqrt[-a^2 + b^2]/b, ArcSin[(Sec[e + \
f*x]^2)^(1/4)], -1]*Tan[e + f*x])/((a^2 - b^2)*Sqrt[-Tan[e + \
f*x]^2]))/b^2))/(f*Sqrt[g*Cos[e + f*x]]*(a + b*Sin[e + f*x])*(a - b*Cos[e + \
f*x]*Sqrt[Sec[e + f*x]^2]*Sin[e + f*x]))", "originalVerificationTime" ->
   106.567113, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "Sin[e + f*x]^2/(Sqrt[g*Cos[e + f*x]]*(a + b*Sin[e + f*x]))",
  "variable" -> "x", "optimal" -> "-((a^2*ArcTan[(Sqrt[b]*Sqrt[g*Cos[e + \
f*x]])/((-a^2 + b^2)^(1/4)*Sqrt[g])])/(b^(3/2)*(-a^2 + b^2)^(3/4)*f*Sqrt[g])) \
- (a^2*ArcTanh[(Sqrt[b]*Sqrt[g*Cos[e + f*x]])/((-a^2 + \
b^2)^(1/4)*Sqrt[g])])/(b^(3/2)*(-a^2 + b^2)^(3/4)*f*Sqrt[g]) - \
(2*Sqrt[g*Cos[e + f*x]])/(b*f*g) - (2*a*Sqrt[Cos[e + f*x]]*EllipticF[(e + \
f*x)/2, 2])/(b^2*f*Sqrt[g*Cos[e + f*x]]) + (a^3*Sqrt[Cos[e + \
f*x]]*EllipticPi[(2*b)/(b - Sqrt[-a^2 + b^2]), (e + f*x)/2, 2])/(b^2*(a^2 - \
b*(b - Sqrt[-a^2 + b^2]))*f*Sqrt[g*Cos[e + f*x]]) + (a^3*Sqrt[Cos[e + \
f*x]]*EllipticPi[(2*b)/(b + Sqrt[-a^2 + b^2]), (e + f*x)/2, 2])/(b^2*(a^2 - \
b*(b + Sqrt[-a^2 + b^2]))*f*Sqrt[g*Cos[e + f*x]])"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.4 Inverse hyperbolic \
cotangent/7.4.1 Inverse hyperbolic cotangent functions.m/255",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.4 Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic \
cotangent functions.m", "index" -> 255, "method" -> "W15",
  "answerSize" -> 390, "optimalSize" -> 194, "integrationTime" -> 4.700888,
  "correct" -> False, "verificationTime" -> 13.294079,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.45240669585340697\
58`6., 0``97.35670353372969, 0``97.6608792944246, 0``93.55358144428227, \
0``96.92702170514482, 0``97.51228648415496, 0``97.49057719773403, \
1.6541127535147981725`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "x*(ArcCoth[c + d*Cot[a + b*x]] + (2*a*Log[d + (-1 + \
c)*Tan[a + b*x]] + I*Log[1 + I*Tan[a + b*x]]*Log[((-I)*(d + (-1 + c)*Tan[a + \
b*x]))/(-1 + c - I*d)] - I*Log[1 - I*Tan[a + b*x]]*Log[(I*(d + (-1 + c)*Tan[a \
+ b*x]))/(-1 + c + I*d)] - 2*a*Log[d + (1 + c)*Tan[a + b*x]] + I*Log[1 - \
I*Tan[a + b*x]]*Log[(I*(d + (1 + c)*Tan[a + b*x]))/(1 + c + I*d)] - I*Log[1 + \
I*Tan[a + b*x]]*Log[(d + (1 + c)*Tan[a + b*x])/(I*(1 + c) + d)] - \
I*PolyLog[2, ((-1 + c)*(1 - I*Tan[a + b*x]))/(-1 + c + I*d)] + I*PolyLog[2, \
((1 + c)*(1 - I*Tan[a + b*x]))/(1 + c + I*d)] + I*PolyLog[2, ((-1 + c)*(1 + \
I*Tan[a + b*x]))/(-1 + c - I*d)] - I*PolyLog[2, ((1 + c)*(1 + I*Tan[a + \
b*x]))/(1 + c - I*d)])/(4*a - (2*I)*Log[1 - I*Tan[a + b*x]] + (2*I)*Log[1 + \
I*Tan[a + b*x]]))", "originalVerificationTime" -> 14.261036,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "ArcCoth[c + d*Cot[a + b*x]]", "variable" -> "x",
  "optimal" -> "x*ArcCoth[c + d*Cot[a + b*x]] + (x*Log[1 - ((1 - c - \
I*d)*E^((2*I)*a + (2*I)*b*x))/(1 - c + I*d)])/2 - (x*Log[1 - ((1 + c + \
I*d)*E^((2*I)*a + (2*I)*b*x))/(1 + c - I*d)])/2 - ((I/4)*PolyLog[2, ((1 - c - \
I*d)*E^((2*I)*a + (2*I)*b*x))/(1 - c + I*d)])/b + ((I/4)*PolyLog[2, ((1 + c + \
I*d)*E^((2*I)*a + (2*I)*b*x))/(1 + c - I*d)])/b"|>,
 <|"key" -> "Hebisch/Hebisch_Problems.m/2167", "section" -> "Hebisch",
  "file" -> "Hebisch_Problems.m", "index" -> 2167, "method" -> "W15",
  "answerSize" -> 34, "optimalSize" -> 18, "integrationTime" -> 0.36809,
  "correct" -> False, "verificationTime" -> 0.041655,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.14662842147492729\
03`6., 1.396158323247103511`6., 1.2000516946908428398`6., \
1.3676443409460894649`6., 1.3913806466225454812`6., 0.8111004991069833723`6., \
1.3836719753284657214`6., 1.2030066642594606072`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 3,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)",
  "answer" ->
   "-(Sqrt[3]*ArcTanh[x/Sqrt[3]]) + Log[1 + E^((3*x)/(-3 + x^2))*Log[x]]",
  "originalVerificationTime" -> 0.034424, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" -> "(9 - 6*x^2 + x^4 + (9*x + \
3*x^3)/E^((3*x)/(-3 + x^2)))/((9*x - 6*x^3 + x^5)/E^((3*x)/(-3 + x^2)) + (9*x \
- 6*x^3 + x^5)*Log[x])", "variable" -> "x",
  "optimal" -> "Log[E^((3*x)/(3 - x^2)) + Log[x]]"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/2576",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 2576, "method" -> "W15", "answerSize" -> 248,
  "optimalSize" -> 248, "integrationTime" -> 0.930796, "correct" -> False,
  "verificationTime" -> 5.160114, "verificationMethod" -> "numeric",
  "numericScales" -> "{0``98.6299625052572, 0``96.5753161027168, \
1.2995247612364510397`6., 0.3927575481751979339`6., 0.1142703372444982798`6., \
0``96.10158101034881, 1.2941119231388886307`6., 0``98.14270708684919}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 5,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "-((((e*(-b + Sqrt[b^2 - 4*a*c] - 2*c*x))/(2*c*d + (-b + \
Sqrt[b^2 - 4*a*c])*e))^(1 - p)*(d + e*x)^(-1 - 2*p)*(a + x*(b + c*x))^p*(1 - \
(2*c*(d + e*x))/(2*c*d + (-b + Sqrt[b^2 - \
4*a*c])*e))^(2*p)*Hypergeometric2F1[-1 - 2*p, -p, -2*p, (-4*c*Sqrt[b^2 - \
4*a*c]*(d + e*x))/((-2*c*d + (b + Sqrt[b^2 - 4*a*c])*e)*(-b + Sqrt[b^2 - \
4*a*c] - 2*c*x))])/((e + 2*e*p)*((e*(b + Sqrt[b^2 - 4*a*c] + 2*c*x))/(-2*c*d \
+ (b + Sqrt[b^2 - 4*a*c])*e))^p))", "originalVerificationTime" -> 5.419466,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(d + e*x)^(-2 - 2*p)*(a + b*x + c*x^2)^p",
  "variable" -> "x", "optimal" -> "((b - Sqrt[b^2 - 4*a*c] + 2*c*x)*(d + \
e*x)^(-1 - 2*p)*(a + b*x + c*x^2)^p*Hypergeometric2F1[-1 - 2*p, -p, -2*p, \
(-4*c*Sqrt[b^2 - 4*a*c]*(d + e*x))/((2*c*d - (b + Sqrt[b^2 - 4*a*c])*e)*(b - \
Sqrt[b^2 - 4*a*c] + 2*c*x))])/((2*c*d - (b - Sqrt[b^2 - 4*a*c])*e)*(1 + \
2*p)*(((2*c*d - (b - Sqrt[b^2 - 4*a*c])*e)*(b + Sqrt[b^2 - 4*a*c] + \
2*c*x))/((2*c*d - (b + Sqrt[b^2 - 4*a*c])*e)*(b - Sqrt[b^2 - 4*a*c] + \
2*c*x)))^p)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/408",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 408,
  "method" -> "W15", "answerSize" -> 108, "optimalSize" -> 54,
  "integrationTime" -> 0.190616, "correct" -> False,
  "verificationTime" -> 0.405321, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.2891117875138381543`6., 1.0228325795548505074`6., \
0.7606973419606561629`6., 0.415113035960538829`6., 0.6903321769398628735`6., \
0.9658575980385697757`6., 0.0401621415414919231`6., \
0.9856014006669171033`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(b*n*r^2*Log[x]^2 - 2*r*(a + b*Log[c*x^n])*Log[d - \
d*x^r] + 2*b*n*r*Log[x]*(Log[d - d*x^r] - Log[d + e*x^r]) + \
2*b*n*Log[-((e*x^r)/d)]*Log[d + e*x^r] + 2*b*n*PolyLog[2, 1 + \
(e*x^r)/d])/(2*d*r^2)", "originalVerificationTime" -> 0.30391,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(a + b*Log[c*x^n])/(x*(d + e*x^r))", "variable" -> "x",
  "optimal" -> "-(((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r)) + \
(b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/424",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 424,
  "method" -> "W15", "answerSize" -> 108, "optimalSize" -> 54,
  "integrationTime" -> 0.059793, "correct" -> False,
  "verificationTime" -> 0.378591, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.4512574285419408744`6., 0.8972474074575571826`6., \
0.360023884076284001`6., 0.9272332316886206981`6., 0.2385716674564471308`6., \
1.2390005212908132704`6., 0.9301264387738097989`6., \
0.0254121460084093451`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(b*n*r^2*Log[x]^2 - 2*r*(a + b*Log[c*x^n])*Log[d - \
d*x^r] + 2*b*n*r*Log[x]*(Log[d - d*x^r] - Log[d + e*x^r]) + \
2*b*n*Log[-((e*x^r)/d)]*Log[d + e*x^r] + 2*b*n*PolyLog[2, 1 + \
(e*x^r)/d])/(2*d*r^2)", "originalVerificationTime" -> 0.302386,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(a + b*Log[c*x^n])/(x*(d + e*x^r))", "variable" -> "x",
  "optimal" -> "-(((a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d*r)) + \
(b*n*PolyLog[2, -(d/(e*x^r))])/(d*r^2)"|>,
 <|"key" ->
   "3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/432",
  "section" -> "3 Logarithms",
  "file" -> "3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m", "index" -> 432,
  "method" -> "W15", "answerSize" -> 459, "optimalSize" -> 267,
  "integrationTime" -> 0.536372, "correct" -> False,
  "verificationTime" -> 0.870005, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.0334519062324266349`6., 1.0024781346625643431`6., \
0.9998970013642728399`6., 1.0113211043872801958`6., 1.0164180043076319373`6., \
0.861350971414374817`6., 1.0245152029127805609`6., 0.5881646507048922653`6.}"\
, "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 4, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "((d^2*r^2*(a + b*Log[c*x^n])^2)/(d + e*x^r)^2 + (2*d*r*(a + \
b*Log[c*x^n])*(-(b*n) + a*r + b*r*Log[c*x^n]))/(d + e*x^r) - 2*b^2*n^2*Log[d \
- d*x^r] + 6*a*b*n*r*Log[d - d*x^r] - 2*a^2*r^2*Log[d - d*x^r] + \
4*a*b*r^2*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + 6*b^2*n*r*(-(n*Log[x]) + \
Log[c*x^n])*Log[d - d*x^r] - 2*b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - \
d*x^r] - 6*b^2*n^2*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + \
Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + \
4*a*b*n*r*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + \
e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 4*b^2*n*r*(-(n*Log[x]) + \
Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + \
e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) - 2*b^2*n^2*(r^2*Log[x]^2*Log[1 + \
d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, -(d/(e*x^r))] - 2*PolyLog[3, \
-(d/(e*x^r))]))/(2*d^3*r^3)", "originalVerificationTime" -> 0.883435,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(a + b*Log[c*x^n])^2/(x*(d + e*x^r)^3)", "variable" -> "x",
  "optimal" -> "(b*e*n*x^r*(a + b*Log[c*x^n]))/(d^3*r^2*(d + e*x^r)) + (a + \
b*Log[c*x^n])^2/(2*d*r*(d + e*x^r)^2) + (a + b*Log[c*x^n])^2/(d^2*r*(d + \
e*x^r)) + (3*b*n*(a + b*Log[c*x^n])*Log[1 + d/(e*x^r)])/(d^3*r^2) - ((a + \
b*Log[c*x^n])^2*Log[1 + d/(e*x^r)])/(d^3*r) - (b^2*n^2*Log[d + \
e*x^r])/(d^3*r^3) - (3*b^2*n^2*PolyLog[2, -(d/(e*x^r))])/(d^3*r^3) + \
(2*b*n*(a + b*Log[c*x^n])*PolyLog[2, -(d/(e*x^r))])/(d^3*r^2) + \
(2*b^2*n^2*PolyLog[3, -(d/(e*x^r))])/(d^3*r^3)"|>,
 <|"key" -> "3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/152",
  "section" -> "3 Logarithms", "file" -> "3.1.5 u (a+b log(c x^n))^p.m",
  "index" -> 152, "method" -> "W15", "answerSize" -> 268,
  "optimalSize" -> 255, "integrationTime" -> 0.39449, "correct" -> False,
  "verificationTime" -> 1.315736, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.0967424903190015437`6., 0.9972752663749348315`6., \
0.9626753419717053591`6., 0.0651797377493626681`6., 0.4514744906299939246`6., \
0.9617905268489336917`6., 0.0298653139739511598`6., \
0.0215331573979287071`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 4, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "-(((g*x)^m*(a*f*k*m*x^m - 2*b*f*k*n*x^m + \
b*e*k*m^2*n*Log[x]^2 + b*f*k*m*x^m*Log[c*x^n] - a*e*k*m*Log[e - e*x^m] + \
b*e*k*n*Log[e - e*x^m] - b*e*k*m*Log[c*x^n]*Log[e - e*x^m] + \
b*e*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] - e*k*m*Log[x]*(a*m - b*n + \
b*m*Log[c*x^n] - b*n*Log[e - e*x^m] + b*n*Log[e + f*x^m]) - \
a*f*m*x^m*Log[d*(e + f*x^m)^k] + b*f*n*x^m*Log[d*(e + f*x^m)^k] - \
b*f*m*x^m*Log[c*x^n]*Log[d*(e + f*x^m)^k] + b*e*k*n*PolyLog[2, 1 + \
(f*x^m)/e]))/(f*g*m^2*x^m))", "originalVerificationTime" -> 1.32507,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(g*x)^(-1 + m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]",
  "variable" -> "x", "optimal" -> "(2*b*k*n*(g*x)^m)/(g*m^2) - (k*(g*x)^m*(a \
+ b*Log[c*x^n]))/(g*m) - (b*e*k*n*(g*x)^m*Log[e + f*x^m])/(f*g*m^2*x^m) - \
(b*e*k*n*(g*x)^m*Log[-((f*x^m)/e)]*Log[e + f*x^m])/(f*g*m^2*x^m) + \
(e*k*(g*x)^m*(a + b*Log[c*x^n])*Log[e + f*x^m])/(f*g*m*x^m) - \
(b*n*(g*x)^m*Log[d*(e + f*x^m)^k])/(g*m^2) + ((g*x)^m*(a + \
b*Log[c*x^n])*Log[d*(e + f*x^m)^k])/(g*m) - (b*e*k*n*(g*x)^m*PolyLog[2, 1 + \
(f*x^m)/e])/(f*g*m^2*x^m)"|>,
 <|"key" -> "3 Logarithms/3.4 u (a+b log(c (d+e x^m)^n))^p.m/168",
  "section" -> "3 Logarithms",
  "file" -> "3.4 u (a+b log(c (d+e x^m)^n))^p.m", "index" -> 168,
  "method" -> "W15", "answerSize" -> 288, "optimalSize" -> 200,
  "integrationTime" -> 0.306759, "correct" -> False,
  "verificationTime" -> 1.183639, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.0063244355883678695`6., 0.0149251008095790534`6., \
0.7703330592315073448`6., 1.0694198602347504335`6., 0.0059797765609248123`6., \
1.008393198738883445`6., 0.2128382304475951847`6., 1.0990204951640586638`6.}"\
, "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 4, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "(e^2*n^2*p^2*x^(2*n)*Log[x]^2 + e^2*p^2*x^(2*n)*Log[e + \
d/x^n]^2 - 2*e^2*p^2*x^(2*n)*Log[e - e/x^n] - 2*e^2*p^2*x^(2*n)*Log[e + \
d/x^n]*Log[e - e/x^n] - 2*d*e*p*x^n*Log[c*(d + e*x^n)^p] + \
2*e^2*p*x^(2*n)*Log[e - e/x^n]*Log[c*(d + e*x^n)^p] - d^2*Log[c*(d + \
e*x^n)^p]^2 + 2*e^2*n*p*x^(2*n)*Log[x]*(p + p*Log[e + d/x^n] - p*Log[e - \
e/x^n] - Log[c*(d + e*x^n)^p] + p*Log[1 + (e*x^n)/d]) + \
2*e^2*p^2*x^(2*n)*PolyLog[2, -((e*x^n)/d)])/(2*d^2*f*n*(f*x)^(2*n))",
  "originalVerificationTime" -> 1.312642, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(f*x)^(-1 - 2*n)*Log[c*(d + e*x^n)^p]^2", "variable" -> "x",
  "optimal" -> "(e^2*p^2*x^(1 + 2*n)*(f*x)^(-1 - 2*n)*Log[x])/d^2 - (e*p*x^(1 \
+ n)*(f*x)^(-1 - 2*n)*(d + e*x^n)*Log[c*(d + e*x^n)^p])/(d^2*n) - \
(x*(f*x)^(-1 - 2*n)*Log[c*(d + e*x^n)^p]^2)/(2*n) - (e^2*p*x^(1 + \
2*n)*(f*x)^(-1 - 2*n)*Log[c*(d + e*x^n)^p]*Log[1 - d/(d + e*x^n)])/(d^2*n) + \
(e^2*p^2*x^(1 + 2*n)*(f*x)^(-1 - 2*n)*PolyLog[2, d/(d + e*x^n)])/(d^2*n)"|>,
 <|"key" -> "3 Logarithms/3.4 u (a+b log(c (d+e x^m)^n))^p.m/376",
  "section" -> "3 Logarithms",
  "file" -> "3.4 u (a+b log(c (d+e x^m)^n))^p.m", "index" -> 376,
  "method" -> "W15", "answerSize" -> 433, "optimalSize" -> 156,
  "integrationTime" -> 1.310031, "correct" -> False,
  "verificationTime" -> 1.040244, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.6969701160718064941`6., 0.9827847684304327097`6., \
1.0010736256620012274`6., 0.941235588668466484`6., 1.0215950153134433472`6., \
1.0128015185227973586`6., 0.32244059816735391`6., 1.0042776776521299603`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 4, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "(g*p*Log[f - f/x^n] + f*p*x^n*Log[f - f/x^n] - \
g*n*p*Log[x]*Log[f - f/x^n] - f*n*p*x^n*Log[x]*Log[f - f/x^n] - p*Log[e + \
d/x^n]*(-(f*x^n) + (g + f*x^n)*Log[f - f/x^n]) - f*x^n*Log[c*(d + e*x^n)^p] + \
g*Log[f - f/x^n]*Log[c*(d + e*x^n)^p] + f*x^n*Log[f - f/x^n]*Log[c*(d + \
e*x^n)^p] + g*n*p*Log[x]*Log[1 + (f*x^n)/g] + f*n*p*x^n*Log[x]*Log[1 + \
(f*x^n)/g] + p*(g + f*x^n)*PolyLog[2, -((f*x^n)/g)])/(f^2*n*(g + f*x^n)) - \
(p*(-((d*f*Log[e + d/x^n])/(d*f - e*g)) + (f*x^n*Log[e + d/x^n])/(g + f*x^n) \
+ Log[-(d/(e*x^n))]*Log[e + d/x^n] + (d*f*Log[f + g/x^n])/(d*f - e*g) - Log[e \
+ d/x^n]*Log[(d*(f + g/x^n))/(d*f - e*g)] - PolyLog[2, -((g*(e + d/x^n))/(d*f \
- e*g))] + PolyLog[2, 1 + d/(e*x^n)]))/(f^2*n)",
  "originalVerificationTime" -> 0.957729, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "Log[c*(d + e*x^n)^p]/(x*(f + g/x^n)^2)", "variable" -> "x",
  "optimal" -> "(e*g*p*Log[d + e*x^n])/(f^2*(d*f - e*g)*n) + (g*Log[c*(d + \
e*x^n)^p])/(f^2*n*(g + f*x^n)) - (e*g*p*Log[g + f*x^n])/(f^2*(d*f - e*g)*n) + \
(Log[c*(d + e*x^n)^p]*Log[-((e*(g + f*x^n))/(d*f - e*g))])/(f^2*n) + \
(p*PolyLog[2, (f*(d + e*x^n))/(d*f - e*g)])/(f^2*n)"|>,
 <|"key" ->
   "4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/120",
  "section" -> "4 Trig functions",
  "file" -> "4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m", "index" -> 120,
  "method" -> "W15", "answerSize" -> 271, "optimalSize" -> 295,
  "integrationTime" -> 17.262577, "correct" -> False,
  "verificationTime" -> 50.011606, "verificationMethod" -> "numeric",
  "numericScales" -> "{0``96.40987341604864, 0.3466535595491885934`6., \
0``95.78840513940743, 0.3829388671148277071`6., 0.3521501181436954314`6., \
0``96.47988825996177, 0.1899707965182722765`6., 0``96.97388322560609}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 4,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "(e^3*Cos[(c + d*x)/2]^2*Sec[c + d*x]*(1 + Sqrt[Sec[c + \
d*x]^2])*(-2*Sqrt[2]*ArcTan[1 - Sqrt[2]*Sqrt[Tan[c + d*x]]] + \
2*Sqrt[2]*ArcTan[1 + Sqrt[2]*Sqrt[Tan[c + d*x]]] - Sqrt[2]*Log[1 - \
Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]] + Sqrt[2]*Log[1 + \
Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]] - 8*Sqrt[Tan[c + d*x]] + \
8*Hypergeometric2F1[-1/2, 1/4, 5/4, -Tan[c + d*x]^2]*Sqrt[Tan[c + d*x]] - \
8*Hypergeometric2F1[1/4, 1/2, 5/4, -Tan[c + d*x]^2]*Sqrt[Tan[c + \
d*x]])*Sqrt[e*Tan[c + d*x]])/(2*a*d*(1 + Sec[c + d*x])^2*Sqrt[Tan[c + d*x]])"\
, "originalVerificationTime" -> 51.398958, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(e*Tan[c + d*x])^(7/2)/(a + a*Sec[c + d*x])", "variable" -> "x",
  "optimal" -> "-((e^(7/2)*ArcTan[1 - (Sqrt[2]*Sqrt[e*Tan[c + \
d*x]])/Sqrt[e]])/(Sqrt[2]*a*d)) + (e^(7/2)*ArcTan[1 + (Sqrt[2]*Sqrt[e*Tan[c + \
d*x]])/Sqrt[e]])/(Sqrt[2]*a*d) - (e^(7/2)*Log[Sqrt[e] + Sqrt[e]*Tan[c + d*x] \
- Sqrt[2]*Sqrt[e*Tan[c + d*x]]])/(2*Sqrt[2]*a*d) + (e^(7/2)*Log[Sqrt[e] + \
Sqrt[e]*Tan[c + d*x] + Sqrt[2]*Sqrt[e*Tan[c + d*x]]])/(2*Sqrt[2]*a*d) - \
(e^4*EllipticF[c - Pi/4 + d*x, 2]*Sec[c + d*x]*Sqrt[Sin[2*c + \
2*d*x]])/(3*a*d*Sqrt[e*Tan[c + d*x]]) - (2*e^3*(3 - Sec[c + \
d*x])*Sqrt[e*Tan[c + d*x]])/(3*a*d)"|>,
 <|"key" ->
   "4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/464",
  "section" -> "4 Trig functions",
  "file" -> "4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m",
  "index" -> 464, "method" -> "W15", "answerSize" -> 245,
  "optimalSize" -> 226, "integrationTime" -> 13.547696, "correct" -> False,
  "verificationTime" -> 28.866622, "verificationMethod" -> "numeric",
  "numericScales" -> "{0``96.71027086900835, 0``95.76597697454143, \
0.4029767125853887968`6., 0``97.81350861248174, 0.0186227052974648843`6., \
0.1242961825109489857`6., 0``94.6872411028202, 0``96.87097482756762}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 5,
  "answerType" -> 5, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "((a + b*(c*Sec[e + f*x])^n)^p*(-4*a*n*(1 + \
p)*Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sqrt[Sec[e + \
f*x]^2])^n)/a)]*Sec[e + f*x]^2 + a*n*(1 + p)*Hypergeometric2F1[4/n, -p, (4 + \
n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^4 - \
4*Hypergeometric2F1[1, 1 + p, 2 + p, 1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a]*(a \
+ b*(c*Sqrt[Sec[e + f*x]^2])^n)*(1 + (b*(c*Sqrt[Sec[e + \
f*x]^2])^n)/a)^p))/(4*a*f*n*(1 + p)*(1 + (b*(c*Sqrt[Sec[e + \
f*x]^2])^n)/a)^p)", "originalVerificationTime" -> 31.030188,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(a + b*(c*Sec[e + f*x])^n)^p*Tan[e + f*x]^5",
  "variable" -> "x", "optimal" -> "-((Hypergeometric2F1[1, 1 + p, 2 + p, 1 + \
(b*(c*Sec[e + f*x])^n)/a]*(a + b*(c*Sec[e + f*x])^n)^(1 + p))/(a*f*n*(1 + \
p))) - (Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sec[e + \
f*x])^n)/a)]*Sec[e + f*x]^2*(a + b*(c*Sec[e + f*x])^n)^p)/(f*(1 + (b*(c*Sec[e \
+ f*x])^n)/a)^p) + (Hypergeometric2F1[4/n, -p, (4 + n)/n, -((b*(c*Sec[e + \
f*x])^n)/a)]*Sec[e + f*x]^4*(a + b*(c*Sec[e + f*x])^n)^p)/(4*f*(1 + \
(b*(c*Sec[e + f*x])^n)/a)^p)"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.2 Inverse hyperbolic \
cosine/7.2.4a (f x)^m (d-c^2 d x^2)^p (a+b arccosh(c x))^n.m/208",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.2 Inverse hyperbolic cosine/7.2.4a (f x)^m (d-c^2 d x^2)^p \
(a+b arccosh(c x))^n.m", "index" -> 208, "method" -> "W15",
  "answerSize" -> 127, "optimalSize" -> 341, "integrationTime" -> 0.631136,
  "correct" -> False, "verificationTime" -> 0.397942,
  "verificationMethod" -> "numeric", "numericScales" -> "{1.12505722788535555\
16`6., 0.8752929476922416378`6., 1.6713079515004344616`6., \
1.2162695402989251324`6., 0.8450465550617217506`6., 0.2037086829204548247`6., \
0.0166007634676485054`6., 0.216183396306547401`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 4, "answerType" -> 3,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "(2*a*b*(-1 + \
2*c^2*x^2)*ArcCosh[c*x] + b^2*ArcCosh[c*x]^2 + a*(-a + 2*a*c^2*x^2 - \
2*b*c*x*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*Log[c*x] - b*c*x*Sqrt[-1 + c*x]*Sqrt[1 + \
c*x]*Log[1 - c^2*x^2]))/(d*x*Sqrt[d - c^2*d*x^2])",
  "originalVerificationTime" -> 0.365187, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + b*ArcCosh[c*x])^2/(x^2*(d - c^2*d*x^2)^(3/2))", "variable" -> "x",
  "optimal" -> "-((a + b*ArcCosh[c*x])^2/(d*x*Sqrt[d - c^2*d*x^2])) + \
(2*c^2*x*(a + b*ArcCosh[c*x])^2)/(d*Sqrt[d - c^2*d*x^2]) + (2*c*Sqrt[-1 + \
c*x]*Sqrt[1 + c*x]*(a + b*ArcCosh[c*x])^2)/(d*Sqrt[d - c^2*d*x^2]) - \
(4*b*c*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*(a + \
b*ArcCosh[c*x])*ArcTanh[E^(2*ArcCosh[c*x])])/(d*Sqrt[d - c^2*d*x^2]) - \
(4*b*c*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*(a + b*ArcCosh[c*x])*Log[1 - \
E^(2*ArcCosh[c*x])])/(d*Sqrt[d - c^2*d*x^2]) - (b^2*c*Sqrt[-1 + c*x]*Sqrt[1 + \
c*x]*PolyLog[2, -E^(2*ArcCosh[c*x])])/(d*Sqrt[d - c^2*d*x^2]) - \
(b^2*c*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*PolyLog[2, E^(2*ArcCosh[c*x])])/(d*Sqrt[d \
- c^2*d*x^2])"|>}
