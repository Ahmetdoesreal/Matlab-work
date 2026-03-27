%% sum of periodic signal's period: x(t)=cos(t)+sin(3t) plot in 3period
% i found T=2*pi. 3 period; 3T=3*2*pi 3T=6pi
clc
clear all
T=2*pi;
t=0:0.1:3*T;
x_t=cos(t)+sin(3*t);
plot(t,x_t)
%% syms integral
clc
clear
syms x t
f=x^2;
g=t^2+exp(-t);%e^-t
int(f,x)% indefinite integral
int(f,x,-1,1)%definite integral

%% week4 ex_w4.7 (3t^2+1)dirac(t-1) integral of it btw -1 and 2
clc
clear
syms t
fi_t=(3*t^2+1)*dirac(t-1);
int(fi_t, t,-1,2)

%% week4 ex_w4.9 (e^t+1)dirac(2t-2) integral of it btw -1 and 2
clc
clear all
syms t

f_t=exp(-t)*dirac(2*t-1);
yt=int(f_t, t,-inf,inf)

double(yt)% to see reel number


%x=0:0.01:3;
%y=gauspuls(2*x-2);% you cannot use gauspuls in order to take integral of a
                    %function. gauspuls doesnot work with symbolic variable
%plot(x,y)

%% result of dirac(2*x1-2) 
clc
clear
syms x1
y1=dirac(2*x1-2);
yt1=int(y1, x1,-inf,inf)
%% integral of dirac_delta
clc
clear
syms r t
int(dirac(r),r,-inf,t) % sign(t)/2 + 1/2 = heaviside(t)
%t=0 sign(t)=1/2 ; t<0 0; t>0 1 . another def. of unit step.
%% Cont. signal
% sin signal form
%expo form
%comp. exp form.

%% real imaginary part
clc
clear all
a=4;
b=3;
z=a+j*b;
real(z);
imag(z);
abs(z);
angle(z)%it is in radian.
atan(z);%again angle.
degree_1= angle(z)*180/pi;% converting to degree.
%R = deg2rad( D ) converts angle units from degrees to radians
radian_1=deg2rad(degree_1);
rad2deg(radian_1);%convert rad to deg.

%% complex exponential
% Ae^(j*w*t+theta)=A(cos(wt+theta)+j*sin(wt+theta))
%yt=2e^(j*pi*t+pi/3)
% plotting real and imaginary part of the signal
clc
clear all
t=0:0.01:2;
A=2;
w=pi;
theta=pi/3;
yt=A*exp(j*w*t+theta);

plot(t,real(yt),t,imag(yt),'-.')

%% ramp function
clc
clear
t=-5:0.01:10;
rt=t.*heaviside(t);
plot(t,rt)

%% gensig: construction periodic signal
clc
clear all
T=3;
t_dur=20;
ts=0.01;

[s,t]=gensig('square',T,t_dur,ts);%install Control System Toolbox

plot(t,s)
ylim([-2 2]);
T1=2;
t_dur1=10;
[s1,t1]=gensig('pulse',T1,t_dur1);%install Control System Toolbox

figure
plot(t1,s1)
ylim([-2 2])
