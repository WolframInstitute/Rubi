# Secant branch-cut check

Safe real samples use |x| < 1, e=0, f=1, a=2, b=c=1, n=1/2 and p=1/3, so Sec[x] > 0 and a + b (c Sec[x])^n > 0.

## 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/465

- Optimal, original samples: `false-alarm`
- Optimal, safe samples: `false-alarm` -derivative and answer-minus-reference constant agree at all continuous samples
- W15, safe samples: `false-alarm` -derivative and answer-minus-reference constant agree at all continuous samples
- Rubi, safe samples: `wrong-derivative` -scaled derivative residual exceeds 10^-20 at two or more continuous samples


## 4 Trig functions/4.5 Secant/4.5.7 (d trig)^m (a+b (c sec)^n)^p.m/464

- Optimal, original samples: `false-alarm`
- Optimal, safe samples: `false-alarm` -derivative and answer-minus-reference constant agree at all continuous samples
- W15, safe samples: `false-alarm` -derivative and answer-minus-reference constant agree at all continuous samples
- Rubi, safe samples: `wrong-derivative` -scaled derivative residual exceeds 10^-20 at two or more continuous samples
