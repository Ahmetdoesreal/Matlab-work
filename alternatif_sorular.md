# Signals and Systems — Alternatif Exam Questions

## Question 1: (25 Points)

Answer the following questions for signal

$$
x(t)=3\cos(\omega_0 t)-4\sin(\omega_0 t).
$$

**(a)** Find the complex Fourier series coefficients $C_n$'s of the signal $x(t)$.

**(b)** Plot amplitude $(|C_n|)$ and phase $(\theta_n)$ spectrum of the signal.

**(c)** Find the power of the signal using Parseval’s Theorem.

---

## Question 2: (25 Points)

Consider the system shown in the figure below with input $x[n]$ and output $y[n]$. This system is formed by the series interconnection of two LTI systems with the impulse responses

$$
h_1[n]=\delta[n]-\delta[n-2]
$$

and

$$
h_2[n]=u[n].
$$

$$
x[n] \longrightarrow h_1[n] \longrightarrow h_2[n] \longrightarrow y[n]
$$

**(a)** Find the overall system impulse response $h[n]$.

**(b)** Find and plot the output $y[n]$ if the input $x[n]=u[n-1]$ and determine $y[3]$.

**(c)** Specify properties of the system, causality and stability, by indicating corresponding reasons.

---

## Question 3: (10 Points)

$$
x(t)=
\begin{cases}
\sin(2\pi t), & 0\leq t\leq 1 \\
0, & \text{otherwise}
\end{cases}
$$

**(a)** Determine the Nyquist frequency, $f_s$, of the signal $x(t)$.

**(b)** Obtain and plot the discrete time signal, $x[n]$, when we take samples with a sampling period of

$$
T_s=\frac{1}{4}\text{ s}.
$$

Given values:

$$
\sin(0)=0,\quad
\sin\left(\frac{\pi}{2}\right)=1,\quad
\sin(\pi)=0,\quad
\sin\left(\frac{3\pi}{2}\right)=-1,\quad
\sin(2\pi)=0.
$$

---

## Question 4: (20 Points)

For the signal

$$
x[n]=\delta[n+2]+3\delta[n]+\delta[n-2],
$$

**(a)** Find Discrete Time Fourier Transform (DTFT) of the signal $x[n]$. $(X(\Omega)=?)$

**(b)** Evaluate $X(\Omega)$ at $\Omega=0$.

---

## Question 5: (20 Points)

Consider the signal

$$
x(t)=e^{-2t}u(t).
$$

**(a)** Find the Fourier transform of $x(t)$. $(X(\omega)=?)$

**(b)** Plot amplitude $(|X(\omega)|)$ and phase $(\theta_x(\omega))$ spectrum of the signal.
