# W15 wrong-answer second audit

Counts: <|"different-constant" -> 3, "wrong-derivative" -> 41, "false-alarm" -> 3, "undecided" -> 1|>

## different-constant: 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/153

- Integrand: `1/((-a - b*x^2)^(1/3)*((9*a*d)/b + d*x^2))`
- W15 answer: `(27*a*b*x*AppellF1[1/2, 1/3, 1, 3/2, -((b*x^2)/a), -1/9*(b*x^2)/a])/(d*(-a - b*x^2)^(1/3)*(9*a + b*x^2)*(27*a*AppellF1[1/2, 1/3, 1, 3/2, -((b*x^2)/a), -1/9*(b*x^2)/a] - 2*b*x^2*(AppellF1[3/2, 1/3, 2, 5/2, -((b*x^2)/a), -1/9*(b*x^2)/a] + 3*AppellF1[3/2, 4/3, 1, 5/2, -((b*x^2)/a), -1/9*(b*x^2)/a])))`
- Reason: derivative matches but answer minus reference varies across continuous samples
- 50-digit evidence: `<|"Type" -> "region-constant", "Points" -> <|"First" -> <|"Point" -> "{x -> 83/84, a -> 23/27, b -> 74/119, d -> 103/67}", "AnswerValue" -> "0.02515243614165055808338051513137622609465433386598819435432771617149692487807`49.84948500216801 - 0.0435652973314704652382036889786623461317848977439930975691071132664086377948`50.08804562952784*I", "OptimalValue" -> "-0.05159228780619990544049982770003510073796014743034530755777440305232385703345`49.84948500216801 + 0.08936046375905448687562149132835243469812695596882002418580542071983605468122`50.088045629527834*I", "Difference" -> "0.07674472394785046352388034283141132683261448129633350130222458344643183258199`49.84948500216801 - 0.13292576109052495211382518030701478082991185371281312069857365562490130850068`50.08804562952784*I"|>, "Second" -> <|"Point" -> "{x -> 55/78 + (2*I)/5, a -> 13/50 + (3*I)/37, b -> 2/5 + (3*I)/10, d -> 37/56 + (11*I)/41}", "AnswerValue" -> "0.09618302759266420249099863294631659222461799749923854111364574390521343197742`49.609490463009635 + 0.32015374408504113360690359972902935724403303271983748125645714062233383287029`50.13175060470147*I", "OptimalValue" -> "-0.47499630589906954443173965380946606925905644838605796003554169705729601289883`50.117538868671154 - 0.19235770809554156253450240196030443968884701900916522235060727807366437083799`49.72495823049013*I", "Difference" -> "0.57117933349173374692273828675578266148367444588529650583136245880310081514714`50.02226161030678 + 0.51251145218058269614140600168933379693288005172900269953585861319504573233024`49.97519269921304*I"|>|>|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/425

- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r)^2)`
- W15 answer: `((d*r*(a + b*Log[c*x^n]))/(d + e*x^r) + b*n*Log[d - d*x^r] - a*r*Log[d - d*x^r] + b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]))/(d^2*r^2)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 29/126, d -> 25/114, e -> 32/87, r -> 99/97, a -> 96/113, b -> 5/18, c -> 21/37, n -> 65/57}", "IntegrandValue" -> "10.85036407040704956375452543074254697692674866836546006048507209401925203022403`50.", "DerivativeValue" -> "-4.33073895701435047221011986772758271272169714119095286307821492535639067589063`50.15051499783199 + 0``49.51395299118479*I", "ResidualValue" -> "-15.18110302742140003596464529847012968964844580955641292356328701937564270611466`50.037893188382725 + 0``48.9692116701909*I"|>`


## wrong-derivative: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/153

- Integrand: `(g*x)^(-1 - m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `(-(b*f*k*m^2*n*x^m*Log[x]^2) - 2*(a*m + b*n + b*m*Log[c*x^n])*(f*k*x^m*Log[f - f/x^m] + e*Log[d*(e + f*x^m)^k]) + 2*f*k*m*x^m*Log[x]*(a*m + b*n + b*m*Log[c*x^n] + b*n*Log[f - f/x^m] - b*n*Log[1 + (f*x^m)/e]) - 2*b*f*k*n*x^m*PolyLog[2, -((f*x^m)/e)])/(2*e*g*m^2*(g*x)^m)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 54/55, g -> 7/6, m -> 75/89, a -> 35/16, b -> 111/76, c -> 37/33, n -> 11/52, d -> 11/5, e -> 49/43, f -> 7/25, k -> 34/75}", "IntegrandValue" -> "1.72996240359791005819071923351318895794030509221226488064354830145660247496675`50.", "DerivativeValue" -> "16.92081323368187581660697087332691828504892762713722655649683343997732357477471`50.15051499783199 + 0``48.92209376593671*I", "ResidualValue" -> "15.19085083008396575841625163981372932710862253492496167585328513852072109980796`50.15051499783199 + 0``48.968932898724816*I"|>`


## wrong-derivative: 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/465

- Integrand: `(a + b*(c*Sec[e + f*x])^n)^p*Tan[e + f*x]^3`
- W15 answer: `((a + b*(c*Sec[e + f*x])^n)^p*((2*Hypergeometric2F1[1, 1 + p, 2 + p, 1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a]*(a + b*(c*Sqrt[Sec[e + f*x]^2])^n))/(a*n*(1 + p)) + (Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^2)/(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p))/(2*f)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 20/31, a -> 16/15, b -> 79/105, c -> 83/82, e -> 83/44, f -> 74/73, n -> 68/75, p -> 40/63}", "IntegrandValue" -> "-0.13293577303245089221008363180244966931047576731131124881279708547892664950661`50.07175134504675 - 0.08790195566477823673080131026820808781834024035717433381298762433071556165743`49.89210801715331*I", "DerivativeValue" -> "-0.82762687308873245239636417628169769999448492341000499944854111173900624196725`49.893875938559006 - 1.24432105634668746431765788006635011012855652041553252738897238660555539717115`50.07097380507*I", "ResidualValue" -> "-0.69469110005628156018628054447924803068400915609869373243221006371970275174703`49.862282867614304 - 1.15641910068190922758685656979814202231021628005835817482333500602809407432451`50.08360638895122*I"|>`


## wrong-derivative: 6 Hyperbolic functions/6.4 Hyperbolic cotangent/6.4.7 (d hyper)^m (a+b (c coth)^n)^p.m/49

- Integrand: `1/Sqrt[-1 - Coth[x]^2]`
- W15 answer: `(ArcSinh[(Sqrt[2]*Coth[x])/Sqrt[1 - Coth[x]^2]]*Sqrt[1 + Coth[x]^2])/(Sqrt[2]*Sqrt[-1 - Coth[x]^2])`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 64/99}", "IntegrandValue" -> "-0.49473409812853041146286161572637831339836141261960098047358105746606917992699`50.*I", "DerivativeValue" -> "0.49473409812853041146286161572637831339836141261960098047358105746606917992698`50.*I", "ResidualValue" -> "0.98946819625706082292572323145275662679672282523920196094716211493213835985397`50.*I"|>`


## false-alarm: 1 Algebraic functions/1.1 Binomial products/1.1.1 Linear/1.1.1.3 (a+b x)^m (c+d x)^n (e+f x)^p.m/746

- Integrand: `1/(x*Sqrt[1 - a - b*x]*Sqrt[1 + a + b*x])`
- W15 answer: `(2*Sqrt[-1 + a + b*x]*Sqrt[1 + a + b*x]*ArcTan[(-1 + a)/(Sqrt[1 - a^2]*Sqrt[(-1 + a + b*x)/(1 + a + b*x)])])/(Sqrt[1 - a^2]*Sqrt[-((-1 + a + b*x)*(1 + a + b*x))])`
- Reason: derivative and answer-minus-reference constant agree at all continuous samples
- 50-digit evidence: `Missing["NotApplicable"]`


## different-constant: 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/130

- Integrand: `(3*a + b*x^2)^2/(a - b*x^2)^(4/3)`
- W15 answer: `(-3*x*(-57*a + b*x^2 + 36*a*(1 - (b*x^2)/a)^(1/3)*Hypergeometric2F1[1/3, 1/2, 3/2, (b*x^2)/a]))/(7*(a - b*x^2)^(1/3))`
- Reason: derivative matches but answer minus reference varies across continuous samples
- 50-digit evidence: `<|"Type" -> "region-constant", "Points" -> <|"First" -> <|"Point" -> "{x -> 29/91, a -> 102/113, b -> 67/46}", "AnswerValue" -> "3.01397951509874971262874269586481166856336285140370366530814841407040056035901`50.", "OptimalValue" -> "3.01397951509874971262874269586481166856336285140370366517335893006334974766839`49.51368122042636 + 12.70841444828238340539199409752226780308428576386535469055456576696282985968287`50.138632293824244*I", "Difference" -> "0``49.04642362818404 - 12.70841444828238340539199409752226780308428576386535469055456576696282985968287`50.15051499783199*I"|>, "Second" -> <|"Point" -> "{x -> 37/16 + (3*I)/49, a -> 76/89 + (4*I)/9, b -> 47/117 + I/4}", "AnswerValue" -> "-17.94937721598360620812369546854983254224725722326218270343516176098077326304449`50.00475110025207 + 17.55661970874073950151805807501375960462195375320127825838218533782490610110457`49.99514261770913*I", "OptimalValue" -> "-11.27159370424044916054292097724054727120152989168574339381698682709802890385549`50.103630972145545 - 5.53330033038441262646763634470025294624463281221763608993479427301750673635571`49.7946298893486*I", "Difference" -> "-6.67778351174315704758077449130928527104572733157643931007405573071574485029084`49.594282167147604 + 23.08992003912515212798569441971401255086658656541891434716079785941256660693464`50.13307226062037*I"|>|>|>`


## false-alarm: 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/154

- Integrand: `1/((2 + b*x^2)^(1/3)*((18*d)/b + d*x^2))`
- W15 answer: `(-27*b*x*AppellF1[1/2, 1/3, 1, 3/2, -1/2*(b*x^2), -1/18*(b*x^2)])/(d*(2 + b*x^2)^(1/3)*(18 + b*x^2)*(-27*AppellF1[1/2, 1/3, 1, 3/2, -1/2*(b*x^2), -1/18*(b*x^2)] + b*x^2*(AppellF1[3/2, 1/3, 2, 5/2, -1/2*(b*x^2), -1/18*(b*x^2)] + 3*AppellF1[3/2, 4/3, 1, 5/2, -1/2*(b*x^2), -1/18*(b*x^2)])))`
- Reason: derivative and answer-minus-reference constant agree at all continuous samples
- 50-digit evidence: `Missing["NotApplicable"]`


## wrong-derivative: 1 Algebraic functions/1.1 Binomial products/1.1.2 Quadratic/1.1.2.3 (a+b x^2)^p (c+d x^2)^q.m/322

- Integrand: `1/((a + b*x^2)^(1/4)*(c + d*x^2))`
- W15 answer: `(-6*a*c*x*AppellF1[1/2, 1/4, 1, 3/2, -((b*x^2)/a), -((d*x^2)/c)])/((a + b*x^2)^(1/4)*(c + d*x^2)*(-6*a*c*AppellF1[1/2, 1/4, 1, 3/2, -((b*x^2)/a), -((d*x^2)/c)] + x^2*(4*a*d*AppellF1[3/2, 1/4, 2, 5/2, -((b*x^2)/a), -((d*x^2)/c)] + b*c*AppellF1[3/2, 5/4, 1, 5/2, -((b*x^2)/a), -((d*x^2)/c)])))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 53/41, a -> 6/7, b -> 1, c -> 31/75, d -> 79/67}", "IntegrandValue" -> "0.33270216311744620505646629053417684171419847100241656722685093604090997560607`50.", "DerivativeValue" -> "0.33270216311755077229934449461756535808458206529064868635317444675814270335598`50.", "ResidualValue" -> "9.02114933153391962740624323943867039359852524323768876241939`50.*^-18"|>`


## false-alarm: 1 Algebraic functions/1.1 Binomial products/1.1.3 General/1.1.3.4 (e x)^m (a+b x^n)^p (c+d x^n)^q.m/322

- Integrand: `1/((8*c - d*x^3)*Sqrt[c + d*x^3])`
- W15 answer: `(32*c*x*AppellF1[1/3, 1/2, 1, 4/3, -((d*x^3)/c), (d*x^3)/(8*c)])/((8*c - d*x^3)*Sqrt[c + d*x^3]*(32*c*AppellF1[1/3, 1/2, 1, 4/3, -((d*x^3)/c), (d*x^3)/(8*c)] + 3*d*x^3*(AppellF1[4/3, 1/2, 2, 7/3, -((d*x^3)/c), (d*x^3)/(8*c)] - 4*AppellF1[4/3, 3/2, 1, 7/3, -((d*x^3)/c), (d*x^3)/(8*c)])))`
- Reason: derivative and answer-minus-reference constant agree at all continuous samples
- 50-digit evidence: `Missing["NotApplicable"]`


## different-constant: 1 Algebraic functions/1.1 Binomial products/1.1.3 General/1.1.3.4 (e x)^m (a+b x^n)^p (c+d x^n)^q.m/826

- Integrand: `((a + b/x^2)^p*(c + d/x^2)^q)/x^3`
- W15 answer: `-1/2*((a + b/x^2)^p*(c + d/x^2)^q*(d + c*x^2)*(1 + (c*x^2)/d)^p*Hypergeometric2F1[-p, -1 - p - q, -p - q, ((b*c - a*d)*x^2)/(b*(d + c*x^2))])/(d*(1 + p + q)*x^2*(1 + (a*x^2)/b)^p)`
- Reason: derivative matches but answer minus reference varies across continuous samples
- 50-digit evidence: `<|"Type" -> "region-constant", "Points" -> <|"First" -> <|"Point" -> "{x -> 51/41, a -> 51/29, b -> 51/113, p -> 9/5, c -> 81/68, d -> 1/2, q -> 93/101}", "AnswerValue" -> "-2.69796221921830790406987336604429655841891711616896115347756122472098904910295`50.", "OptimalValue" -> "-2.6917833290442391366927524857589848040617533168647326615833105698049749660465`50.15051334283135 + 0.00743126675167478987207975797934657068255789047279396081604078863108565690075`47.59153609469549*I", "Difference" -> "-0.00617889017406876737712088028531175435716379930422865611941657838781196980763`49.95624643429435 - 0.00743126675167478987207975797934657068255789047279396081604079192342591913491`50.03639880928267*I"|>, "Second" -> <|"Point" -> "{x -> 41/94, a -> 41/46, b -> 71/92, p -> 1/7, c -> 14/11, d -> 11/80, q -> 94/109}", "AnswerValue" -> "59.70917298446844889800036764845021946066054908841116799965935483212739745718874`50.", "OptimalValue" -> "-5.2332599397211989871734496818804529467737688982810009973849115417970786305615`50.", "Difference" -> "64.94243292418964788517381733033067240743431798669216899704426637392447608775024`50."|>|>|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/426

- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r)^3)`
- W15 answer: `((d^2*r*(a + b*Log[c*x^n]))/(d + e*x^r)^2 + (d*(-(b*n) + 2*a*r + 2*b*r*Log[c*x^n]))/(d + e*x^r) + 3*b*n*Log[d - d*x^r] - 2*a*r*Log[d - d*x^r] + 2*b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + 2*b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]))/(2*d^3*r^2)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 15/28, d -> 20/31, e -> 25/37, r -> 7/9, a -> 83/101, b -> 41/78, c -> 13/37, n -> 73/38}", "IntegrandValue" -> "-0.55997147043676107324620323000236552851853130612922159210835869682033110927014`50.", "DerivativeValue" -> "-12.11506029056817144330537520006052255351558214127147059311105160000551272747022`50.15051499783199 + 0``49.067189418087644*I", "ResidualValue" -> "-11.55508882013141037005917197005815702499705083514224900100269290318518161820008`50.15051499783199 + 0``49.08774170972654*I"|>`


## wrong-derivative: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/154

- Integrand: `(g*x)^(-1 - 2*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `(-2*a*e*f*k*m*x^m - 3*b*e*f*k*n*x^m + b*f^2*k*m^2*n*x^(2*m)*Log[x]^2 - 2*b*e*f*k*m*x^m*Log[c*x^n] + 2*a*f^2*k*m*x^(2*m)*Log[f - f/x^m] + b*f^2*k*n*x^(2*m)*Log[f - f/x^m] + 2*b*f^2*k*m*x^(2*m)*Log[c*x^n]*Log[f - f/x^m] - 2*a*e^2*m*Log[d*(e + f*x^m)^k] - b*e^2*n*Log[d*(e + f*x^m)^k] - 2*b*e^2*m*Log[c*x^n]*Log[d*(e + f*x^m)^k] - f^2*k*m*x^(2*m)*Log[x]*(2*a*m + b*n + 2*b*m*Log[c*x^n] + 2*b*n*Log[f - f/x^m] - 2*b*n*Log[1 + (f*x^m)/e]) + 2*b*f^2*k*n*x^(2*m)*PolyLog[2, -((f*x^m)/e)])/(4*e^2*g*m^2*(g*x)^(2*m))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 35/76, g -> 10/7, m -> 70/39, a -> 11/50, b -> 79/47, c -> 91/114, n -> 13/41, d -> 1, e -> 112/101, f -> 109/73, k -> 2/7}", "IntegrandValue" -> "-0.43793978419532895871330400633646653360409750938453373937155187017241284655696`50.", "DerivativeValue" -> "-0.43615780975092355399240415982007327914047395421227714226702105060761700950593`50.15051499783199 + 0``50.51087134456396*I", "ResidualValue" -> "0.00178197444440540472089984651639325446362355517225659710453081956479583705103`50.15051499783199 + 0``52.899613526376534*I"|>`


## wrong-derivative: Blake/Blake_Problems.m/2066

- Integrand: `(b + a*x^6)/(x^6*(-b + a*x^3)*(b*x + a*x^4)^(1/4))`
- W15 answer: `(4*((b + a*x^3)^2 - (7*a*(a + b)*x^6*(1 + (a*x^3)/b)^(1/4)*Hypergeometric2F1[1/4, 1/4, 5/4, (-2*a*x^3)/(b - a*x^3)])/(1 - (a*x^3)/b)^(1/4)))/(21*b^2*x^5*(x*(b + a*x^3))^(1/4))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 101/40, b -> 47/45, a -> 7/22}", "IntegrandValue" -> "0.03977759305804556004858107717946506212672003600509397709073086406625471532916`50.", "DerivativeValue" -> "-0.01146884148339316655752912388551719486799797723188674877741808970110969363421`49.489758567680674 - 0.0512464345414387266061102010649822569947180132369807258682206077134992082639`50.139902672345244*I", "ResidualValue" -> "-0.05124643454143872660611020106498225699471801323698072586814895376736440896337`50. - 0.0512464345414387266061102010649822569947180132369807258682206077134992082639`50.*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/355

- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n]))/(d + e*x^m)`
- W15 answer: `((f*x)^m*(-(b*m^2*n*Log[x]^2) + a*m*Log[d - d*x^m] + b*m*Log[c*x^n]*Log[d - d*x^m] - b*n*Log[-((e*x^m)/d)]*Log[d + e*x^m] + m*Log[x]*(a*m + b*m*Log[c*x^n] - b*n*Log[d - d*x^m] + b*n*Log[d + e*x^m]) - b*n*PolyLog[2, 1 + (e*x^m)/d]))/(e*f*m^2*x^m)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 70/87, f -> 1/10, m -> 99/38, d -> 99/56, e -> 24/37, a -> 5/22, b -> 40/117, c -> 44/43, n -> 94/121}", "IntegrandValue" -> "0.00145375540382135088954868540978448032584006417461798938017867816875979984596`50.", "DerivativeValue" -> "-0.00396637190312089141470090102607655478926137219581149787228343801942775355479`50.15051499783199 + 0``52.552121564840974*I", "ResidualValue" -> "-0.00542012730694224230424958643586103511510143637042948725246211618818755340075`50.10476263910933 + 0``52.416505510545775*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/363

- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)`
- W15 answer: `((f*x)^m*(3*a^2*m^3*Log[x] - 6*a*b*m^3*n*Log[x]^2 + 4*b^2*m^3*n^2*Log[x]^3 + 6*a*b*m^3*Log[x]*Log[c*x^n] - 6*b^2*m^3*n*Log[x]^2*Log[c*x^n] + 3*b^2*m^3*Log[x]*Log[c*x^n]^2 + 3*b^2*m^2*n^2*Log[x]^2*Log[1 + d/(e*x^m)] + 3*a^2*m^2*Log[d - d*x^m] - 6*a*b*m^2*n*Log[x]*Log[d - d*x^m] + 3*b^2*m^2*n^2*Log[x]^2*Log[d - d*x^m] + 6*a*b*m^2*Log[c*x^n]*Log[d - d*x^m] - 6*b^2*m^2*n*Log[x]*Log[c*x^n]*Log[d - d*x^m] + 3*b^2*m^2*Log[c*x^n]^2*Log[d - d*x^m] + 6*a*b*m^2*n*Log[x]*Log[d + e*x^m] - 6*b^2*m^2*n^2*Log[x]^2*Log[d + e*x^m] - 6*a*b*m*n*Log[-((e*x^m)/d)]*Log[d + e*x^m] + 6*b^2*m*n^2*Log[x]*Log[-((e*x^m)/d)]*Log[d + e*x^m] + 6*b^2*m^2*n*Log[x]*Log[c*x^n]*Log[d + e*x^m] - 6*b^2*m*n*Log[-((e*x^m)/d)]*Log[c*x^n]*Log[d + e*x^m] - 6*b^2*m*n^2*Log[x]*PolyLog[2, -(d/(e*x^m))] - 6*b*m*n*(a - b*n*Log[x] + b*Log[c*x^n])*PolyLog[2, 1 + (e*x^m)/d] - 6*b^2*n^2*PolyLog[3, -(d/(e*x^m))]))/(3*e*f*m^3*x^m)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 107/49, f -> 31/72, m -> 14/29, d -> 21/97, e -> 28/53, a -> 19/123, b -> 22/13, c -> 13/50, n -> 65/61}", "IntegrandValue" -> "0.53760856306619325281346203135091756530529848695096610750214308947857528815516`50.", "DerivativeValue" -> "21.13837172734634592615064642945303344392749482323402367730988624291936638316782`50.15051499783199 + 0``48.82544346694494*I", "ResidualValue" -> "20.60076316428015267333718439810211587862219633628305756980774315344079109501266`50.15051499783199 + 0``48.836631688535824*I"|>`


## wrong-derivative: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/155

- Integrand: `(g*x)^(-1 - 3*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `(-6*a*e^2*f*k*m*x^m - 5*b*e^2*f*k*n*x^m + 12*a*e*f^2*k*m*x^(2*m) + 16*b*e*f^2*k*n*x^(2*m) - 6*b*f^3*k*m^2*n*x^(3*m)*Log[x]^2 - 6*b*e^2*f*k*m*x^m*Log[c*x^n] + 12*b*e*f^2*k*m*x^(2*m)*Log[c*x^n] - 12*a*f^3*k*m*x^(3*m)*Log[f - f/x^m] - 4*b*f^3*k*n*x^(3*m)*Log[f - f/x^m] - 12*b*f^3*k*m*x^(3*m)*Log[c*x^n]*Log[f - f/x^m] - 12*a*e^3*m*Log[d*(e + f*x^m)^k] - 4*b*e^3*n*Log[d*(e + f*x^m)^k] - 12*b*e^3*m*Log[c*x^n]*Log[d*(e + f*x^m)^k] + 4*f^3*k*m*x^(3*m)*Log[x]*(3*a*m + b*n + 3*b*m*Log[c*x^n] + 3*b*n*Log[f - f/x^m] - 3*b*n*Log[1 + (f*x^m)/e]) - 12*b*f^3*k*n*x^(3*m)*PolyLog[2, -((f*x^m)/e)])/(36*e^3*g*m^2*(g*x)^(3*m))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 13/24, g -> 24/19, m -> 75/88, a -> 10/17, b -> 26/27, c -> 42/115, n -> 19/74, d -> 24/121, e -> 62/55, f -> 67/46, k -> 87/46}", "IntegrandValue" -> "0.6484910521577245448695223003330836296464832962208301295168451053124881543182`50.", "DerivativeValue" -> "-0.25270201158911128144665739422361704720248681261622908468476564305128407908778`50.15051499783199 + 0``50.74790629877486*I", "ResidualValue" -> "-0.90119306374683582631617969455670067684897010883705921420161074836377223473085`50.15051499783199 + 0``50.19569715742119*I"|>`


## wrong-derivative: 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.2 Exponentials of inverse hyperbolic cotangent functions.m/731

- Integrand: `E^(2*ArcCoth[a*x])*x^m*Sqrt[c - a^2*c*x^2]`
- W15 answer: `(x^(1 + m)*((2*Sqrt[1 - a*x]*Sqrt[-(c*(1 + a*x))]*AppellF1[1 + m, 1/2, -1/2, 2 + m, a*x, -(a*x)])/(Sqrt[-1 + a*x]*Sqrt[1 + a*x]) + (Sqrt[c - a^2*c*x^2]*Hypergeometric2F1[-1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/Sqrt[1 - a^2*x^2]))/(1 + m)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 11/48, a -> 19/82, m -> 74/43, c -> 4/5}", "IntegrandValue" -> "-0.07869774565740413625998820196966438417877947569438416416004227052694950811549`50.15051499783199 + 0``51.25455270591221*I", "DerivativeValue" -> "0.22022078453081557936781740763477374959943622161137802568334451039225197300197`50.", "ResidualValue" -> "0.29891853018821971562780560960443813377821569730576218984338678091920148111746`50.034850733866364 + 0``50.67496215971124*I"|>`


## undecided: 8 Special functions/8.4 Trig integral functions.m/115

- Integrand: `(Cos[b*x]*CosIntegral[b*x])/x^2`
- W15 answer: `-((Cos[b*x]*CosIntegral[b*x])/x)`
- Reason: too few finite samples away from integrand discontinuities
- 50-digit evidence: `Missing["NotApplicable"]`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/364

- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^2`
- W15 answer: `((f*x)^m*(-((m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)) - (2*a*b*m*n*Log[d - d*x^m])/d + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - d*x^m])/d + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + (e*x^m)/d]))/d))/(e*f*m^3*x^m)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 37/42, f -> 23/31, m -> 15/104, d -> 44/21, e -> 111/124, a -> 109/61, b -> 9/56, c -> 104/55, n -> 97/122}", "IntegrandValue" -> "0.57071421329158893284119293058643791029485078330548605290539109316374795066366`50.", "DerivativeValue" -> "140.5013223526482305597300791495401821045759075974672833300068`50.15051499783199 + 0``48.00283458613355*I", "ResidualValue" -> "139.9306081393566416268888862189537441942810568141617972771014`50.15051499783199 + 0``48.0046022762488*I"|>`


## wrong-derivative: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/741

- Integrand: `(d + e*x)^(-2 - 2*p)*(a + c*x^2)^p`
- W15 answer: `((-Sqrt[-a] + Sqrt[c]*x)*(d + e*x)^(-1 - 2*p)*(a + c*x^2)^p*(1 - (c*(d + e*x))/(c*d + Sqrt[-a]*Sqrt[c]*e))^p*Hypergeometric2F1[-1 - 2*p, -p, -2*p, (2*Sqrt[-a]*Sqrt[c]*(d + e*x))/((Sqrt[c]*d - Sqrt[-a]*e)*(Sqrt[-a] - Sqrt[c]*x))])/((Sqrt[c]*d + Sqrt[-a]*e)*(1 + 2*p)*(1 - (c*(d + e*x))/(c*d - Sqrt[-a]*Sqrt[c]*e))^p)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 51/59, d -> 1/4, e -> 49/122, p -> 4/19, a -> 2/7, c -> 18/17}", "IntegrandValue" -> "3.53860643106726225462346751745649256553427712563825108508003130853692772031733`50.", "DerivativeValue" -> "0.86867652353011157819817575432419593145787458819214523779001443500529854171889`49.54054081998965 + 3.43032601533122891601596776712139527917363526507370230305207092179823898137903`50.13701813236043*I", "ResidualValue" -> "-2.66992990753715067642529176313229663407640253744610584728631380856982689707529`49.93883379885769 + 3.4303260153312289160159677671213952791736352650737023030647107844819720788197`50.04766933567075*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/365

- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^3`
- W15 answer: `((f*x)^m*((2*b*m*n*(a + b*Log[c*x^n]))/(d*(d + e*x^m)) - (m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)^2 - (2*a*b*m*n*Log[d - d*x^m])/d^2 + (2*b^2*n^2*Log[d - d*x^m])/d^2 + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - d*x^m])/d^2 + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + (e*x^m)/d]))/d^2))/(2*e*f*m^3*x^m)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 22/119, f -> 50/59, m -> 37/45, d -> 85/98, e -> 51/62, a -> 15/32, b -> 47/35, c -> 27/49, n -> 26/61}", "IntegrandValue" -> "1.89730857776800220087076821158802536917096059098024937000042909339583310638598`50.", "DerivativeValue" -> "4.96286695525425086331222378308163066122633577266431817995099267491982250816052`50.15051499783199 + 0``49.45478236506332*I", "ResidualValue" -> "3.06555837748624866244145557149360529205537518168406880995056358152398940177455`50.15051499783199 + 0``49.66400540701195*I"|>`


## wrong-derivative: 4 Trig functions/4.5 Secant/4.5.1.3 (d sin)^n (a+b sec)^m.m/285

- Integrand: `(a + a*Sec[c + d*x])/(e*Csc[c + d*x])^(3/2)`
- W15 answer: `(a*e*Sec[(c + d*x)/2]^2*(1 + Sec[c + d*x])*(-10*Cot[c + d*x]^2 + (2*(3 + Cot[c + d*x]*Csc[c + d*x])*(5*Cot[c + d*x]^2*Hypergeometric2F1[1/4, 3/4, 5/4, -Tan[c + d*x]^2] + 3*Hypergeometric2F1[5/4, 5/4, 9/4, -Tan[c + d*x]^2])*Sec[c + d*x]*(Sec[c + d*x]^2)^(1/4))/(3 + Cot[c + d*x]^2*Sqrt[Sec[c + d*x]^2])))/(30*d*(e*Csc[c + d*x])^(5/2))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 35/23, e -> 69/86, c -> 85/74, d -> 98/65, a -> 1/5}", "IntegrandValue" -> "-0.00212409300658333010678416158192936891856713266042603019987238600584176187877`50.*I", "DerivativeValue" -> "-0.24864656208731729713133562334911324473192249623562512890880399750480109183671`50.*I", "ResidualValue" -> "-0.24652246908073396702455146176718387581335536357519909870893330234012189196095`50.*I"|>`


## wrong-derivative: 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/245

- Integrand: `1/(Sqrt[e*Cot[c + d*x]]*(a + a*Sec[c + d*x]))`
- W15 answer: `-1/6*(Csc[c + d*x]*(24*Cot[c + d*x]^2*Hypergeometric2F1[-1/2, -1/4, 3/4, -Tan[c + d*x]^2] + 8*Hypergeometric2F1[1/2, 3/4, 7/4, -Tan[c + d*x]^2] - 3*Cot[c + d*x]^(3/2)*(2*Sqrt[2]*ArcTan[1 - Sqrt[2]*Sqrt[Cot[c + d*x]]] - 2*Sqrt[2]*ArcTan[1 + Sqrt[2]*Sqrt[Cot[c + d*x]]] + 8*Sqrt[Cot[c + d*x]] + Sqrt[2]*Log[1 - Sqrt[2]*Sqrt[Cot[c + d*x]] + Cot[c + d*x]] - Sqrt[2]*Log[1 + Sqrt[2]*Sqrt[Cot[c + d*x]] + Cot[c + d*x]]))*(1 + Sqrt[Sec[c + d*x]^2])*Sin[(c + d*x)/2]^2)/(a*d*Sqrt[e*Cot[c + d*x]])`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 29/30, e -> 9/13, c -> 41/27, d -> 38/67, a -> 109/126}", "IntegrandValue" -> "1.71494302756020891493565406150483002470488756130444289043929674209428417856546`50.*I", "DerivativeValue" -> "0``48.88670511671042 + 18.35734547282338070915899484994036491698689254127204083101626127713651528442155`50.15051499783199*I", "ResidualValue" -> "0``48.9292989779561 + 16.64240244526317179422334078843553489228200497996759794057696453504223110585608`50.15051499783199*I"|>`


## wrong-derivative: 4 Trig functions/4.7 Miscellaneous/4.7.7 Trig functions.m/373

- Integrand: `(2*a + 2*a*Cos[d + e*x] + 2*a*Sin[d + e*x])^(-4)`
- W15 answer: `(Sec[(d + e*x)/2]^6*(152 + 69*Cos[d + e*x] - 132*Cos[2*(d + e*x)] - 57*Cos[3*(d + e*x)] + 273*Sin[d + e*x] + 114*Sin[2*(d + e*x)] - 19*Sin[3*(d + e*x)]))/(3072*a^4*e*(1 + Tan[(d + e*x)/2])^3)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 56/125, a -> 22/67, d -> 11/40, e -> 23/68}", "IntegrandValue" -> "0.18426963725445505655119669453717552484804611086092749829797874184606335114726`50.", "DerivativeValue" -> "9.43742417033617496624234278030630114854229938850135988177421076562901050178207`50.", "ResidualValue" -> "9.25315453308171990969114608576912562369425327764043238347623202378294715063481`50."|>`


## wrong-derivative: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1133

- Integrand: `E^(2*ArcTanh[a*x])*x^m*Sqrt[c - a^2*c*x^2]`
- W15 answer: `(x^(1 + m)*((-2*Sqrt[1 - a*x]*Sqrt[-(c*(1 + a*x))]*AppellF1[1 + m, 1/2, -1/2, 2 + m, a*x, -(a*x)])/(Sqrt[-1 + a*x]*Sqrt[1 + a*x]) - (Sqrt[c - a^2*c*x^2]*Hypergeometric2F1[-1/2, (1 + m)/2, (3 + m)/2, a^2*x^2])/Sqrt[1 - a^2*x^2]))/(1 + m)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 13/34, a -> 20/19, m -> 31/80, c -> 33/92}", "IntegrandValue" -> "0.88661311482333971907903025376873098219100664570470477524547210206046214231859`50.", "DerivativeValue" -> "-1.64209360559996031855917523821625892728091517824778597723790816208663591232339`50.", "ResidualValue" -> "-2.52870672042330003763820549198498990947192182395249075248338026414709805464199`50."|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/366

- Integrand: `((f*x)^(-1 + m)*(a + b*Log[c*x^n])^2)/(d + e*x^m)^4`
- W15 answer: `((f*x)^m*((b*m*n*(a + b*Log[c*x^n]))/(d*(d + e*x^m)^2) - (m^2*(a + b*Log[c*x^n])^2)/(d + e*x^m)^3 + (b*n*(2*a*m - b*n + 2*b*m*Log[c*x^n]))/(d^2*(d + e*x^m)) - (2*a*b*m*n*Log[d - d*x^m])/d^3 + (3*b^2*n^2*Log[d - d*x^m])/d^3 + (2*b^2*m*n*(n*Log[x] - Log[c*x^n])*Log[d - d*x^m])/d^3 + (2*b^2*n^2*((m^2*Log[x]^2)/2 + (-(m*Log[x]) + Log[-((e*x^m)/d)])*Log[d + e*x^m] + PolyLog[2, 1 + (e*x^m)/d]))/d^3))/(3*e*f*m^3*x^m)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 79/117, f -> 31/32, m -> 53/107, d -> 5/9, e -> 85/127, a -> 3/7, b -> 21/61, c -> 29/49, n -> 39/35}", "IntegrandValue" -> "0.00783083249009483417069648613626898729688659336811694755401626622021161516802`50.", "DerivativeValue" -> "-25.69401400903950261752210476409213288351785915050005662092234116209865685084835`50.15051499783199 + 0``48.740683041257356*I", "ResidualValue" -> "-25.70184484152959745169280125022840187081474574386817356847635742831886846601637`50.15046019224173 + 0``48.74055070034735*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/430

- Integrand: `(a + b*Log[c*x^n])^2/(x*(d + e*x^r))`
- W15 answer: `-((a^2*r^2*Log[d - d*x^r] - 2*a*b*r^2*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - d*x^r] - 2*a*b*n*r*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 2*b^2*n*r*(n*Log[x] - Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + b^2*n^2*(r^2*Log[x]^2*Log[1 + d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, -(d/(e*x^r))] - 2*PolyLog[3, -(d/(e*x^r))]))/(d*r^3))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 52/21, d -> 61/63, e -> 82/49, r -> 14/15, a -> 93/92, b -> 4/5, c -> 27/47, n -> 3/2}", "IntegrandValue" -> "0.2273138867891164914885353683594029631108501609574074479900782792030582108375`50.", "DerivativeValue" -> "-0.03457563288176937456007114592551133677925604430919626250974759274986745743988`50.15051499783199 + 0``51.61174485953381*I", "ResidualValue" -> "-0.26188951967088586604860651428491429989010620526660371049982587195292566827738`50.0171269882209 + 0``50.7323968787125*I"|>`


## wrong-derivative: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/150

- Integrand: `(g*x)^(-1 + 3*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `((g*x)^(3*m)*(-36*a*e^2*f*k*m*x^m + 48*b*e^2*f*k*n*x^m + 18*a*e*f^2*k*m*x^(2*m) - 15*b*e*f^2*k*n*x^(2*m) - 12*a*f^3*k*m*x^(3*m) + 8*b*f^3*k*n*x^(3*m) - 36*b*e^3*k*m^2*n*Log[x]^2 - 36*b*e^2*f*k*m*x^m*Log[c*x^n] + 18*b*e*f^2*k*m*x^(2*m)*Log[c*x^n] - 12*b*f^3*k*m*x^(3*m)*Log[c*x^n] + 36*a*e^3*k*m*Log[e - e*x^m] - 12*b*e^3*k*n*Log[e - e*x^m] + 36*b*e^3*k*m*Log[c*x^n]*Log[e - e*x^m] - 36*b*e^3*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] + 12*e^3*k*m*Log[x]*(3*a*m - b*n + 3*b*m*Log[c*x^n] - 3*b*n*Log[e - e*x^m] + 3*b*n*Log[e + f*x^m]) + 36*a*f^3*m*x^(3*m)*Log[d*(e + f*x^m)^k] - 12*b*f^3*n*x^(3*m)*Log[d*(e + f*x^m)^k] + 36*b*f^3*m*x^(3*m)*Log[c*x^n]*Log[d*(e + f*x^m)^k] - 36*b*e^3*k*n*PolyLog[2, 1 + (f*x^m)/e]))/(108*f^3*g*m^2*x^(3*m))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 109/55, g -> 51/110, m -> 26/31, a -> 25/94, b -> 79/48, c -> 101/66, n -> 19/115, d -> 4/11, e -> 50/59, f -> 26/121, k -> 49/39}", "IntegrandValue" -> "-0.76282667128450237283959053433842893440911427196157949990376683978535052995755`50.", "DerivativeValue" -> "9.5750858726748607561030865992241690118674385527651929233391739649327695972067`50.15051499783199 + 0``49.16937232027106*I", "ResidualValue" -> "10.33791254395936312894267713356259794627655282472677242324294080471812012716424`50.137439818631684 + 0``49.136082144002685*I"|>`


## wrong-derivative: 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/246

- Integrand: `1/((e*Cot[c + d*x])^(3/2)*(a + a*Sec[c + d*x]))`
- W15 answer: `(2*Cot[c + d*x]^2*Csc[c + d*x]*((-1)^(3/4)*(ArcTan[(-1)^(3/4)*Sqrt[Cot[c + d*x]]] - ArcTanh[(-1)^(3/4)*Sqrt[Cot[c + d*x]]])*Sqrt[Cot[c + d*x]] + 2*Hypergeometric2F1[1/4, 1/2, 5/4, -Tan[c + d*x]^2])*(1 + Sqrt[Sec[c + d*x]^2])*Sin[(c + d*x)/2]^2)/(a*d*(e*Cot[c + d*x])^(3/2))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 4/5, e -> 95/99, c -> 95/108, d -> 17/13, a -> 17/15}", "IntegrandValue" -> "-2.21572979760132781153039594686557108318144354024692716327926636527319346337651`50.*I", "DerivativeValue" -> "0``49.209127564027014 + 8.73750493014735597287016335362394708295358753781124951427626740500290849049263`50.15051499783199*I", "ResidualValue" -> "0``49.11097260313496 + 10.95323472774868378440055930048951816613503107805817667755553377027610195386914`50.15051499783199*I"|>`


## wrong-derivative: 7 Inverse hyperbolic functions/7.3 Inverse hyperbolic tangent/7.3.6 Exponentials of inverse hyperbolic tangent functions.m/1134

- Integrand: `(E^(2*ArcTanh[a*x])*x^m)/Sqrt[c - a^2*c*x^2]`
- W15 answer: `(x^(1 + m)*Sqrt[1 - a^2*x^2]*AppellF1[1 + m, 3/2, -1/2, 2 + m, a*x, -(a*x)])/((1 + m)*Sqrt[-1 + a*x]*Sqrt[-(c*(1 + a*x))])`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 103/41, a -> 18/121, m -> 56/85, c -> 68/113}", "IntegrandValue" -> "5.5929329704603302836591447579558375886134566980042228219418506442173782102223`50.", "DerivativeValue" -> "-5.59293297046033028365914475795583758861345669800421985840539097272655657263805`50.", "ResidualValue" -> "-11.18586594092066056731828951591167517722691339600844268034724161694393478286036`50."|>`


## wrong-derivative: 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic cotangent functions.m/238

- Integrand: `ArcCoth[c + d*Tan[a + b*x]]`
- W15 answer: `x*(ArcCoth[c + d*Tan[a + b*x]] + (2*a*Log[1 - c - d*Tan[a + b*x]] - I*Log[1 - I*Tan[a + b*x]]*Log[(-1 + c + d*Tan[a + b*x])/(-1 + c - I*d)] + I*Log[1 + I*Tan[a + b*x]]*Log[(-1 + c + d*Tan[a + b*x])/(-1 + c + I*d)] - 2*a*Log[1 + c + d*Tan[a + b*x]] + I*Log[1 - I*Tan[a + b*x]]*Log[(1 + c + d*Tan[a + b*x])/(1 + c - I*d)] - I*Log[1 + I*Tan[a + b*x]]*Log[(1 + c + d*Tan[a + b*x])/(1 + c + I*d)] + I*PolyLog[2, -((d*(-I + Tan[a + b*x]))/(-1 + c + I*d))] - I*PolyLog[2, -((d*(-I + Tan[a + b*x]))/(1 + c + I*d))] - I*PolyLog[2, -((d*(I + Tan[a + b*x]))/(-1 + c - I*d))] + I*PolyLog[2, -((d*(I + Tan[a + b*x]))/(1 + c - I*d))])/(4*a - (2*I)*Log[1 - I*Tan[a + b*x]] + (2*I)*Log[1 + I*Tan[a + b*x]]))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 94/95, c -> 31/28, d -> 108/55, a -> 71/54, b -> 40/63}", "IntegrandValue" -> "-0.26073141359209159642266077670148803661996905471170316479716583796827598787584`50.", "DerivativeValue" -> "0.46272740799304170386727287294114194606921751749002106404856515711145063156943`49.76408919879465 - 1.02713264491286289383166464007550580265085920434388353818621606589466006301098`50.110390507094486*I", "ResidualValue" -> "0.72345882158513330028993364964262998268918657220172422884573099507972661944527`49.910821084973996 - 1.02713264491286289383166464007550580265085920434388353818621606589466006301098`50.06303380077293*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/415

- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r)^2)`
- W15 answer: `((d*r*(a + b*Log[c*x^n]))/(d + e*x^r) + b*n*Log[d - d*x^r] - a*r*Log[d - d*x^r] + b*r*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + b*n*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]))/(d^2*r^2)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 64/115, d -> 19/78, e -> 27/17, r -> 23/37, a -> 8/29, b -> 19/75, c -> 109/71, n -> 108/83}", "IntegrandValue" -> "0.1894508969686624388022451626423603813009702105077441885304818273954320735882`50.", "DerivativeValue" -> "-9.0599163620285931088430072222728843455020255269265897767023240309735330674218`50.15051499783199 + 0``49.193390809391055*I", "ResidualValue" -> "-9.24936725899725554764525238491524472680299573743433396523280585836896514100999`50.14684591568666 + 0``49.18440297377675*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/431

- Integrand: `(a + b*Log[c*x^n])^2/(x*(d + e*x^r)^2)`
- W15 answer: `((d*r^2*(a + b*Log[c*x^n])^2)/(d + e*x^r) + 2*a*b*n*r*Log[d - d*x^r] - a^2*r^2*Log[d - d*x^r] + 2*a*b*r^2*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + 2*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*Log[d - d*x^r] - b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - d*x^r] - 2*b^2*n^2*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 2*a*b*n*r*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 2*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) - b^2*n^2*(r^2*Log[x]^2*Log[1 + d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, -(d/(e*x^r))] - 2*PolyLog[3, -(d/(e*x^r))]))/(d^2*r^3)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 20/37, d -> 113/104, e -> 9/29, r -> 95/73, a -> 29/37, b -> 91/90, c -> 13/112, n -> 31/61}", "IntegrandValue" -> "3.59874468449467585515552739564688070546039177562150517991630598047465109318321`50.", "DerivativeValue" -> "3.2591586449199549554034041014831248166610730526479851008785012122858284309967`50.15051499783199 + 0``49.63740949685245*I", "ResidualValue" -> "-0.3395860395747208997521232941637558887993187229735200790378047681888226621865`50.15051499783199 + 0``50.619565169794484*I"|>`


## wrong-derivative: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/151

- Integrand: `(g*x)^(-1 + 2*m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `((g*x)^(2*m)*(2*a*e*f*k*m*x^m - 3*b*e*f*k*n*x^m - a*f^2*k*m*x^(2*m) + b*f^2*k*n*x^(2*m) + 2*b*e^2*k*m^2*n*Log[x]^2 + 2*b*e*f*k*m*x^m*Log[c*x^n] - b*f^2*k*m*x^(2*m)*Log[c*x^n] - 2*a*e^2*k*m*Log[e - e*x^m] + b*e^2*k*n*Log[e - e*x^m] - 2*b*e^2*k*m*Log[c*x^n]*Log[e - e*x^m] + 2*b*e^2*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] + e^2*k*m*Log[x]*(-2*a*m + b*n - 2*b*m*Log[c*x^n] + 2*b*n*Log[e - e*x^m] - 2*b*n*Log[e + f*x^m]) + 2*a*f^2*m*x^(2*m)*Log[d*(e + f*x^m)^k] - b*f^2*n*x^(2*m)*Log[d*(e + f*x^m)^k] + 2*b*f^2*m*x^(2*m)*Log[c*x^n]*Log[d*(e + f*x^m)^k] + 2*b*e^2*k*n*PolyLog[2, 1 + (f*x^m)/e]))/(4*f^2*g*m^2*x^(2*m))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 43/84, g -> 29/79, m -> 23/106, a -> 111/91, b -> 27/55, c -> 1/2, n -> 82/113, d -> 5/3, e -> 27/40, f -> 13/66, k -> 43/33}", "IntegrandValue" -> "0.48196200558547413292890189659706144293789082441456266584656098018290371028491`50.", "DerivativeValue" -> "9.12824815113598599996066529205938765042378653134986412565928671972013175506682`50.15051499783199 + 0``49.19012755997966*I", "ResidualValue" -> "8.64628614555051186703176339546232620748589570693530145981272573953722804478191`50.15051499783199 + 0``49.21368539358587*I"|>`


## wrong-derivative: 4 Trig functions/4.1 Sine/4.1.2.2 (g cos)^p (a+b sin)^m (c+d sin)^n.m/1391

- Integrand: `Sin[e + f*x]^2/(Sqrt[g*Cos[e + f*x]]*(a + b*Sin[e + f*x]))`
- W15 answer: `(Cos[e + f*x]^2*(a^2 - b^2 + b^2*Cos[e + f*x]^2)*(Sec[e + f*x]^2)^(3/4)*((a*Hypergeometric2F1[1/2, 3/4, 3/2, -Tan[e + f*x]^2]*Tan[e + f*x])/(a^2 - b^2) + ((a^2*Sqrt[b]*ArcTan[((-a^2 + b^2)^(1/4)*(Sec[e + f*x]^2)^(1/4))/Sqrt[b]])/(-a^2 + b^2)^(3/4) - (a^2*Sqrt[b]*ArcTanh[((-a^2 + b^2)^(1/4)*(Sec[e + f*x]^2)^(1/4))/Sqrt[b]])/(-a^2 + b^2)^(3/4) - (2*b)/(Sec[e + f*x]^2)^(1/4) + (a^3*EllipticPi[-(Sqrt[-a^2 + b^2]/b), ArcSin[(Sec[e + f*x]^2)^(1/4)], -1]*Tan[e + f*x])/((a^2 - b^2)*Sqrt[-Tan[e + f*x]^2]) + (a^3*EllipticPi[Sqrt[-a^2 + b^2]/b, ArcSin[(Sec[e + f*x]^2)^(1/4)], -1]*Tan[e + f*x])/((a^2 - b^2)*Sqrt[-Tan[e + f*x]^2]))/b^2))/(f*Sqrt[g*Cos[e + f*x]]*(a + b*Sin[e + f*x])*(a - b*Cos[e + f*x]*Sqrt[Sec[e + f*x]^2]*Sin[e + f*x]))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 80/123, g -> 111/38, e -> 108/43, f -> 61/103, a -> 17/7, b -> 103/52}", "IntegrandValue" -> "-0.01199373969431600859275534639603471335495467942132657084370950008673207848057`50.*I", "DerivativeValue" -> "2.73915185952118755148486466852058605934024686478929681126078334536820249442044`50.1275853741459 + 0.91411977495943685237597272214304887772626213627192331338506078347432472923993`49.65097236783352*I", "ResidualValue" -> "2.73915185952118755148486466852058605934024686478929681126078334536820249442044`50.12701136843001 + 0.9261135146537528609687280685390835910812168156932498842287702835610568077205`49.65605947992388*I"|>`


## wrong-derivative: 7 Inverse hyperbolic functions/7.4 Inverse hyperbolic cotangent/7.4.1 Inverse hyperbolic cotangent functions.m/255

- Integrand: `ArcCoth[c + d*Cot[a + b*x]]`
- W15 answer: `x*(ArcCoth[c + d*Cot[a + b*x]] + (2*a*Log[d + (-1 + c)*Tan[a + b*x]] + I*Log[1 + I*Tan[a + b*x]]*Log[((-I)*(d + (-1 + c)*Tan[a + b*x]))/(-1 + c - I*d)] - I*Log[1 - I*Tan[a + b*x]]*Log[(I*(d + (-1 + c)*Tan[a + b*x]))/(-1 + c + I*d)] - 2*a*Log[d + (1 + c)*Tan[a + b*x]] + I*Log[1 - I*Tan[a + b*x]]*Log[(I*(d + (1 + c)*Tan[a + b*x]))/(1 + c + I*d)] - I*Log[1 + I*Tan[a + b*x]]*Log[(d + (1 + c)*Tan[a + b*x])/(I*(1 + c) + d)] - I*PolyLog[2, ((-1 + c)*(1 - I*Tan[a + b*x]))/(-1 + c + I*d)] + I*PolyLog[2, ((1 + c)*(1 - I*Tan[a + b*x]))/(1 + c + I*d)] + I*PolyLog[2, ((-1 + c)*(1 + I*Tan[a + b*x]))/(-1 + c - I*d)] - I*PolyLog[2, ((1 + c)*(1 + I*Tan[a + b*x]))/(1 + c - I*d)])/(4*a - (2*I)*Log[1 - I*Tan[a + b*x]] + (2*I)*Log[1 + I*Tan[a + b*x]]))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 25/18, c -> 85/118, d -> 91/90, a -> 89/54, b -> 73/55}", "IntegrandValue" -> "0.29475122925968337608425027622078120680896218686925879106381691044698979671412`50.", "DerivativeValue" -> "0.3761826274215082188574543169510930529173543116655071241850121963157525931223`50.028446741123 + 0``50.575116262410255*I", "ResidualValue" -> "0.08143139816182484277320404073031184610839212479624833312119528586876279640818`50.150514997831976 + 0``51.239723106220374*I"|>`


## wrong-derivative: Hebisch/Hebisch_Problems.m/2167

- Integrand: `(9 - 6*x^2 + x^4 + (9*x + 3*x^3)/E^((3*x)/(-3 + x^2)))/((9*x - 6*x^3 + x^5)/E^((3*x)/(-3 + x^2)) + (9*x - 6*x^3 + x^5)*Log[x])`
- W15 answer: `-(Sqrt[3]*ArcTanh[x/Sqrt[3]]) + Log[1 + E^((3*x)/(-3 + x^2))*Log[x]]`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 1/6}", "IntegrandValue" -> "-11.85850570012446274098727407257197313709934703031532262501970151314776611187587`50.", "DerivativeValue" -> "-13.89606356544021084125804007833666874370254381606080257960088764294076113327654`50.", "ResidualValue" -> "-2.03755786531574810027076600576469560660319678574547995458118612979299502140086`50."|>`


## wrong-derivative: 1 Algebraic functions/1.2 Trinomial products/1.2.1 Quadratic/1.2.1.2 (d+e x)^m (a+b x+c x^2)^p.m/2576

- Integrand: `(d + e*x)^(-2 - 2*p)*(a + b*x + c*x^2)^p`
- W15 answer: `-((((e*(-b + Sqrt[b^2 - 4*a*c] - 2*c*x))/(2*c*d + (-b + Sqrt[b^2 - 4*a*c])*e))^(1 - p)*(d + e*x)^(-1 - 2*p)*(a + x*(b + c*x))^p*(1 - (2*c*(d + e*x))/(2*c*d + (-b + Sqrt[b^2 - 4*a*c])*e))^(2*p)*Hypergeometric2F1[-1 - 2*p, -p, -2*p, (-4*c*Sqrt[b^2 - 4*a*c]*(d + e*x))/((-2*c*d + (b + Sqrt[b^2 - 4*a*c])*e)*(-b + Sqrt[b^2 - 4*a*c] - 2*c*x))])/((e + 2*e*p)*((e*(b + Sqrt[b^2 - 4*a*c] + 2*c*x))/(-2*c*d + (b + Sqrt[b^2 - 4*a*c])*e))^p))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 107/69, d -> 41/72, e -> 61/94, p -> 19/36, a -> 93/64, b -> 43/110, c -> 67/39}", "IntegrandValue" -> "0.65224436735396579393919255425560749106004084911547493995880958029628122739952`50.", "DerivativeValue" -> "-0.64233530982872824712639819834206026478955195928349640880582608198968204251386`50.14386645680192 - 0.11326104578453603729384605442242735004543169531598278519038979503529030236281`49.390185227843595*I", "ResidualValue" -> "-1.29457967718269404106559075259766775584959280839897134876463567013874897011418`50.148859223849485 - 0.11326104578453603729384605442242735004543169531598278519038979503529030236281`49.090811006162106*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/408

- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r))`
- W15 answer: `(b*n*r^2*Log[x]^2 - 2*r*(a + b*Log[c*x^n])*Log[d - d*x^r] + 2*b*n*r*Log[x]*(Log[d - d*x^r] - Log[d + e*x^r]) + 2*b*n*Log[-((e*x^r)/d)]*Log[d + e*x^r] + 2*b*n*PolyLog[2, 1 + (e*x^r)/d])/(2*d*r^2)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 34/95, d -> 69/52, e -> 1/4, r -> 87/77, a -> 51/58, b -> 113/88, c -> 8/31, n -> 55/107}", "IntegrandValue" -> "-3.05865009462745043488749263047446486772620122346129895198611710725542827354312`50.", "DerivativeValue" -> "-2.17435829839033802099218195057135744807629235904221564308123214657562669992072`50.15051499783199 + 0``49.81318388761605*I", "ResidualValue" -> "0.8842917962371124138953106799031074196499088644190833089048849606798015736224`50.15051499783199 + 0``50.20391940184036*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/424

- Integrand: `(a + b*Log[c*x^n])/(x*(d + e*x^r))`
- W15 answer: `(b*n*r^2*Log[x]^2 - 2*r*(a + b*Log[c*x^n])*Log[d - d*x^r] + 2*b*n*r*Log[x]*(Log[d - d*x^r] - Log[d + e*x^r]) + 2*b*n*Log[-((e*x^r)/d)]*Log[d + e*x^r] + 2*b*n*PolyLog[2, 1 + (e*x^r)/d])/(2*d*r^2)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 1/4, d -> 31/100, e -> 32/85, r -> 109/92, a -> 31/59, b -> 48/55, c -> 9/41, n -> 38/103}", "IntegrandValue" -> "-13.0003270272153838441941169110177796669035770686698128785003227950947096123119`50.", "DerivativeValue" -> "-7.13383288270987513263271735232455720425594796622668715224405697712527306666758`50.15051499783199 + 0``49.297192066500386*I", "ResidualValue" -> "5.86649414450550871156139955869322246264762910244312572625626581796943616507334`50.15051499783199 + 0``49.382136356304144*I"|>`


## wrong-derivative: 3 Logarithms/3.1.4 (f x)^m (d+e x^r)^q (a+b log(c x^n))^p.m/432

- Integrand: `(a + b*Log[c*x^n])^2/(x*(d + e*x^r)^3)`
- W15 answer: `((d^2*r^2*(a + b*Log[c*x^n])^2)/(d + e*x^r)^2 + (2*d*r*(a + b*Log[c*x^n])*(-(b*n) + a*r + b*r*Log[c*x^n]))/(d + e*x^r) - 2*b^2*n^2*Log[d - d*x^r] + 6*a*b*n*r*Log[d - d*x^r] - 2*a^2*r^2*Log[d - d*x^r] + 4*a*b*r^2*(n*Log[x] - Log[c*x^n])*Log[d - d*x^r] + 6*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*Log[d - d*x^r] - 2*b^2*r^2*(-(n*Log[x]) + Log[c*x^n])^2*Log[d - d*x^r] - 6*b^2*n^2*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 4*a*b*n*r*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) + 4*b^2*n*r*(-(n*Log[x]) + Log[c*x^n])*((r^2*Log[x]^2)/2 + (-(r*Log[x]) + Log[-((e*x^r)/d)])*Log[d + e*x^r] + PolyLog[2, 1 + (e*x^r)/d]) - 2*b^2*n^2*(r^2*Log[x]^2*Log[1 + d/(e*x^r)] - 2*r*Log[x]*PolyLog[2, -(d/(e*x^r))] - 2*PolyLog[3, -(d/(e*x^r))]))/(2*d^3*r^3)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 51/74, d -> 40/109, e -> 15/16, r -> 43/80, a -> 110/67, b -> 88/93, c -> 57/86, n -> 18/53}", "IntegrandValue" -> "1.27563746311273964344952611409489861298012542224114809671523262184492914943954`50.", "DerivativeValue" -> "-38.13347598936527386628999124141545535250458625333612852431451072760595174912858`50.15051499783199 + 0``48.56920860341077*I", "ResidualValue" -> "-39.40911345247801350973951735551035396548471167557727662102974334945088089856811`50.14473078969476 + 0``48.55491833274632*I"|>`


## wrong-derivative: 3 Logarithms/3.1.5 u (a+b log(c x^n))^p.m/152

- Integrand: `(g*x)^(-1 + m)*(a + b*Log[c*x^n])*Log[d*(e + f*x^m)^k]`
- W15 answer: `-(((g*x)^m*(a*f*k*m*x^m - 2*b*f*k*n*x^m + b*e*k*m^2*n*Log[x]^2 + b*f*k*m*x^m*Log[c*x^n] - a*e*k*m*Log[e - e*x^m] + b*e*k*n*Log[e - e*x^m] - b*e*k*m*Log[c*x^n]*Log[e - e*x^m] + b*e*k*n*Log[-((f*x^m)/e)]*Log[e + f*x^m] - e*k*m*Log[x]*(a*m - b*n + b*m*Log[c*x^n] - b*n*Log[e - e*x^m] + b*n*Log[e + f*x^m]) - a*f*m*x^m*Log[d*(e + f*x^m)^k] + b*f*n*x^m*Log[d*(e + f*x^m)^k] - b*f*m*x^m*Log[c*x^n]*Log[d*(e + f*x^m)^k] + b*e*k*n*PolyLog[2, 1 + (f*x^m)/e]))/(f*g*m^2*x^m))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 12/115, g -> 35/54, m -> 111/50, a -> 17/30, b -> 23/79, c -> 17/92, n -> 69/101, d -> 92/91, e -> 109/82, f -> 40/77, k -> 53/114}", "IntegrandValue" -> "-0.00202271914515079677218165343254885300161234120096873159741364998073296557676`50.", "DerivativeValue" -> "-0.09876520946415234043139813813968767936210173403034767439710777930398552727985`50.15051499783199 + 0``51.15591100869576*I", "ResidualValue" -> "-0.09674249031900154365921648470713882636048939282937894279969412932325256170309`50.15051499783199 + 0``51.164897735144656*I"|>`


## wrong-derivative: 3 Logarithms/3.4 u (a+b log(c (d+e x^m)^n))^p.m/168

- Integrand: `(f*x)^(-1 - 2*n)*Log[c*(d + e*x^n)^p]^2`
- W15 answer: `(e^2*n^2*p^2*x^(2*n)*Log[x]^2 + e^2*p^2*x^(2*n)*Log[e + d/x^n]^2 - 2*e^2*p^2*x^(2*n)*Log[e - e/x^n] - 2*e^2*p^2*x^(2*n)*Log[e + d/x^n]*Log[e - e/x^n] - 2*d*e*p*x^n*Log[c*(d + e*x^n)^p] + 2*e^2*p*x^(2*n)*Log[e - e/x^n]*Log[c*(d + e*x^n)^p] - d^2*Log[c*(d + e*x^n)^p]^2 + 2*e^2*n*p*x^(2*n)*Log[x]*(p + p*Log[e + d/x^n] - p*Log[e - e/x^n] - Log[c*(d + e*x^n)^p] + p*Log[1 + (e*x^n)/d]) + 2*e^2*p^2*x^(2*n)*PolyLog[2, -((e*x^n)/d)])/(2*d^2*f*n*(f*x)^(2*n))`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 10/7, f -> 4/3, n -> 95/99, c -> 74/115, d -> 37/93, e -> 109/92, p -> 76/43}", "IntegrandValue" -> "0.10801295179674820277239786825848697276865198867634447564434095003513957892566`50.", "DerivativeValue" -> "-17.07867054499053277407691925244532011020132422325887400358837402182813438847629`50.", "ResidualValue" -> "-17.18668349678728097684931712070380708296997621193521847923271497186327396740195`50."|>`


## wrong-derivative: 3 Logarithms/3.4 u (a+b log(c (d+e x^m)^n))^p.m/376

- Integrand: `Log[c*(d + e*x^n)^p]/(x*(f + g/x^n)^2)`
- W15 answer: `(g*p*Log[f - f/x^n] + f*p*x^n*Log[f - f/x^n] - g*n*p*Log[x]*Log[f - f/x^n] - f*n*p*x^n*Log[x]*Log[f - f/x^n] - p*Log[e + d/x^n]*(-(f*x^n) + (g + f*x^n)*Log[f - f/x^n]) - f*x^n*Log[c*(d + e*x^n)^p] + g*Log[f - f/x^n]*Log[c*(d + e*x^n)^p] + f*x^n*Log[f - f/x^n]*Log[c*(d + e*x^n)^p] + g*n*p*Log[x]*Log[1 + (f*x^n)/g] + f*n*p*x^n*Log[x]*Log[1 + (f*x^n)/g] + p*(g + f*x^n)*PolyLog[2, -((f*x^n)/g)])/(f^2*n*(g + f*x^n)) - (p*(-((d*f*Log[e + d/x^n])/(d*f - e*g)) + (f*x^n*Log[e + d/x^n])/(g + f*x^n) + Log[-(d/(e*x^n))]*Log[e + d/x^n] + (d*f*Log[f + g/x^n])/(d*f - e*g) - Log[e + d/x^n]*Log[(d*(f + g/x^n))/(d*f - e*g)] - PolyLog[2, -((g*(e + d/x^n))/(d*f - e*g))] + PolyLog[2, 1 + d/(e*x^n)]))/(f^2*n)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 37/20, f -> 33/34, g -> 101/77, n -> 27/34, c -> 21/43, d -> 29/38, e -> 49/54, p -> 81/43}", "IntegrandValue" -> "0.1379389012483997997433642126545065056128409591039613754387768611037103085387`50.", "DerivativeValue" -> "0.83490901732020629380466989762136471760094637148509983795397205530052039546806`50.014156525340496 + 0``50.22887584621503*I", "ResidualValue" -> "0.69697011607180649406130568496685821198810541238113846251519519419681008692936`50.15051499783199 + 0``50.30730084054222*I"|>`


## wrong-derivative: 4 Trig functions/4.5 Secant/4.5.1.4 (d tan)^n (a+b sec)^m.m/120

- Integrand: `(e*Tan[c + d*x])^(7/2)/(a + a*Sec[c + d*x])`
- W15 answer: `(e^3*Cos[(c + d*x)/2]^2*Sec[c + d*x]*(1 + Sqrt[Sec[c + d*x]^2])*(-2*Sqrt[2]*ArcTan[1 - Sqrt[2]*Sqrt[Tan[c + d*x]]] + 2*Sqrt[2]*ArcTan[1 + Sqrt[2]*Sqrt[Tan[c + d*x]]] - Sqrt[2]*Log[1 - Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]] + Sqrt[2]*Log[1 + Sqrt[2]*Sqrt[Tan[c + d*x]] + Tan[c + d*x]] - 8*Sqrt[Tan[c + d*x]] + 8*Hypergeometric2F1[-1/2, 1/4, 5/4, -Tan[c + d*x]^2]*Sqrt[Tan[c + d*x]] - 8*Hypergeometric2F1[1/4, 1/2, 5/4, -Tan[c + d*x]^2]*Sqrt[Tan[c + d*x]])*Sqrt[e*Tan[c + d*x]])/(2*a*d*(1 + Sec[c + d*x])^2*Sqrt[Tan[c + d*x]])`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 55/97, a -> 27/119, c -> 101/100, d -> 1, e -> 15/19}", "IntegrandValue" -> "636978.3619739194674395226683884868563294565817804363159024555871`50.*I", "DerivativeValue" -> "0``44.3499610983897 + 631762.5812457549872870575980972386267420654260754199223042686943`50.15051499783199*I", "ResidualValue" -> "0``46.433195672498826 - 5215.7807281644801524650702912482295873911557050163935981868836`50.15051499783199*I"|>`


## wrong-derivative: 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/464

- Integrand: `(a + b*(c*Sec[e + f*x])^n)^p*Tan[e + f*x]^5`
- W15 answer: `((a + b*(c*Sec[e + f*x])^n)^p*(-4*a*n*(1 + p)*Hypergeometric2F1[2/n, -p, (2 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^2 + a*n*(1 + p)*Hypergeometric2F1[4/n, -p, (4 + n)/n, -((b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)]*Sec[e + f*x]^4 - 4*Hypergeometric2F1[1, 1 + p, 2 + p, 1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a]*(a + b*(c*Sqrt[Sec[e + f*x]^2])^n)*(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p))/(4*a*f*n*(1 + p)*(1 + (b*(c*Sqrt[Sec[e + f*x]^2])^n)/a)^p)`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 51/50, a -> 46/93, b -> 37/49, c -> 16/71, e -> 28/23, f -> 76/107, n -> 103/95, p -> 83/80}", "IntegrandValue" -> "-5.66847594849409431186273311730778692847200685580575026311095653753990269291758`49.76660323630491 + 12.49510105561264823135988437983285007751090867522970001370493769688104881439076`50.10987670093708*I", "DerivativeValue" -> "3.56658504063842421412828461355963602453126434941305563146005262059919925228925`49.50933318287549 + 15.19825373225320056723804896041503629873211001505217766991929494794486562111777`50.13887428990833*I", "ResidualValue" -> "9.23506098913251852599101773086742295300327120521880589471134575414025970286012`50.132664783109504 + 2.70315267664055233587816458058218622122120133982247765590447197999278232775582`49.59909559096377*I"|>`


## wrong-derivative: 7 Inverse hyperbolic functions/7.2 Inverse hyperbolic cosine/7.2.4a (f x)^m (d-c^2 d x^2)^p (a+b arccosh(c x))^n.m/208

- Integrand: `(a + b*ArcCosh[c*x])^2/(x^2*(d - c^2*d*x^2)^(3/2))`
- W15 answer: `(2*a*b*(-1 + 2*c^2*x^2)*ArcCosh[c*x] + b^2*ArcCosh[c*x]^2 + a*(-a + 2*a*c^2*x^2 - 2*b*c*x*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*Log[c*x] - b*c*x*Sqrt[-1 + c*x]*Sqrt[1 + c*x]*Log[1 - c^2*x^2]))/(d*x*Sqrt[d - c^2*d*x^2])`
- Reason: scaled derivative residual exceeds 10^-20 at two or more continuous samples
- 50-digit evidence: `<|"Type" -> "derivative-residual", "Point" -> "{x -> 56/51, d -> 34/61, c -> 22/63, a -> 11/19, b -> 83/101}", "IntegrandValue" -> "-1.52010455658905083164183800834847167544972133306071481000330200799477069547953`49.82504732686168 + 2.83427827095757822833656164203985351242982975146226843668437335197349452014565`50.095616353299484*I", "DerivativeValue" -> "3.94453201492515996947853873309801117235977961606026007374267345956160925560064`50.06012381294353 + 2.83427827095757822833656164203985351242982975146226843668437335197349452014792`49.916570814946766*I", "ResidualValue" -> "5.46463657151421080112037674144648284780950094912097488374597546755637995108017`50.15051499783199 + 0``49.41295371356535*I"|>`
