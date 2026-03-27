%%built in teacher
clc
clear all

t = -5:0.1:10;                  % Define a standard time interval for the next functions
d = dirac(t-2);                   % Generate a Dirac delta (impulse) function (shoots to infinity at t=0)
index_d=d==Inf
d(index_d)=1
stem(t, d);   

%%
%non-built-in teacher
clc
clear all

t = -5:0.1:10;                       % Define a discrete integer time vector
d = (t-2 == 0);                   % Create an impulse that equals 1 ONLY when index n is exactly 0
stem(t, d);


%%
%second
%%
clc
clear all
t = 0:0.01:pi;
y_re=real(2*exp(j*pi*t+(pi/3)))
y_im=imag(2*exp(j*pi*t+(pi/3)))
plot(t, y_re, t, y_im, '.');    % Plot both the real and imaginary parts using dots

%%
%third

%%
clc
clear all
x=linspace(0,6*pi,300)
f=@(x)cos(x)+sin(3*x)
plot(x,f(x),"r","LineWidth",1)

%%
clc
clear all
omega1=1
omega2=3
T1=2*pi/omega1
T2=2*pi/omega2
f1=@(x)cos(x)
f2=@(x)sin(3*x)
x1=linspace(0,T1*3)
x2=linspace(0,T2*3)
x3=linspace(0,max(T1,T2)*3)

plot(x1,f1(x1),"r")
plot(x2,f2(x2),"b")

plot(x3,f1(x3)+f2(x3),"Color","rb")

%f=@(x)cos(x)+sin(3*x)
%plot(x,f(x),"r","LineWidth",1)