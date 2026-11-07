{<|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.1 Linear/1.1.1.2 \
(a+b x)^m (c+d x)^n.m/1881", "section" -> "1 Algebraic functions",
  "file" -> "1.1 Binomial products/1.1.1 Linear/1.1.1.2 (a+b x)^m (c+d \
x)^n.m", "index" -> 1881, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 57, "integrationTime" -> 0.052932, "correct" -> False,
  "verificationTime" -> 0.260519, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.2473376584659846941`6., 0.1954721380167944044`6., \
0.096854229253812838`6., 0.8828211841118211104`6., 0.1389233332413401825`6., \
1.`6., 1.`6., 1.`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 9, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "ComplexInfinity", "originalVerificationTime" ->
   0.02144, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(c + d*x)^(1 + 2*n - 2*(1 + n))/(a + b*x)^2", "variable" -> "x",
  "optimal" -> "-(1/((b*c - a*d)*(a + b*x))) - (d*Log[a + b*x])/(b*c - a*d)^2 \
+ (d*Log[c + d*x])/(b*c - a*d)^2"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/481",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 481, "method" -> "Rubi", "answerSize" -> 1, "optimalSize" -> 38,
  "integrationTime" -> 0.067259, "correct" -> False,
  "verificationTime" -> 0.043653, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.`6., 1.`6., 0.2200066605064799216`6., \
0.4076012204753088665`6., 1.`6., 0.7256156225184127651`6., 1.`6., 1.`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 3,
  "answerType" -> 1, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.011878, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4))", "variable" -> "x",
  "optimal" -> "1/(2*a*(a + b*x^2)) + Log[x]/a^2 - Log[a + b*x^2]/(2*a^2)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1033",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 1033, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 12, "integrationTime" -> 0.045025, "correct" -> False,
  "verificationTime" -> 0.040837, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.6582679345942400868`6., 0.7092002725928600856`6., \
1.`6., 0.2237606617137666666`6., 0.4283377117400593968`6., \
0.9261151760055445535`6., 0.3949392193767513764`6., 1.`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 2, "answerType" -> 1,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.007956, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "x/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4]", "variable" -> "x",
  "optimal" -> "x^2/(2*Sqrt[a])"|>, <|"key" -> "Blake/Blake_Problems.m/729",
  "section" -> "Blake", "file" -> "Blake_Problems.m", "index" -> 729,
  "method" -> "Rubi", "answerSize" -> 178, "optimalSize" -> 56,
  "integrationTime" -> 0.293993, "correct" -> False,
  "verificationTime" -> 0.996418, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.0241593362529007019`6., 0.0123167292272220536`6., \
0.0609855903126270003`6., 0.4998351162783535967`6., 0.0477245946421629647`6., \
0.1683480518641926732`6., 0.3084783055362006673`6., \
0.4934789619904015726`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 4, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "(2*a*Sqrt[-x + x^4])/(5*x^3) - (2*b*(-x + \
x^4)^(3/2))/(9*x^6) + (a*(-x + x^4)^(3/2))/(3*x^3) - (3^(3/4)*a*(1 - \
x)*x*Sqrt[(1 + x + x^2)/(1 - (1 + Sqrt[3])*x)^2]*EllipticF[ArcCos[(1 - (1 - \
Sqrt[3])*x)/(1 - (1 + Sqrt[3])*x)], (2 + Sqrt[3])/4])/(5*Sqrt[-(((1 - \
x)*x)/(1 - (1 + Sqrt[3])*x)^2)]*Sqrt[-x + x^4])",
  "originalVerificationTime" -> 1.551513, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(Sqrt[-x + x^4]*(-b + a*x^6))/x^6", "variable" -> "x",
  "optimal" -> "(Sqrt[-x + x^4]*(2*b - 2*b*x^3 + 3*a*x^6))/(9*x^5) - \
(a*ArcTanh[x^2/Sqrt[-x + x^4]])/3"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1490",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 1490, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 146, "integrationTime" -> 0.101822, "correct" -> False,
  "verificationTime" -> 0.263338, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.`6., 1.`6., 1.`6., 0.9918228744154838867`6., 1.`6., \
1.`6., 1.`6., 1.`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 1, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "0", "originalVerificationTime" -> 0.036023,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(a^2 + 2*a*b*x + b^2*x^2)^3/(d + e*x)", "variable" -> "x",
  "optimal" -> "-((b*(b*d - a*e)^5*x)/e^6) + ((b*d - a*e)^4*(a + \
b*x)^2)/(2*e^5) - ((b*d - a*e)^3*(a + b*x)^3)/(3*e^4) + ((b*d - a*e)^2*(a + \
b*x)^4)/(4*e^3) - ((b*d - a*e)*(a + b*x)^5)/(5*e^2) + (a + b*x)^6/(6*e) + \
((b*d - a*e)^6*Log[d + e*x])/e^7"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1522",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 1522, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 107, "integrationTime" -> 0.115995, "correct" -> False,
  "verificationTime" -> 0.108901, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.3152419357045622982`6., 0.5676569897423665081`6., \
0.0506257537840395133`6., 0.4048084761785000416`6., 0.1667068735046458349`6., \
0.672053729109758829`6., 0.0727199438462343886`6., 0.355422652325200867`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 3,
  "answerType" -> 9, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "ComplexInfinity", "originalVerificationTime" -> 0.047229,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "1/((d + e*x)*(a^2 + 2*a*b*x + b^2*x^2)^2)",
  "variable" -> "x", "optimal" -> "-1/3*1/((b*d - a*e)*(a + b*x)^3) + \
e/(2*(b*d - a*e)^2*(a + b*x)^2) - e^2/((b*d - a*e)^3*(a + b*x)) - (e^3*Log[a \
+ b*x])/(b*d - a*e)^4 + (e^3*Log[d + e*x])/(b*d - a*e)^4"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1026",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 1026, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 13, "integrationTime" -> 0.007938, "correct" -> False,
  "verificationTime" -> 0.044282, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.`6., 0.0604575550200402332`6., 1.`6., 1.`6., 1.`6., \
1.`6., 1.`6., 0.5471713385330400246`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 2, "answerType" -> 1,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.019732, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/(x*Sqrt[2 + 2*a - 2*(1 + a) + c*x^4])", "variable" -> "x",
  "optimal" -> "-1/2*1/Sqrt[c*x^4]"|>,
 <|"key" -> "Blake/Blake_Problems.m/658", "section" -> "Blake",
  "file" -> "Blake_Problems.m", "index" -> 658, "method" -> "Rubi",
  "answerSize" -> 163, "optimalSize" -> 52, "integrationTime" -> 0.311547,
  "correct" -> False, "verificationTime" -> 0.905906,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.09933438564315349\
43`6., 0.0035965214010672627`6., 0.1322436560326780535`6., \
0.0485171905389805815`6., 0.7227105264605879178`6., 0.0056333950815085734`6., \
0.3949349554306685309`6., 0.1478552444616680351`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 4,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "(-2*a*Sqrt[x + \
x^4])/(5*x^3) + (2*b*(x + x^4)^(3/2))/(9*x^6) + (a*(x + x^4)^(3/2))/(3*x^3) + \
(3^(3/4)*a*x*(1 + x)*Sqrt[(1 - x + x^2)/(1 + (1 + \
Sqrt[3])*x)^2]*EllipticF[ArcCos[(1 + (1 - Sqrt[3])*x)/(1 + (1 + Sqrt[3])*x)], \
(2 + Sqrt[3])/4])/(5*Sqrt[(x*(1 + x))/(1 + (1 + Sqrt[3])*x)^2]*Sqrt[x + \
x^4])", "originalVerificationTime" -> 1.466308,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(Sqrt[x + x^4]*(-b + a*x^6))/x^6", "variable" -> "x",
  "optimal" -> "(Sqrt[x + x^4]*(2*b + 2*b*x^3 + 3*a*x^6))/(9*x^5) + \
(a*ArcTanh[x^2/Sqrt[x + x^4]])/3"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1027",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 1027, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 17, "integrationTime" -> 0.10666, "correct" -> False,
  "verificationTime" -> 0.246568, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.`6., 1.`6., 0.7539225210514922061`6., \
0.1753203475029638864`6., 3.12407936710421870715752043485379`6.*^-6, 1.`6., \
1.`6., 1.`6.}", "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 1,
  "answerType" -> 9, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "ComplexInfinity", "originalVerificationTime" -> 0.018243,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "1/((d + e*x)*(c*d^2 + 2*c*d*e*x + c*e^2*x^2)^3)",
  "variable" -> "x", "optimal" -> "-1/6*1/(c^3*e*(d + e*x)^6)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/499",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 499, "method" -> "Rubi", "answerSize" -> 1, "optimalSize" -> 70,
  "integrationTime" -> 0.110724, "correct" -> False,
  "verificationTime" -> 0.049323, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.0482977391091430795`6., 1.`6., \
0.0791998881835116125`6., 1.`6., 0.7275398305810903383`6., 1.`6., 1.`6., \
1.`6.}", "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 3,
  "answerType" -> 1, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.032828, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)^2)", "variable" -> "x",
  "optimal" -> "1/(6*a*(a + b*x^2)^3) + 1/(4*a^2*(a + b*x^2)^2) + 1/(2*a^3*(a \
+ b*x^2)) + Log[x]/a^4 - Log[a + b*x^2]/(2*a^4)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1035",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 1035, "method" -> "Rubi", "answerSize" -> 1, "optimalSize" -> 8,
  "integrationTime" -> 0.011271, "correct" -> False,
  "verificationTime" -> 0.040949, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.`6., 1.`6., 0.6016507878449250533`6., 1.`6., 1.`6., \
0.7402946809777921887`6., 0.5980657486299962801`6., 1.`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 1,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.011021, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/(x*Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4])", "variable" -> "x",
  "optimal" -> "Log[x]/Sqrt[a]"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/283",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 283, "method" -> "Rubi",
  "answerSize" -> 1, "optimalSize" -> 78, "integrationTime" -> 0.079312,
  "correct" -> False, "verificationTime" -> 0.105513,
  "verificationMethod" -> "numeric", "numericScales" ->
   "{1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 5,
  "answerType" -> 9, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "ComplexInfinity", "originalVerificationTime" -> 0.093609,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "E^(n*ArcTanh[a*x])/(c - a*c*x)^(3/2)", "variable" -> "x",
  "optimal" -> "(2^(1 + n/2)*Hypergeometric2F1[(-1 - n)/2, -1/2*n, (1 - n)/2, \
(1 - a*x)/2])/(a*c*(1 + n)*(1 - a*x)^(n/2)*Sqrt[c - a*c*x])"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1004",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 1004, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 17, "integrationTime" -> 0.071924, "correct" -> False,
  "verificationTime" -> 0.229137, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.5695055453423627378`6., 0.0624962899805984001`6., \
1.`6., 1.`6., 1.`6., 1.`6., 0.0752539248832693092`6., 1.`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 1,
  "answerType" -> 9, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "ComplexInfinity", "originalVerificationTime" -> 0.0184,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "1/((d + e*x)*(c*d^2 + 2*c*d*e*x + c*e^2*x^2))",
  "variable" -> "x", "optimal" -> "-1/2*1/(c*e*(d + e*x)^2)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/428",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 428, "method" -> "Rubi", "answerSize" -> 1, "optimalSize" -> 50,
  "integrationTime" -> 0.105685, "correct" -> False,
  "verificationTime" -> 0.04292, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.4926903085265933316`6., 1.`6., 1.`6., 1.`6., 1.`6., \
0.0680253824446369329`6., 1.`6., 1.`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 1,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.015867, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a^2 + 2*a*b*x^2 + b^2*x^4)^2/x", "variable" -> "x",
  "optimal" -> "2*a^3*b*x^2 + (3*a^2*b^2*x^4)/2 + (2*a*b^3*x^6)/3 + \
(b^4*x^8)/8 + a^4*Log[x]"|>, <|"key" -> "1 Algebraic functions/1.2 Trinomial \
products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1028",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 1028, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 16, "integrationTime" -> 0.003725, "correct" -> False,
  "verificationTime" -> 0.045558, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.3326494004921761447`6., 0.5585362180650453069`6., \
0.1456070407890382409`6., 1.`6., 1.`6., 0.3529221608003668562`6., 1.`6., \
1.`6.}", "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 2,
  "answerType" -> 9, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "ComplexInfinity", "originalVerificationTime" -> 0.01441,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "1/(x^3*Sqrt[2 + 2*a - 2*(1 + a) + c*x^4])",
  "variable" -> "x", "optimal" -> "-1/4*1/(x^2*Sqrt[c*x^4])"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/284",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 284, "method" -> "Rubi",
  "answerSize" -> 1, "optimalSize" -> 78, "integrationTime" -> 0.093638,
  "correct" -> False, "verificationTime" -> 0.129147,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.36086399822661756\
26`6., 1.`6., 1.`6., 0.1926559196953028857`6., 1.`6., 1.`6., 1.`6., 1.`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 5,
  "answerType" -> 9, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "ComplexInfinity", "originalVerificationTime" -> 0.102749,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "E^(n*ArcTanh[a*x])/(c - a*c*x)^(5/2)", "variable" -> "x",
  "optimal" -> "(2^(1 + n/2)*Hypergeometric2F1[(-3 - n)/2, -1/2*n, (-1 - \
n)/2, (1 - a*x)/2])/(a*c*(3 + n)*(1 - a*x)^(n/2)*(c - a*c*x)^(3/2))"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/428",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 428, "method" -> "Rubi",
  "answerSize" -> 521, "optimalSize" -> 235, "integrationTime" -> 0.516661,
  "correct" -> False, "verificationTime" -> 1.069289,
  "verificationMethod" -> "numeric", "numericScales" -> "{1.00157948589525817\
91`6., 1.0021090394229627259`6., 1.0007901826354305269`6., \
1.0020354888342105667`6., 1.0020357932756161829`6., 1.0018963755579314223`6., \
1.0000248859505925093`6., 1.0006849954423550568`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 2, "answerType" -> 2,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "((10*((3*(1 - \
a*x)^(3/2)*Sqrt[1 + a*x]*(c - a*c*x)^(3/2))/(a^2*c) + (8*c*Sqrt[1 - \
a*x]*Sqrt[1 + a*x]*Sqrt[c - a*c*x] + 3*Sqrt[1 - a*x]*Sqrt[1 + a*x]*(c - \
a*c*x)^(3/2))/(a^2*c)))/a + (7*((15*(1 - a*x)^(3/2)*(c - \
a*c*x)^(3/2))/(a^2*c*Sqrt[1 + a*x]) + (7*(8*c*Sqrt[1 - a*x]*Sqrt[1 + \
a*x]*Sqrt[c - a*c*x] + 3*Sqrt[1 - a*x]*Sqrt[1 + a*x]*(c - \
a*c*x)^(3/2)))/(a^2*c)))/a)/(105*a) - (2*((15*((3*(1 - a*x)^(3/2)*Sqrt[1 + \
a*x]*(c - a*c*x)^(3/2))/(a^2*c) + (8*c*Sqrt[1 - a*x]*Sqrt[1 + a*x]*Sqrt[c - \
a*c*x] + 3*Sqrt[1 - a*x]*Sqrt[1 + a*x]*(c - a*c*x)^(3/2))/(a^2*c)))/a - \
(7*((5*(1 - a*x)^(5/2)*Sqrt[1 + a*x]*(c - a*c*x)^(3/2))/(a^2*c) + (5*(1 - \
a*x)^(3/2)*Sqrt[1 + a*x]*(c - a*c*x)^(3/2) + 4*(8*c*Sqrt[1 - a*x]*Sqrt[1 + \
a*x]*Sqrt[c - a*c*x] + 3*Sqrt[1 - a*x]*Sqrt[1 + a*x]*(c - \
a*c*x)^(3/2)))/(a^2*c)))/a))/(315*a)", "originalVerificationTime" ->
   1.068714, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(x^3*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])", "variable" -> "x",
  "optimal" -> "(8*c^2*(1 - a*x)^(3/2))/(a^4*Sqrt[1 + a*x]*(c - a*c*x)^(3/2)) \
+ (32*c^2*(1 - a*x)^(3/2)*Sqrt[1 + a*x])/(a^4*(c - a*c*x)^(3/2)) - (50*c^2*(1 \
- a*x)^(3/2)*(1 + a*x)^(3/2))/(3*a^4*(c - a*c*x)^(3/2)) + (38*c^2*(1 - \
a*x)^(3/2)*(1 + a*x)^(5/2))/(5*a^4*(c - a*c*x)^(3/2)) - (2*c^2*(1 - \
a*x)^(3/2)*(1 + a*x)^(7/2))/(a^4*(c - a*c*x)^(3/2)) + (2*c^2*(1 - \
a*x)^(3/2)*(1 + a*x)^(9/2))/(9*a^4*(c - a*c*x)^(3/2))"|>,
 <|"key" -> "Hebisch/Hebisch_Problems.m/4508", "section" -> "Hebisch",
  "file" -> "Hebisch_Problems.m", "index" -> 4508, "method" -> "Rubi",
  "answerSize" -> 59, "optimalSize" -> 21, "integrationTime" -> 0.09688,
  "correct" -> False, "verificationTime" -> 0.080455,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.06756000944180761\
42`6., 0.1475695102709293966`6., 0.1160044704530417189`6., \
0.1392614895696154921`6., 0.1215462545168751871`6., 0.1752110894040295133`6., \
0.05371979509911613`6., 0.1544347141854639326`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 3,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "x + (ArcTanh[(3 - 2*x - \
4*Log[7])/Sqrt[9 + 16*Log[7]^2 - 8*Log[7]*Log[49]]]*Sqrt[9 + 16*Log[7]^2 - \
8*Log[7]*Log[49]]*Log[2401])/(4*Log[7])", "originalVerificationTime" ->
   0.078597, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" -> "(3 - 3*x + x^2 + 2*(-3 + \
2*x)*Log[7] + 4*Log[7]^2)/(-3*x + x^2 + 2*(-3 + 2*x)*Log[7] + 4*Log[7]^2)",
  "variable" -> "x", "optimal" ->
   "2 + E^10 + x + Log[2/3 - 2/(x + 2*Log[7])]"|>,
 <|"key" -> "1 Algebraic functions/1.1 Binomial products/1.1.1 Linear/1.1.1.3 \
(a+b x)^m (c+d x)^n (e+f x)^p.m/813", "section" -> "1 Algebraic functions",
  "file" -> "1.1 Binomial products/1.1.1 Linear/1.1.1.3 (a+b x)^m (c+d x)^n \
(e+f x)^p.m", "index" -> 813, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 24, "integrationTime" -> 0.022147, "correct" -> False,
  "verificationTime" -> 0.260192, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.16`6., 1.`6., 1.`6., 1.`6., 1.`6., \
0.9290172739149368559`6., 0.3546269410427976266`6., 1.`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 1,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.047585, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + b*x)^n/(x^2*(-a - b*x)^n)", "variable" -> "x",
  "optimal" -> "-((a + b*x)^n/(x*(-a - b*x)^n))"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/453",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 453, "method" -> "Rubi", "answerSize" -> 1, "optimalSize" -> 76,
  "integrationTime" -> 0.065488, "correct" -> False,
  "verificationTime" -> 0.04401, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.435254917078810442`6., 1.`6., 1.`6., 1.`6., 1.`6., \
0.6732463137319774298`6., 0.1922478469385516713`6., 1.`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 1,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.020601, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a^2 + 2*a*b*x^2 + b^2*x^4)^3/x", "variable" -> "x",
  "optimal" -> "3*a^5*b*x^2 + (15*a^4*b^2*x^4)/4 + (10*a^3*b^3*x^6)/3 + \
(15*a^2*b^4*x^8)/8 + (3*a*b^5*x^10)/5 + (b^6*x^12)/12 + a^6*Log[x]"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/285",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 285, "method" -> "Rubi",
  "answerSize" -> 1, "optimalSize" -> 78, "integrationTime" -> 0.069672,
  "correct" -> False, "verificationTime" -> 0.111494,
  "verificationMethod" -> "numeric", "numericScales" -> "{1.`6., 1.`6., \
1.`6., 0.3787179360665210106`6., 1.`6., 1.`6., 1.`6., 1.`6.}",
  "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 5,
  "answerType" -> 9, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)",
  "answer" -> "ComplexInfinity", "originalVerificationTime" -> 0.155467,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "E^(n*ArcTanh[a*x])/(c - a*c*x)^(7/2)", "variable" -> "x",
  "optimal" -> "(2^(1 + n/2)*Hypergeometric2F1[(-5 - n)/2, -1/2*n, (-3 - \
n)/2, (1 - a*x)/2])/(a*c*(5 + n)*(1 - a*x)^(n/2)*(c - a*c*x)^(5/2))"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/429",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 429, "method" -> "Rubi",
  "answerSize" -> 240, "optimalSize" -> 197, "integrationTime" -> 0.264647,
  "correct" -> False, "verificationTime" -> 0.822275,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.99550642004346651\
53`6., 0.9965244065421582593`6., 0.9975978829771505026`6., \
0.9711922399258786174`6., 0.9959739406020827001`6., 0.9996043693846318433`6., \
0.9982856666675692921`6., 0.9961858601820223539`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 2, "answerType" -> 2,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "(-2*((3*(1 - \
a*x)^(3/2)*Sqrt[1 + a*x]*(c - a*c*x)^(3/2))/(a^2*c) + (8*c*Sqrt[1 - \
a*x]*Sqrt[1 + a*x]*Sqrt[c - a*c*x] + 3*Sqrt[1 - a*x]*Sqrt[1 + a*x]*(c - \
a*c*x)^(3/2))/(a^2*c)))/(21*a) - ((15*(1 - a*x)^(3/2)*(c - \
a*c*x)^(3/2))/(a^2*c*Sqrt[1 + a*x]) + (7*(8*c*Sqrt[1 - a*x]*Sqrt[1 + \
a*x]*Sqrt[c - a*c*x] + 3*Sqrt[1 - a*x]*Sqrt[1 + a*x]*(c - \
a*c*x)^(3/2)))/(a^2*c))/(15*a)", "originalVerificationTime" -> 1.0124,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(x^2*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])",
  "variable" -> "x", "optimal" -> "(-8*c^2*(1 - a*x)^(3/2))/(a^3*Sqrt[1 + \
a*x]*(c - a*c*x)^(3/2)) - (24*c^2*(1 - a*x)^(3/2)*Sqrt[1 + a*x])/(a^3*(c - \
a*c*x)^(3/2)) + (26*c^2*(1 - a*x)^(3/2)*(1 + a*x)^(3/2))/(3*a^3*(c - \
a*c*x)^(3/2)) - (12*c^2*(1 - a*x)^(3/2)*(1 + a*x)^(5/2))/(5*a^3*(c - \
a*c*x)^(3/2)) + (2*c^2*(1 - a*x)^(3/2)*(1 + a*x)^(7/2))/(7*a^3*(c - \
a*c*x)^(3/2))"|>, <|"key" -> "1 Algebraic functions/1.1 Binomial \
products/1.1.1 Linear/1.1.1.3 (a+b x)^m (c+d x)^n (e+f x)^p.m/814",
  "section" -> "1 Algebraic functions", "file" -> "1.1 Binomial \
products/1.1.1 Linear/1.1.1.3 (a+b x)^m (c+d x)^n (e+f x)^p.m",
  "index" -> 814, "method" -> "Rubi", "answerSize" -> 33,
  "optimalSize" -> 26, "integrationTime" -> 0.02487, "correct" -> False,
  "verificationTime" -> 0.246315, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.2746813010918653175`6., 0.3741054001301236174`6., \
0.0572507077697389116`6., 0.6004673632920937709`6., 0.6731724127128334456`6., \
0.3896699805870933584`6., 0.1255171672666702488`6., \
0.0519825474988069579`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 3, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "((-a - b*x)^(1 - n)*(a + b*x)^(1 + n))/(2*a^2*x^2)",
  "originalVerificationTime" -> 0.059556, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "(a + b*x)^n/(x^3*(-a - b*x)^n)", "variable" -> "x",
  "optimal" -> "-1/2*(a + b*x)^n/(x^2*(-a - b*x)^n)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/990",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 990, "method" -> "Rubi", "answerSize" -> 1, "optimalSize" -> 17,
  "integrationTime" -> 0.116119, "correct" -> False,
  "verificationTime" -> 0.049922, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.4964649124654207698`6., 1.`6., \
0.6138909693978751764`6., 1.`6., 0.3276190347731241058`6., 1.`6., \
0.1221631409299023911`6., 1.`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 1, "answerType" -> 1, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "0", "originalVerificationTime" -> 0.01091,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(c*d^2 + 2*c*d*e*x + c*e^2*x^2)^2/(d + e*x)",
  "variable" -> "x", "optimal" -> "(c^2*(d + e*x)^4)/(4*e)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1470",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 1470, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 98, "integrationTime" -> 0.018858, "correct" -> False,
  "verificationTime" -> 0.069094, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.`6., 1.`6., 1.`6., 1.`6., 1.`6., 1.`6., \
0.6694136845873933052`6., 1.`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 3, "answerType" -> 1, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "0", "originalVerificationTime" -> 0.022154,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(a^2 + 2*a*b*x + b^2*x^2)^2/(d + e*x)", "variable" -> "x",
  "optimal" -> "-((b*(b*d - a*e)^3*x)/e^4) + ((b*d - a*e)^2*(a + \
b*x)^2)/(2*e^3) - ((b*d - a*e)*(a + b*x)^3)/(3*e^2) + (a + b*x)^4/(4*e) + \
((b*d - a*e)^4*Log[d + e*x])/e^5"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1534",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 1534, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 155, "integrationTime" -> 0.066117, "correct" -> False,
  "verificationTime" -> 0.080389, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.000858835038606851`6., 1.`6., \
0.0106602933611071505`6., 0.0157153270104172396`6., 0.0679452613233230331`6., \
0.0013127398733294763`6., 1.`6., 1.`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 9,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "ComplexInfinity",
  "originalVerificationTime" -> 0.03844, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/((d + e*x)*(a^2 + 2*a*b*x + b^2*x^2)^3)", "variable" -> "x",
  "optimal" -> "-1/5*1/((b*d - a*e)*(a + b*x)^5) + e/(4*(b*d - a*e)^2*(a + \
b*x)^4) - e^2/(3*(b*d - a*e)^3*(a + b*x)^3) + e^3/(2*(b*d - a*e)^4*(a + \
b*x)^2) - e^4/((b*d - a*e)^5*(a + b*x)) - (e^5*Log[a + b*x])/(b*d - a*e)^6 + \
(e^5*Log[d + e*x])/(b*d - a*e)^6"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/278",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 278, "method" -> "Rubi",
  "answerSize" -> 1, "optimalSize" -> 81, "integrationTime" -> 0.049749,
  "correct" -> False, "verificationTime" -> 0.109259,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.88061134731586751\
57`6., 0.2108981777864805614`6., 0.2178503659898680577`6., \
0.0140811947925041604`6., 0.0019225267848405619`6., 1.`6., \
0.0119884092371821196`6., 0.1175762120697696386`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 5, "answerType" -> 1,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.108679, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "E^(n*ArcTanh[a*x])*(c - a*c*x)^(7/2)", "variable" -> "x",
  "optimal" -> "-((2^(1 + n/2)*(c - a*c*x)^(9/2)*Hypergeometric2F1[(9 - n)/2, \
-1/2*n, (11 - n)/2, (1 - a*x)/2])/(a*c*(9 - n)*(1 - a*x)^(n/2)))"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/430",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 430, "method" -> "Rubi",
  "answerSize" -> 114, "optimalSize" -> 157, "integrationTime" -> 0.125451,
  "correct" -> False, "verificationTime" -> 0.684605,
  "verificationMethod" -> "numeric", "numericScales" -> "{1.00226997527762079\
52`6., 1.0020410572137198115`6., 1.0019213590829797969`6., \
1.0111531375748378052`6., 1.0235637057944208984`6., 1.0017138605337496157`6., \
1.0090967850025471007`6., 1.9813166024955696012`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 2, "answerType" -> 2,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "((1 - a*x)^(3/2)*(c - \
a*c*x)^(3/2))/(a^2*c*Sqrt[1 + a*x]) + (7*(8*c*Sqrt[1 - a*x]*Sqrt[1 + \
a*x]*Sqrt[c - a*c*x] + 3*Sqrt[1 - a*x]*Sqrt[1 + a*x]*(c - \
a*c*x)^(3/2)))/(15*a^2*c)", "originalVerificationTime" -> 0.660033,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "(x*Sqrt[c - a*c*x])/E^(3*ArcTanh[a*x])", "variable" -> "x",
  "optimal" -> "(8*c^2*(1 - a*x)^(3/2))/(a^2*Sqrt[1 + a*x]*(c - a*c*x)^(3/2)) \
+ (16*c^2*(1 - a*x)^(3/2)*Sqrt[1 + a*x])/(a^2*(c - a*c*x)^(3/2)) - (10*c^2*(1 \
- a*x)^(3/2)*(1 + a*x)^(3/2))/(3*a^2*(c - a*c*x)^(3/2)) + (2*c^2*(1 - \
a*x)^(3/2)*(1 + a*x)^(5/2))/(5*a^2*(c - a*c*x)^(3/2))"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1015",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 1015, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 17, "integrationTime" -> 0.122338, "correct" -> False,
  "verificationTime" -> 0.215541, "verificationMethod" -> "numeric",
  "numericScales" -> "{1.`6., 1.`6., 0.0276678544886329607`6., \
0.7361975418996624551`6., 0.4375172355529092324`6., 1.`6., 1.`6., \
0.0020363898396064471`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 1, "answerType" -> 9, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "ComplexInfinity", "originalVerificationTime" ->
   0.025726, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/((d + e*x)*(c*d^2 + 2*c*d*e*x + c*e^2*x^2)^2)", "variable" -> "x",
  "optimal" -> "-1/4*1/(c^2*e*(d + e*x)^4)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.1 \
Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/1511",
  "section" -> "1 Algebraic functions", "file" -> "1.2 Trinomial \
products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m",
  "index" -> 1511, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 57, "integrationTime" -> 0.066957, "correct" -> False,
  "verificationTime" -> 0.06806, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.3214064179179661847`6., 0.2096058258688262266`6., \
1.`6., 0.1592557154441704061`6., 0.2244689607000566325`6., \
0.3901500716719088053`6., 1.`6., 0.0240072334123553419`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 9,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "ComplexInfinity",
  "originalVerificationTime" -> 0.027699, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/((d + e*x)*(a^2 + 2*a*b*x + b^2*x^2))", "variable" -> "x",
  "optimal" -> "-(1/((b*d - a*e)*(a + b*x))) - (e*Log[a + b*x])/(b*d - a*e)^2 \
+ (e*Log[d + e*x])/(b*d - a*e)^2"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1031",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 1031, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 12, "integrationTime" -> 0.002818, "correct" -> False,
  "verificationTime" -> 0.040453, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.5569610595703125`6., 0.0230341576708637578`6., \
0.5925445628209439664`6., 0.0977466480509683595`6., 0.3022898027426721455`6., \
0.3504394910993569321`6., 0.5423975505957481276`6., \
0.0077787589568703637`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 2, "answerType" -> 9, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "ComplexInfinity", "originalVerificationTime" ->
   0.008004, "originalVerificationMethod" -> "numeric",
  "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "x^3/Sqrt[a + (2 + 2*c - 2*(1 + c))*x^4]", "variable" -> "x",
  "optimal" -> "x^4/(4*Sqrt[a])"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/279",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 279, "method" -> "Rubi",
  "answerSize" -> 1, "optimalSize" -> 81, "integrationTime" -> 0.092605,
  "correct" -> False, "verificationTime" -> 0.095142,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.01880168288800701\
23`6., 1.`6., 0.1587685136998602976`6., 1.`6., 1.`6., 1.`6., 1.`6., \
0.1678516779991062887`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 5, "answerType" -> 1, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "0", "originalVerificationTime" -> 0.092457,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "E^(n*ArcTanh[a*x])*(c - a*c*x)^(5/2)", "variable" -> "x",
  "optimal" -> "-((2^(1 + n/2)*(c - a*c*x)^(7/2)*Hypergeometric2F1[(7 - n)/2, \
-1/2*n, (9 - n)/2, (1 - a*x)/2])/(a*c*(7 - n)*(1 - a*x)^(n/2)))"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/520",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 520, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 102, "integrationTime" -> 0.064466, "correct" -> False,
  "verificationTime" -> 0.221267, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.00002278903137839004292849974397262627`6., \
0.3146208405109406039`6., 1.`6., 0.0017209540548276417`6., \
0.011327971110385057`6., 0.562827228725853804`6., 0.0004845079611995489`6., \
1.`6.}", "grade" -> "F", "outcome" -> "wrong", "expressionType" -> 3,
  "answerType" -> 1, "gradeReason" -> "derivative differs from integrand at \
deterministic numeric samples (verification repair)", "answer" -> "0",
  "originalVerificationTime" -> 0.019436, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/(x*(a^2 + 2*a*b*x^2 + b^2*x^4)^3)", "variable" -> "x",
  "optimal" -> "1/(10*a*(a + b*x^2)^5) + 1/(8*a^2*(a + b*x^2)^4) + \
1/(6*a^3*(a + b*x^2)^3) + 1/(4*a^4*(a + b*x^2)^2) + 1/(2*a^5*(a + b*x^2)) + \
Log[x]/a^6 - Log[a + b*x^2]/(2*a^6)"|>,
 <|"key" -> "1 Algebraic functions/1.2 Trinomial products/1.2.2 \
Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m/1016",
  "section" -> "1 Algebraic functions",
  "file" ->
   "1.2 Trinomial products/1.2.2 Quartic/1.2.2.2 (d x)^m (a+b x^2+c x^4)^p.m"\
, "index" -> 1016, "method" -> "Rubi", "answerSize" -> 1,
  "optimalSize" -> 25, "integrationTime" -> 0.04741, "correct" -> False,
  "verificationTime" -> 0.053679, "verificationMethod" -> "numeric",
  "numericScales" -> "{0.5476059435674540325`6., 0.6986500852155572883`6., \
1.`6., 0.8050464294701444352`6., 0.671013690147505449`6., \
0.8631504049177458556`6., 1.`6., 0.9414688716912717788`6.}", "grade" -> "F",
  "outcome" -> "wrong", "expressionType" -> 3, "answerType" -> 9,
  "gradeReason" -> "derivative differs from integrand at deterministic \
numeric samples (verification repair)", "answer" -> "ComplexInfinity",
  "originalVerificationTime" -> 0.017575, "originalVerificationMethod" ->
   "numeric", "verificationTimeLimit" -> 180, "verificationRepair" ->
   "numeric-filter-v2-utf8-sha256", "integrand" ->
   "1/Sqrt[a + b*x^2 + (2 + 2*c - 2*(1 + c))*x^4]", "variable" -> "x",
  "optimal" -> "ArcTanh[(Sqrt[b]*x)/Sqrt[a + b*x^2]]/Sqrt[b]"|>,
 <|"key" -> "7 Inverse hyperbolic functions/7.3 Inverse hyperbolic \
tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/280",
  "section" -> "7 Inverse hyperbolic functions",
  "file" -> "7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse \
hyperbolic tangent functions.m", "index" -> 280, "method" -> "Rubi",
  "answerSize" -> 1, "optimalSize" -> 81, "integrationTime" -> 0.05562,
  "correct" -> False, "verificationTime" -> 0.087058,
  "verificationMethod" -> "numeric", "numericScales" -> "{0.04348203236758726\
69`6., 1.`6., 1.`6., 0.0961747060846188688`6., 0.4671493078871775612`6., \
0.0907612722615073748`6., 0.5475293933932025495`6., \
0.3800747418237473249`6.}", "grade" -> "F", "outcome" -> "wrong",
  "expressionType" -> 5, "answerType" -> 1, "gradeReason" -> "derivative \
differs from integrand at deterministic numeric samples (verification \
repair)", "answer" -> "0", "originalVerificationTime" -> 0.086027,
  "originalVerificationMethod" -> "numeric", "verificationTimeLimit" -> 180,
  "verificationRepair" -> "numeric-filter-v2-utf8-sha256",
  "integrand" -> "E^(n*ArcTanh[a*x])*(c - a*c*x)^(3/2)", "variable" -> "x",
  "optimal" -> "-((2^(1 + n/2)*(c - a*c*x)^(5/2)*Hypergeometric2F1[(5 - n)/2, \
-1/2*n, (7 - n)/2, (1 - a*x)/2])/(a*c*(5 - n)*(1 - a*x)^(n/2)))"|>}
