%%
%first
clear all
clc
t=-5:0.1:10
xt=heaviside(t)-heaviside(t-5)
y=t.*exp(-t).*xt
plot(t,y)
figure
hold on
plot(t+3,y,'r')
xt=heaviside(t-3)-heaviside(t-8)
y=t.*exp(-t).*xt
plot(t,y,'b--')
%%
%second
%%
clear all
clc
t=-5:0.1:10
r=t.*heaviside(t)
plot(t,r)

%%
%third

clc
clear all
t=-5:0.1:10
firstgraph=heaviside(t)
secondgraph=heaviside(t-3)
subplot(2,1,1)
plot(t,firstgraph)
subplot(2,1,2)
plot(t,secondgraph)