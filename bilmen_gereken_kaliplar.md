# Bilmen Gereken Kalıplar ve Formüller

Bu dosya, alternatif sinyaller ve sistemler sorularını çözerken en çok lazım olacak temel kalıpları özetler.

---

## 1. Kompleks Fourier Serisi

Periyodik bir sürekli zaman sinyali şu şekilde yazılır:

$$
x(t)=\sum_{n=-\infty}^{\infty} C_n e^{jn\omega_0t}
$$

Burada:

- $C_n$: kompleks Fourier serisi katsayısı
- $\omega_0$: temel açısal frekans
- $n$: harmonik numarası

---

## 2. Euler Açılımları

### Kosinüs

$$
\cos(\omega_0t)=\frac{e^{j\omega_0t}+e^{-j\omega_0t}}{2}
$$

### Sinüs

$$
\sin(\omega_0t)=\frac{e^{j\omega_0t}-e^{-j\omega_0t}}{2j}
$$

Bu kalıplar sayesinde trigonometrik ifadeler kompleks Fourier serisi katsayılarına çevrilir.

---

## 3. Fourier Katsayısı Bulma Kalıbı

Eğer sinyal şu formdaysa:

$$
x(t)=A\cos(\omega_0t)+B\sin(\omega_0t)
$$

sadece şu katsayılar sıfırdan farklı olur:

$$
C_1
$$

ve

$$
C_{-1}
$$

Diğer bütün katsayılar sıfırdır.

---

## 4. Parseval Güç Formülü

Fourier serisi katsayıları verilmişse ortalama güç:

$$
P=\sum_{n=-\infty}^{\infty}|C_n|^2
$$

Eğer sadece $C_1$ ve $C_{-1}$ varsa:

$$
P=|C_1|^2+|C_{-1}|^2
$$

---

## 5. LTI Sistemlerde Toplam Dürtü Cevabı

Seri bağlı iki LTI sistem için toplam dürtü cevabı konvolüsyonla bulunur:

$$
h[n]=h_1[n]*h_2[n]
$$

---

## 6. Delta Fonksiyonu Konvolüsyon Kuralları

### Birim delta

$$
\delta[n]*x[n]=x[n]
$$

### Kaydırılmış delta

$$
\delta[n-k]*x[n]=x[n-k]
$$

Bu yüzden:

$$
(\delta[n]-\delta[n-k])*u[n-a]
=
u[n-a]-u[n-a-k]
$$

---

## 7. Ayrık Zamanlı LTI Sistem Kararlılığı

Bir ayrık zamanlı LTI sistem BIBO kararlı ise:

$$
\sum_{n=-\infty}^{\infty}|h[n]|<\infty
$$

olmalıdır.

Yani dürtü cevabının mutlak toplamı sonlu olmalıdır.

---

## 8. Kararlılık İçin Pratik Kurallar

### Kararlı örnekler

Sonlu sayıda impuls içeren sistemler kararlıdır:

$$
h[n]=\delta[n]+\delta[n-1]-2\delta[n-3]
$$

Azalan üstel sistemler kararlıdır:

$$
h[n]=(0.5)^n u[n]
$$

Çünkü:

$$
\sum_{n=0}^{\infty}(0.5)^n=\frac{1}{1-0.5}=2
$$

sonludur.

### Kararsız örnekler

Birim basamak cevabı genellikle kararsızdır:

$$
h[n]=u[n]
$$

Çünkü:

$$
\sum_{n=0}^{\infty}1=\infty
$$

sonsuzdur.

---

## 9. Geometrik Seri Kalıbı

Eğer:

$$
|a|<1
$$

ise:

$$
\sum_{n=0}^{\infty}a^n=\frac{1}{1-a}
$$

Örnek:

$$
\sum_{n=0}^{\infty}(0.5)^n=2
$$

Eğer:

$$
|a|\geq 1
$$

ise toplam yakınsamaz, yani sonsuza gider.

---

## 10. Nedensellik

Ayrık zamanlı LTI sistem nedensel ise dürtü cevabı negatif zamanda başlamaz:

$$
h[n]=0,\quad n<0
$$

Pratik yorum:

- $h[n]=u[n]$ nedenseldir.
- $h[n]=\delta[n-2]$ nedenseldir.
- $h[n]=\delta[n+1]$ nedensel değildir.
- $h[n]=u[n+2]$ nedensel değildir.

Çünkü negatif zamanda değer üretir.

---

## 11. Örnekleme

Sürekli zamanlı sinyal:

$$
x(t)
$$

örnekleme periyodu $T_s$ ile örneklenirse:

$$
x[n]=x(nT_s)
$$

Örnek:

$$
T_s=\frac{1}{4}
$$

ise:

$$
x[n]=x\left(\frac{n}{4}\right)
$$

---

## 12. Nyquist Örnekleme Kuralı

Sürekli zamanlı sinyalde en yüksek frekans $f_{\max}$ ise minimum örnekleme frekansı:

$$
f_s \geq 2f_{\max}
$$

Bu değere Nyquist oranı denir.

Örnek:

$$
x(t)=\cos(2\pi 50t)
$$

Burada frekans:

$$
f=50\text{ Hz}
$$

Minimum örnekleme frekansı:

$$
f_s \geq 100\text{ Hz}
$$

---

## 13. Açısal Frekans ve Normal Frekans İlişkisi

Sürekli zamanlı sinyalde:

$$
\omega = 2\pi f
$$

Dolayısıyla:

$$
f=\frac{\omega}{2\pi}
$$

Örnek:

$$
\cos(100\pi t)
$$

için:

$$
\omega=100\pi
$$

$$
f=\frac{100\pi}{2\pi}=50\text{ Hz}
$$

---

## 14. DTFT Tanımı

Ayrık zamanlı Fourier dönüşümü:

$$
X(\Omega)=\sum_{n=-\infty}^{\infty}x[n]e^{-j\Omega n}
$$

Burada:

- $\Omega$: ayrık zamanlı açısal frekans
- $x[n]$: ayrık zamanlı sinyal
- $X(\Omega)$: DTFT

---

## 15. Delta İçin DTFT Kalıpları

### Temel delta

$$
\delta[n]\Rightarrow 1
$$

### Gecikmiş delta

$$
\delta[n-k]\Rightarrow e^{-j\Omega k}
$$

### İleri kaymış delta

$$
\delta[n+k]\Rightarrow e^{j\Omega k}
$$

---

## 16. DTFT Euler Toplamları

Aşağıdaki ifade:

$$
e^{j\Omega}+e^{-j\Omega}
$$

şuna eşittir:

$$
2\cos(\Omega)
$$

Genel hali:

$$
e^{jk\Omega}+e^{-jk\Omega}=2\cos(k\Omega)
$$

Örnek:

$$
\delta[n-2]+\delta[n+2]
$$

DTFT sonucu:

$$
X(\Omega)=e^{-j2\Omega}+e^{j2\Omega}
$$

$$
X(\Omega)=2\cos(2\Omega)
$$

---

## 17. Sürekli Zamanlı Üstel Sinyalin Fourier Dönüşümü

Eğer:

$$
x(t)=e^{-at}u(t),\quad a>0
$$

ise Fourier dönüşümü:

$$
X(\omega)=\frac{1}{a+j\omega}
$$

---

## 18. Üstel Sinyalin Genlik ve Fazı

Eğer:

$$
X(\omega)=\frac{1}{a+j\omega}
$$

ise genlik:

$$
|X(\omega)|=\frac{1}{\sqrt{a^2+\omega^2}}
$$

faz:

$$
\theta_x(\omega)=-\tan^{-1}\left(\frac{\omega}{a}\right)
$$

Örnek:

$$
x(t)=e^{-3t}u(t)
$$

için:

$$
X(\omega)=\frac{1}{3+j\omega}
$$

$$
|X(\omega)|=\frac{1}{\sqrt{9+\omega^2}}
$$

$$
\theta_x(\omega)=-\tan^{-1}\left(\frac{\omega}{3}\right)
$$

---

## 19. Hızlı Tanıma Tablosu

| Soru Tipi | Bakılacak Kalıp |
|---|---|
| Fourier serisi katsayısı | Euler açılımı |
| Ortalama güç | Parseval |
| Seri bağlı LTI sistem | Konvolüsyon |
| Kararlılık | $\sum |h[n]| < \infty$ |
| Nedensellik | $h[n]=0$ for $n<0$ |
| Örnekleme | $x[n]=x(nT_s)$ |
| Nyquist | $f_s \geq 2f_{\max}$ |
| DTFT | $\sum x[n]e^{-j\Omega n}$ |
| Delta DTFT | $\delta[n-k]\Rightarrow e^{-j\Omega k}$ |
| Üstel Fourier dönüşümü | $e^{-at}u(t)\Rightarrow \frac{1}{a+j\omega}$ |

---

## 20. En Çok Karıştırılan Noktalar

### $u[n]$ neden kararsız olabilir?

Çünkü:

$$
u[n]=1,\quad n\geq 0
$$

ve toplamı:

$$
1+1+1+\cdots=\infty
$$

olur.

---

### $(0.5)^n u[n]$ neden kararlı?

Çünkü değerler azalır:

$$
1,\frac12,\frac14,\frac18,\ldots
$$

ve toplam sonludur:

$$
2
$$

---

### $\delta[n-k]$ ne yapar?

Sinyali $k$ kadar geciktirir:

$$
\delta[n-k]*x[n]=x[n-k]
$$

---

### $\delta[n+k]$ nedensel mi?

Hayır.

Çünkü:

$$
\delta[n+k]=\delta[n-(-k)]
$$

yani impuls $n=-k$ anındadır.

Örneğin:

$$
\delta[n+2]
$$

impulsu $n=-2$ anındadır, bu yüzden nedensel değildir.

---

## 21. Sınavda Hızlı Kontrol Listesi

Bir soruya bakınca sırayla şunları kontrol et:

1. Sinyal sürekli zamanlı mı, ayrık zamanlı mı?
2. Sistem LTI mı?
3. Dürtü cevabı mı verilmiş?
4. Toplam mutlak değer sonlu mu?
5. Negatif zamanda değer var mı?
6. Soru Fourier serisi mi, Fourier dönüşümü mü?
7. Delta varsa direkt kaydırma kuralını uygula.
8. Üstel varsa $|a|<1$ veya $a>0$ şartını kontrol et.
9. Örnekleme varsa önce maksimum frekansı bul.
10. Sonuçta birimlere dikkat et: Hz, rad/s, rad/sample.

