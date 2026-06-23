# Signals and Systems — Çözümler

## Question 1

Verilen sinyal:

$$
x(t)=2\sin(\omega_0t)+\cos(\omega_0t)
$$

Kompleks Fourier serisi formu:

$$
x(t)=\sum_{n=-\infty}^{\infty} C_n e^{jn\omega_0t}
$$

Sinüs ve kosinüsün üstel açılımları:

$$
\cos(\omega_0t)=\frac{e^{j\omega_0t}+e^{-j\omega_0t}}{2}
$$

$$
\sin(\omega_0t)=\frac{e^{j\omega_0t}-e^{-j\omega_0t}}{2j}
$$

Buna göre:

$$
2\sin(\omega_0t)=-je^{j\omega_0t}+je^{-j\omega_0t}
$$

ve

$$
\cos(\omega_0t)=\frac12 e^{j\omega_0t}+\frac12 e^{-j\omega_0t}
$$

Toplayınca:

$$
x(t)=\left(\frac12-j\right)e^{j\omega_0t}+\left(\frac12+j\right)e^{-j\omega_0t}
$$

### (a) Fourier serisi katsayıları

$$
C_1=\frac12-j
$$

$$
C_{-1}=\frac12+j
$$

$$
C_n=0,\quad n\neq \pm 1
$$

### (b) Genlik ve faz spektrumu

Genlikler:

$$
|C_1|=|C_{-1}|=\sqrt{\left(\frac12\right)^2+1^2}
$$

$$
|C_1|=|C_{-1}|=\frac{\sqrt5}{2}
$$

Fazlar:

$$
\theta_1=-\tan^{-1}(2)
$$

$$
\theta_{-1}=\tan^{-1}(2)
$$

Yani:

$$
|C_n|=
\begin{cases}
\frac{\sqrt5}{2}, & n=\pm1 \\
0, & \text{otherwise}
\end{cases}
$$

$$
\theta_n=
\begin{cases}
-\tan^{-1}(2), & n=1 \\
\tan^{-1}(2), & n=-1
\end{cases}
$$

### (c) Parseval ile güç

Parseval teoremine göre:

$$
P=\sum_{n=-\infty}^{\infty}|C_n|^2
$$

Sadece $n=1$ ve $n=-1$ için katsayı vardır:

$$
P=|C_1|^2+|C_{-1}|^2
$$

$$
P=\left(\frac{\sqrt5}{2}\right)^2+\left(\frac{\sqrt5}{2}\right)^2
$$

$$
P=\frac54+\frac54
$$

$$
\boxed{P=\frac52}
$$

---

## Question 2

Verilen sistem:

$$
h_1[n]=\delta[n]-\delta[n-3]
$$

$$
h_2[n]=u[n-1]
$$

Sistemler seri bağlı olduğu için toplam dürtü cevabı konvolüsyondur:

$$
h[n]=h_1[n]*h_2[n]
$$

### (a) Overall impulse response

$$
h[n]=(\delta[n]-\delta[n-3])*u[n-1]
$$

Konvolüsyon özellikleri:

$$
\delta[n]*x[n]=x[n]
$$

$$
\delta[n-k]*x[n]=x[n-k]
$$

Bu nedenle:

$$
h[n]=u[n-1]-u[n-4]
$$

Sonuç:

$$
\boxed{h[n]=u[n-1]-u[n-4]}
$$

Bu sinyal şu değerlere sahiptir:

$$
h[n]=
\begin{cases}
1, & 1\leq n\leq 3 \\
0, & \text{otherwise}
\end{cases}
$$

Yani eşdeğer olarak:

$$
h[n]=\delta[n-1]+\delta[n-2]+\delta[n-3]
$$

### (b) $x[n]=u[n]$ için $y[n]$

Çıkış:

$$
y[n]=x[n]*h[n]
$$

$$
y[n]=u[n]*(\delta[n-1]+\delta[n-2]+\delta[n-3])
$$

Dolayısıyla:

$$
y[n]=u[n-1]+u[n-2]+u[n-3]
$$

Sonuç:

$$
\boxed{y[n]=u[n-1]+u[n-2]+u[n-3]}
$$

Parçalı ifade:

$$
y[n]=
\begin{cases}
0, & n<1 \\
1, & n=1 \\
2, & n=2 \\
3, & n\geq 3
\end{cases}
$$

$y[4]$:

$$
y[4]=u[3]+u[2]+u[1]
$$

$$
y[4]=1+1+1
$$

$$
\boxed{y[4]=3}
$$

### (c) Nedensellik ve kararlılık

#### Causality

Bir LTI sistemin nedensel olması için:

$$
h[n]=0,\quad n<0
$$

Burada:

$$
h[n]=u[n-1]-u[n-4]
$$

Sinyal yalnızca $1\leq n\leq 3$ aralığında sıfırdan farklıdır. Bu nedenle $n<0$ için sıfırdır.

$$
\boxed{\text{Sistem nedenseldir.}}
$$

#### Stability

Bir LTI sistemin BIBO kararlı olması için:

$$
\sum_{n=-\infty}^{\infty}|h[n]|<\infty
$$

Burada:

$$
h[n]=\delta[n-1]+\delta[n-2]+\delta[n-3]
$$

Dolayısıyla:

$$
\sum |h[n]|=1+1+1=3
$$

Bu sonlu olduğu için:

$$
\boxed{\text{Sistem kararlıdır.}}
$$

---

## Question 3

Verilen sinyal:

$$
x(t)=
\begin{cases}
\cos(\pi t), & -1\leq t\leq 1 \\
0, & \text{otherwise}
\end{cases}
$$

### (a) Nyquist frekansı

Kosinüsün genel formu:

$$
\cos(2\pi f_0t)
$$

Verilen sinyalde:

$$
\cos(\pi t)
$$

Bu yüzden:

$$
2\pi f_0=\pi
$$

$$
f_0=\frac12\text{ Hz}
$$

Nyquist örnekleme frekansı:

$$
f_s\geq 2f_0
$$

$$
f_s\geq 2\cdot\frac12
$$

$$
\boxed{f_s=1\text{ Hz}}
$$

Not: Sinyal zamanla sınırlı olduğu için teorik Fourier dönüşümü sonsuz banda yayılır. Fakat bu tip sınav sorusunda genellikle kosinüsün frekansı esas alınır.

### (b) $T_s=\frac13$ için örneklenmiş sinyal

Örnekleme:

$$
x[n]=x(nT_s)
$$

$$
T_s=\frac13
$$

$$
x[n]=x\left(\frac n3\right)
$$

Sinyal yalnızca $-1\leq t\leq 1$ aralığında sıfırdan farklıdır:

$$
-1\leq \frac n3\leq 1
$$

$$
-3\leq n\leq 3
$$

Bu nedenle:

$$
x[n]=
\begin{cases}
\cos\left(\frac{\pi n}{3}\right), & -3\leq n\leq 3 \\
0, & \text{otherwise}
\end{cases}
$$

Değerler:

| $n$ | $x[n]$ |
|---:|---:|
| $-3$ | $-1$ |
| $-2$ | $-\frac12$ |
| $-1$ | $\frac12$ |
| $0$ | $1$ |
| $1$ | $\frac12$ |
| $2$ | $-\frac12$ |
| $3$ | $-1$ |

Sonuç:

$$
\boxed{
x[n]=
\begin{cases}
\cos\left(\frac{\pi n}{3}\right), & -3\leq n\leq 3 \\
0, & \text{otherwise}
\end{cases}
}
$$

---

## Question 4

Verilen sinyal:

$$
x[n]=2\delta[n+1]+\delta[n]+2\delta[n-1]
$$

DTFT tanımı:

$$
X(\Omega)=\sum_{n=-\infty}^{\infty}x[n]e^{-j\Omega n}
$$

### (a) DTFT

Sinyalde üç impuls vardır:

- $2\delta[n+1]$: $n=-1$ konumunda
- $\delta[n]$: $n=0$ konumunda
- $2\delta[n-1]$: $n=1$ konumunda

DTFT’ye yazarsak:

$$
X(\Omega)=2e^{-j\Omega(-1)}+1e^{-j\Omega(0)}+2e^{-j\Omega(1)}
$$

$$
X(\Omega)=2e^{j\Omega}+1+2e^{-j\Omega}
$$

$$
X(\Omega)=1+2(e^{j\Omega}+e^{-j\Omega})
$$

$$
e^{j\Omega}+e^{-j\Omega}=2\cos(\Omega)
$$

Sonuç:

$$
\boxed{X(\Omega)=1+4\cos(\Omega)}
$$

### (b) $\Omega=0$ için

$$
X(0)=1+4\cos(0)
$$

$$
X(0)=1+4
$$

$$
\boxed{X(0)=5}
$$

---

## Question 5

Verilen sinyal:

$$
x(t)=e^{-3t}u(t)
$$

### (a) Fourier transform

CTFT tanımı:

$$
X(\omega)=\int_{-\infty}^{\infty}x(t)e^{-j\omega t}\,dt
$$

$u(t)$ nedeniyle sinyal $t\geq 0$ için geçerlidir:

$$
X(\omega)=\int_0^\infty e^{-3t}e^{-j\omega t}\,dt
$$

$$
X(\omega)=\int_0^\infty e^{-(3+j\omega)t}\,dt
$$

$$
X(\omega)=\left[\frac{e^{-(3+j\omega)t}}{-(3+j\omega)}\right]_0^\infty
$$

Üst sınırda ifade sıfıra gider:

$$
X(\omega)=0-\left(-\frac{1}{3+j\omega}\right)
$$

Sonuç:

$$
\boxed{X(\omega)=\frac{1}{3+j\omega}}
$$

### (b) Genlik ve faz spektrumu

$$
X(\omega)=\frac{1}{3+j\omega}
$$

Genlik:

$$
|X(\omega)|=\frac{1}{|3+j\omega|}
$$

$$
|3+j\omega|=\sqrt{3^2+\omega^2}
$$

$$
\boxed{|X(\omega)|=\frac{1}{\sqrt{9+\omega^2}}}
$$

Faz:

$$
\angle X(\omega)=-\angle(3+j\omega)
$$

$$
\angle(3+j\omega)=\tan^{-1}\left(\frac{\omega}{3}\right)
$$

Bu nedenle:

$$
\boxed{\theta_x(\omega)=-\tan^{-1}\left(\frac{\omega}{3}\right)}
$$

---

# Final Answers Summary

$$
\boxed{
Q1:\ C_1=\frac12-j,\quad C_{-1}=\frac12+j,\quad P=\frac52
}
$$

$$
\boxed{
Q2:\ h[n]=u[n-1]-u[n-4],\quad y[n]=u[n-1]+u[n-2]+u[n-3],\quad y[4]=3
}
$$

$$
\boxed{
Q3:\ f_s=1\text{ Hz},\quad x[n]=\cos\left(\frac{\pi n}{3}\right),\ -3\leq n\leq3
}
$$

$$
\boxed{
Q4:\ X(\Omega)=1+4\cos(\Omega),\quad X(0)=5
}
$$

$$
\boxed{
Q5:\ X(\omega)=\frac{1}{3+j\omega},\quad |X(\omega)|=\frac{1}{\sqrt{9+\omega^2}},\quad \theta_x(\omega)=-\tan^{-1}\left(\frac{\omega}{3}\right)
}
$$
