# Signals and Systems — Alternatif Sorular Çözümler

## Question 1

Verilen sinyal:

$$
x(t)=3\cos(\omega_0t)-4\sin(\omega_0t)
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
3\cos(\omega_0t)=\frac32 e^{j\omega_0t}+\frac32 e^{-j\omega_0t}
$$

ve

$$
-4\sin(\omega_0t)=2j e^{j\omega_0t}-2j e^{-j\omega_0t}
$$

Toplayınca:

$$
x(t)=\left(\frac32+2j\right)e^{j\omega_0t}+\left(\frac32-2j\right)e^{-j\omega_0t}
$$

### (a) Fourier serisi katsayıları

$$
C_1=\frac32+2j
$$

$$
C_{-1}=\frac32-2j
$$

$$
C_n=0,\quad n\neq \pm 1
$$

### (b) Genlik ve faz spektrumu

Genlikler:

$$
|C_1|=|C_{-1}|=\sqrt{\left(\frac32\right)^2+2^2}
$$

$$
|C_1|=|C_{-1}|=\frac52
$$

Fazlar:

$$
\theta_1=\tan^{-1}\left(\frac{4}{3}\right)
$$

$$
\theta_{-1}=-\tan^{-1}\left(\frac{4}{3}\right)
$$

Yani:

$$
|C_n|=
\begin{cases}
\frac52, & n=\pm1 \\
0, & \text{otherwise}
\end{cases}
$$

$$
\theta_n=
\begin{cases}
\tan^{-1}\left(\frac43\right), & n=1 \\
-\tan^{-1}\left(\frac43\right), & n=-1
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
P=\left(\frac52\right)^2+\left(\frac52\right)^2
$$

$$
P=\frac{25}{4}+\frac{25}{4}
$$

$$
\boxed{P=\frac{25}{2}}
$$

---

## Question 2

Verilen sistem:

$$
h_1[n]=\delta[n]-\delta[n-2]
$$

$$
h_2[n]=u[n]
$$

Sistemler seri bağlı olduğu için toplam dürtü cevabı konvolüsyondur:

$$
h[n]=h_1[n]*h_2[n]
$$

### (a) Overall impulse response

$$
h[n]=(\delta[n]-\delta[n-2])*u[n]
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
h[n]=u[n]-u[n-2]
$$

Sonuç:

$$
\boxed{h[n]=u[n]-u[n-2]}
$$

Bu sinyal şu değerlere sahiptir:

$$
h[n]=
\begin{cases}
1, & 0\leq n\leq 1 \\
0, & \text{otherwise}
\end{cases}
$$

Yani eşdeğer olarak:

$$
h[n]=\delta[n]+\delta[n-1]
$$

### (b) $x[n]=u[n-1]$ için $y[n]$

Çıkış:

$$
y[n]=x[n]*h[n]
$$

$$
y[n]=u[n-1]*(\delta[n]+\delta[n-1])
$$

Dolayısıyla:

$$
y[n]=u[n-1]+u[n-2]
$$

Sonuç:

$$
\boxed{y[n]=u[n-1]+u[n-2]}
$$

Parçalı ifade:

$$
y[n]=
\begin{cases}
0, & n<1 \\
1, & n=1 \\
2, & n\geq 2
\end{cases}
$$

$y[3]$:

$$
y[3]=u[2]+u[1]
$$

$$
y[3]=1+1
$$

$$
\boxed{y[3]=2}
$$

### (c) Nedensellik ve kararlılık

#### Causality

Bir LTI sistemin nedensel olması için:

$$
h[n]=0,\quad n<0
$$

Burada:

$$
h[n]=u[n]-u[n-2]
$$

Sinyal yalnızca $0\leq n\leq 1$ aralığında sıfırdan farklıdır. Bu nedenle $n<0$ için sıfırdır.

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
h[n]=\delta[n]+\delta[n-1]
$$

Dolayısıyla:

$$
\sum |h[n]|=1+1=2
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
\sin(2\pi t), & 0\leq t\leq 1 \\
0, & \text{otherwise}
\end{cases}
$$

### (a) Nyquist frekansı

Sinüsün genel formu:

$$
\sin(2\pi f_0t)
$$

Verilen sinyalde:

$$
\sin(2\pi t)
$$

Bu yüzden:

$$
2\pi f_0=2\pi
$$

$$
f_0=1\text{ Hz}
$$

Nyquist örnekleme frekansı:

$$
f_s\geq 2f_0
$$

$$
f_s\geq 2\cdot1
$$

$$
\boxed{f_s=2\text{ Hz}}
$$

Not: Sinyal zamanla sınırlı olduğu için teorik Fourier dönüşümü sonsuz banda yayılır. Fakat bu tip sınav sorusunda genellikle sinüsün frekansı esas alınır.

### (b) $T_s=\frac14$ için örneklenmiş sinyal

Örnekleme:

$$
x[n]=x(nT_s)
$$

$$
T_s=\frac14
$$

$$
x[n]=x\left(\frac n4\right)
$$

Sinyal yalnızca $0\leq t\leq 1$ aralığında sıfırdan farklıdır:

$$
0\leq \frac n4\leq 1
$$

$$
0\leq n\leq 4
$$

Bu nedenle:

$$
x[n]=
\begin{cases}
\sin\left(\frac{\pi n}{2}\right), & 0\leq n\leq 4 \\
0, & \text{otherwise}
\end{cases}
$$

Değerler:

| $n$ | $x[n]$ |
|---:|---:|
| $0$ | $0$ |
| $1$ | $1$ |
| $2$ | $0$ |
| $3$ | $-1$ |
| $4$ | $0$ |

Sonuç:

$$
\boxed{
x[n]=
\begin{cases}
\sin\left(\frac{\pi n}{2}\right), & 0\leq n\leq 4 \\
0, & \text{otherwise}
\end{cases}
}
$$

---

## Question 4

Verilen sinyal:

$$
x[n]=\delta[n+2]+3\delta[n]+\delta[n-2]
$$

DTFT tanımı:

$$
X(\Omega)=\sum_{n=-\infty}^{\infty}x[n]e^{-j\Omega n}
$$

### (a) DTFT

Sinyalde üç impuls vardır:

- $\delta[n+2]$: $n=-2$ konumunda
- $3\delta[n]$: $n=0$ konumunda
- $\delta[n-2]$: $n=2$ konumunda

DTFT’ye yazarsak:

$$
X(\Omega)=e^{-j\Omega(-2)}+3e^{-j\Omega(0)}+e^{-j\Omega(2)}
$$

$$
X(\Omega)=e^{j2\Omega}+3+e^{-j2\Omega}
$$

$$
X(\Omega)=3+(e^{j2\Omega}+e^{-j2\Omega})
$$

$$
e^{j2\Omega}+e^{-j2\Omega}=2\cos(2\Omega)
$$

Sonuç:

$$
\boxed{X(\Omega)=3+2\cos(2\Omega)}
$$

### (b) $\Omega=0$ için

$$
X(0)=3+2\cos(0)
$$

$$
X(0)=3+2
$$

$$
\boxed{X(0)=5}
$$

---

## Question 5

Verilen sinyal:

$$
x(t)=e^{-2t}u(t)
$$

### (a) Fourier transform

CTFT tanımı:

$$
X(\omega)=\int_{-\infty}^{\infty}x(t)e^{-j\omega t}\,dt
$$

$u(t)$ nedeniyle sinyal $t\geq 0$ için geçerlidir:

$$
X(\omega)=\int_0^\infty e^{-2t}e^{-j\omega t}\,dt
$$

$$
X(\omega)=\int_0^\infty e^{-(2+j\omega)t}\,dt
$$

$$
X(\omega)=\left[\frac{e^{-(2+j\omega)t}}{-(2+j\omega)}\right]_0^\infty
$$

Üst sınırda ifade sıfıra gider:

$$
X(\omega)=0-\left(-\frac{1}{2+j\omega}\right)
$$

Sonuç:

$$
\boxed{X(\omega)=\frac{1}{2+j\omega}}
$$

### (b) Genlik ve faz spektrumu

$$
X(\omega)=\frac{1}{2+j\omega}
$$

Genlik:

$$
|X(\omega)|=\frac{1}{|2+j\omega|}
$$

$$
|2+j\omega|=\sqrt{2^2+\omega^2}
$$

$$
\boxed{|X(\omega)|=\frac{1}{\sqrt{4+\omega^2}}}
$$

Faz:

$$
\angle X(\omega)=-\angle(2+j\omega)
$$

$$
\angle(2+j\omega)=\tan^{-1}\left(\frac{\omega}{2}\right)
$$

Bu nedenle:

$$
\boxed{\theta_x(\omega)=-\tan^{-1}\left(\frac{\omega}{2}\right)}
$$

---

# Final Answers Summary

$$
\boxed{
Q1:\ C_1=\frac32+2j,\quad C_{-1}=\frac32-2j,\quad P=\frac{25}{2}
}
$$

$$
\boxed{
Q2:\ h[n]=u[n]-u[n-2],\quad y[n]=u[n-1]+u[n-2],\quad y[3]=2
}
$$

$$
\boxed{
Q3:\ f_s=2\text{ Hz},\quad x[n]=\sin\left(\frac{\pi n}{2}\right),\ 0\leq n\leq4
}
$$

$$
\boxed{
Q4:\ X(\Omega)=3+2\cos(2\Omega),\quad X(0)=5
}
$$

$$
\boxed{
Q5:\ X(\omega)=\frac{1}{2+j\omega},\quad |X(\omega)|=\frac{1}{\sqrt{4+\omega^2}},\quad \theta_x(\omega)=-\tan^{-1}\left(\frac{\omega}{2}\right)
}
$$
