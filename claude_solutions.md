# Signals and Systems — Full Exam Solutions

---

## Question 1 (25 Points)

$$x(t) = 2\sin(\omega_0 t) + \cos(\omega_0 t)$$

### (a) Complex Fourier Series Coefficients $C_n$

The signal $x(t)$ is periodic with fundamental frequency $\omega_0$. We express each sinusoid in terms of complex exponentials using Euler's formulas:

$$\sin(\omega_0 t) = \frac{e^{j\omega_0 t} - e^{-j\omega_0 t}}{2j}, \qquad \cos(\omega_0 t) = \frac{e^{j\omega_0 t} + e^{-j\omega_0 t}}{2}$$

Substituting:

$$x(t) = 2 \cdot \frac{e^{j\omega_0 t} - e^{-j\omega_0 t}}{2j} + \frac{e^{j\omega_0 t} + e^{-j\omega_0 t}}{2}$$

$$= \frac{1}{j} e^{j\omega_0 t} - \frac{1}{j} e^{-j\omega_0 t} + \frac{1}{2} e^{j\omega_0 t} + \frac{1}{2} e^{-j\omega_0 t}$$

$$= \left(\frac{1}{j} + \frac{1}{2}\right)e^{j\omega_0 t} + \left(-\frac{1}{j} + \frac{1}{2}\right)e^{-j\omega_0 t}$$

Note: $\frac{1}{j} = \frac{j^*}{j \cdot j^*} = \frac{j}{-1} \cdot (-1) = -j$. So $\frac{1}{j} = -j$.

$$x(t) = \left(\frac{1}{2} - j\right)e^{j\omega_0 t} + \left(\frac{1}{2} + j\right)e^{-j\omega_0 t}$$

Reading off the Fourier series $x(t) = \sum_n C_n e^{jn\omega_0 t}$:

$$\boxed{C_1 = \frac{1}{2} - j, \qquad C_{-1} = \frac{1}{2} + j, \qquad C_n = 0 \text{ for all other } n}$$

> **Note:** $C_{-1} = C_1^*$, as expected for a real-valued signal.

---

### (b) Amplitude and Phase Spectrum

**Amplitude $|C_n|$:**

$$|C_1| = |C_{-1}| = \left|\frac{1}{2} - j\right| = \sqrt{\left(\frac{1}{2}\right)^2 + (-1)^2} = \sqrt{\frac{1}{4} + 1} = \sqrt{\frac{5}{4}} = \frac{\sqrt{5}}{2} \approx 1.118$$

**Phase $\theta_n = \angle C_n$:**

$$\theta_1 = \angle C_1 = \angle\!\left(\frac{1}{2} - j\right) = \arctan\!\left(\frac{-1}{1/2}\right) = \arctan(-2) \approx -63.43°$$

$$\theta_{-1} = \angle C_{-1} = \angle\!\left(\frac{1}{2} + j\right) = \arctan\!\left(\frac{1}{1/2}\right) = \arctan(2) \approx +63.43°$$

**Amplitude Spectrum $|C_n|$:**

```
|Cn|
 ^
 |   √5/2         √5/2
 |    |             |
 |    |             |
 +----+------+------+----> n
       -1     0     1
```

- Spike of height $\dfrac{\sqrt{5}}{2}$ at $n = -1$ and $n = 1$
- Zero elsewhere

**Phase Spectrum $\theta_n$:**

```
θn (degrees)
  ^
+63.43° |    o
        |         
--------|------+------+----> n
   -1   |   0     1
        |              
-63.43° |              o
```

- $\theta_{-1} = +63.43°$, $\theta_1 = -63.43°$

---

### (c) Power via Parseval's Theorem

Parseval's theorem for the Fourier series states:

$$P = \sum_{n=-\infty}^{\infty} |C_n|^2$$

Since only $C_1$ and $C_{-1}$ are nonzero:

$$P = |C_1|^2 + |C_{-1}|^2 = \frac{5}{4} + \frac{5}{4} = \frac{10}{4}$$

$$\boxed{P = \frac{5}{2} = 2.5 \text{ W}}$$

> **Verification (time domain):** $P = \frac{1}{T_0}\int_0^{T_0} |x(t)|^2\,dt$. Using the orthogonality of sinusoids:
> $P = \frac{(2)^2}{2} + \frac{(1)^2}{2} = 2 + 0.5 = 2.5$ ✓

---

## Question 2 (25 Points)

$$h_1[n] = \delta[n] - \delta[n-3], \qquad h_2[n] = u[n-1]$$

$$x[n] \longrightarrow h_1[n] \longrightarrow h_2[n] \longrightarrow y[n]$$

### (a) Overall Impulse Response $h[n]$

For systems in series, the overall impulse response is the convolution of the individual responses:

$$h[n] = h_1[n] * h_2[n]$$

Using the distributive property of convolution:

$$h[n] = (\delta[n] - \delta[n-3]) * u[n-1]$$

$$= \delta[n] * u[n-1] - \delta[n-3] * u[n-1]$$

$$= u[n-1] - u[n-4]$$

This is because $\delta[n-k]*f[n] = f[n-k]$.

$$\boxed{h[n] = u[n-1] - u[n-4]}$$

**Expanded form** (writing out what the unit step functions give):

$$h[n] = \begin{cases} 1 & n = 1, 2, 3 \\ 0 & \text{otherwise} \end{cases}$$

So $h[n]$ is a finite-duration rectangular pulse of length 3, starting at $n=1$.

---

### (b) Output $y[n]$ for input $x[n] = u[n]$, and value of $y[4]$

$$y[n] = x[n] * h[n] = u[n] * (u[n-1] - u[n-4])$$

Using the distributive property:

$$y[n] = u[n]*u[n-1] - u[n]*u[n-4]$$

Recall the useful identity: $u[n]*u[n] = (n+1)\,u[n]$, so $u[n]*u[n-k] = (n-k+1)\,u[n-k]$.

Therefore:

$$u[n]*u[n-1] = (n-1+1)\,u[n-1] = n\,u[n-1]$$

$$u[n]*u[n-4] = (n-4+1)\,u[n-4] = (n-3)\,u[n-4]$$

$$\boxed{y[n] = n\,u[n-1] - (n-3)\,u[n-4]}$$

**Evaluating region by region:**

| $n$ | $u[n-1]$ | $u[n-4]$ | $y[n] = n\,u[n-1] - (n-3)\,u[n-4]$ |
|-----|-----------|-----------|--------------------------------------|
| $n \le 0$ | 0 | 0 | 0 |
| $n = 1$ | 1 | 0 | $1$ |
| $n = 2$ | 1 | 0 | $2$ |
| $n = 3$ | 1 | 0 | $3$ |
| $n \ge 4$ | 1 | 1 | $n - (n-3) = 3$ |

So the output reaches a steady value of **3** for all $n \ge 4$.

$$\boxed{y[4] = 3}$$

**Plot of $y[n]$:**

```
y[n]
  ^
3 |                  * * * * * ...
  |              *
2 |          *
  |      *
1 |
  +--*---+---+---+---+---+----> n
    0   1   2   3   4   5   6
```

(Zero for $n \le 0$, ramps up as $y[n]=n$ for $1 \le n \le 3$, then constant at 3 for $n \ge 4$.)

---

### (c) Causality and Stability

**Causality:**

A system is **causal** if $h[n] = 0$ for all $n < 0$.

$$h[n] = u[n-1] - u[n-4] = \begin{cases} 1 & n = 1,2,3 \\ 0 & \text{otherwise} \end{cases}$$

Since $h[n] = 0$ for all $n < 0$, the system is **causal**. The output depends only on present and past inputs.

**Stability (BIBO):**

A system is **BIBO stable** if $\sum_{n=-\infty}^{\infty} |h[n]| < \infty$.

$$\sum_{n=-\infty}^{\infty} |h[n]| = |h[1]| + |h[2]| + |h[3]| = 1 + 1 + 1 = 3 < \infty$$

The system is **BIBO stable**. (The impulse response is finite in duration and bounded, so the sum of absolute values is finite.)

---

## Question 3 (10 Points)

$$x(t) = \begin{cases} \cos(\pi t), & -1 \le t \le 1 \\ 0, & \text{otherwise} \end{cases}$$

### (a) Nyquist Frequency $f_s$

The signal $x(t)$ within its support is $\cos(\pi t)$. We identify the highest frequency component:

$$\cos(\pi t) = \cos(2\pi f_{\max} t) \implies 2\pi f_{\max} = \pi \implies f_{\max} = \frac{1}{2} \text{ Hz}$$

The **Nyquist sampling theorem** requires:

$$f_s \ge 2 f_{\max}$$

$$\boxed{f_s = 2 \times \frac{1}{2} = 1 \text{ Hz}}$$

The minimum required sampling frequency (Nyquist rate) is **1 Hz**, corresponding to a maximum sampling period of $T_s = 1$ s.

---

### (b) Discrete-Time Signal $x[n]$ for $T_s = \frac{1}{3}$ s

Sampling $x(t)$ at $t = nT_s = \frac{n}{3}$:

$$x[n] = x\!\left(\frac{n}{3}\right) = \cos\!\left(\frac{\pi n}{3}\right), \quad \text{for } -1 \le \frac{n}{3} \le 1 \implies -3 \le n \le 3$$

So $x[n] = 0$ for $|n| > 3$.

Computing each sample using the given values:

| $n$ | $t = n/3$ | $\cos(\pi n/3)$ | $x[n]$ |
|-----|-----------|-----------------|---------|
| $-3$ | $-1$ | $\cos(-\pi) = \cos(\pi) = -1$ | $-1$ |
| $-2$ | $-2/3$ | $\cos(-2\pi/3) = \cos(2\pi/3) = -1/2$ | $-1/2$ |
| $-1$ | $-1/3$ | $\cos(-\pi/3) = \cos(\pi/3) = 1/2$ | $1/2$ |
| $0$ | $0$ | $\cos(0) = 1$ | $1$ |
| $1$ | $1/3$ | $\cos(\pi/3) = 1/2$ | $1/2$ |
| $2$ | $2/3$ | $\cos(2\pi/3) = -1/2$ | $-1/2$ |
| $3$ | $1$ | $\cos(\pi) = -1$ | $-1$ |

$$\boxed{x[n] = \cos\!\left(\frac{\pi n}{3}\right), \quad n = -3,-2,-1,0,1,2,3; \quad x[n]=0 \text{ otherwise}}$$

**Plot of $x[n]$:**

```
x[n]
  ^
1 |                  *
  |
1/2 |          *               *
  |
  +---*---+---+---+---+---*---+---> n
     -3  -2  -1   0   1   2   3
  |
-1/2|      *               *
  |
-1 |  *                           *
```

(Symmetric about $n=0$, shaped like a sampled cosine.)

---

## Question 4 (20 Points)

$$x[n] = 2\delta[n+1] + \delta[n] + 2\delta[n-1]$$

### (a) DTFT $X(\Omega)$

The Discrete-Time Fourier Transform is defined as:

$$X(\Omega) = \sum_{n=-\infty}^{\infty} x[n]\, e^{-j\Omega n}$$

Applying the **shift property**: $\delta[n-k] \xrightarrow{\text{DTFT}} e^{-j\Omega k}$

$$X(\Omega) = 2e^{-j\Omega(-1)} + 1 \cdot e^{-j\Omega \cdot 0} + 2e^{-j\Omega(1)}$$

$$= 2e^{j\Omega} + 1 + 2e^{-j\Omega}$$

Using Euler's formula: $e^{j\Omega} + e^{-j\Omega} = 2\cos(\Omega)$

$$\boxed{X(\Omega) = 1 + 4\cos(\Omega)}$$

This is a **real-valued** function of $\Omega$, which makes sense because $x[n]$ is real and **even** (symmetric: $x[-n] = x[n]$).

---

### (b) Evaluate $X(\Omega)$ at $\Omega = 0$

$$X(0) = 1 + 4\cos(0) = 1 + 4(1) = 1 + 4$$

$$\boxed{X(0) = 5}$$

> **Intuition:** $X(0) = \sum_n x[n] = 2 + 1 + 2 = 5$. This is always the sum of all sample values.

---

## Question 5 (20 Points)

$$x(t) = e^{-3t}\,u(t)$$

### (a) Fourier Transform $X(\omega)$

The Fourier Transform is:

$$X(\omega) = \int_{-\infty}^{\infty} x(t)\, e^{-j\omega t}\, dt$$

Since $u(t) = 1$ for $t \ge 0$ and $0$ for $t < 0$:

$$X(\omega) = \int_0^{\infty} e^{-3t}\, e^{-j\omega t}\, dt = \int_0^{\infty} e^{-(3+j\omega)t}\, dt$$

$$= \left[\frac{e^{-(3+j\omega)t}}{-(3+j\omega)}\right]_0^{\infty}$$

As $t \to \infty$: $|e^{-(3+j\omega)t}| = e^{-3t} \to 0$ (since $3 > 0$).

At $t = 0$: $e^0 = 1$.

$$X(\omega) = 0 - \frac{1}{-(3+j\omega)} = \frac{1}{3+j\omega}$$

$$\boxed{X(\omega) = \frac{1}{3 + j\omega}}$$

---

### (b) Amplitude and Phase Spectrum

**Expressing $X(\omega)$ in polar form:**

Write $3 + j\omega = re^{j\theta}$ where $r = \sqrt{9+\omega^2}$ and $\theta = \arctan(\omega/3)$.

So:

$$X(\omega) = \frac{1}{\sqrt{9+\omega^2}}\, e^{-j\arctan(\omega/3)}$$

**Amplitude Spectrum:**

$$\boxed{|X(\omega)| = \frac{1}{\sqrt{9+\omega^2}}}$$

| $\omega$ | $\|X(\omega)\|$ |
|----------|-----------------|
| $0$ | $1/3 \approx 0.333$ |
| $\pm 3$ | $1/\sqrt{18} \approx 0.236$ |
| $\pm \infty$ | $0$ |

The amplitude spectrum is **even** and **monotonically decreasing** from $1/3$ at $\omega=0$ to $0$ as $|\omega| \to \infty$. This is a **Lorentzian** (low-pass) shape.

**Amplitude Spectrum Sketch:**

```
|X(ω)|
  ^
1/3 |    *
    |   / \
1/√18|  /   \
    | /     \
    |/         \___________
    +----+----+----+----+---> ω
        -3    0    3
```

**Phase Spectrum:**

$$\boxed{\theta_x(\omega) = -\arctan\!\left(\frac{\omega}{3}\right)}$$

| $\omega$ | $\theta_x(\omega)$ |
|----------|--------------------|
| $-\infty$ | $+\pi/2 = +90°$ |
| $-3$ | $+\pi/4 = +45°$ |
| $0$ | $0°$ |
| $+3$ | $-\pi/4 = -45°$ |
| $+\infty$ | $-\pi/2 = -90°$ |

**Phase Spectrum Sketch:**

```
θx(ω) (radians)
  ^
+π/2 |*
     | \
+π/4 |   *
     |    \
   0 |-----*---------> ω
     |      \
-π/4 |       *
     |        \
-π/2 |         *
         -3  0  3
```

The phase is **odd** (antisymmetric), as expected for a real signal.

---

## Summary Table

| Question | Key Result |
|----------|------------|
| **1a** | $C_1 = \tfrac{1}{2}-j$, $C_{-1} = \tfrac{1}{2}+j$ |
| **1c** | $P = \tfrac{5}{2} = 2.5\text{ W}$ |
| **2a** | $h[n] = u[n-1]-u[n-4]$ (pulse of height 1, $n=1,2,3$) |
| **2b** | $y[4] = 3$ |
| **2c** | Causal ✓, BIBO Stable ✓ |
| **3a** | $f_s = 1\text{ Hz}$ |
| **4a** | $X(\Omega) = 1 + 4\cos(\Omega)$ |
| **4b** | $X(0) = 5$ |
| **5a** | $X(\omega) = \dfrac{1}{3+j\omega}$ |
