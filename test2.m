%% 1st example
clc
clear all
b=3;%scalar
array_1=[1 2 3 4]; %array- row vector
array_2=[1,2,3,4];
array_col=[1 ; 2; 3; 4];%column vector

array_col2=array_1'; %transpose : row will be column; column will be row

array_semicolon= 1:5;% [1 2 3 4 5]
array_semicolon2= 1:2:5;%[1 1+2=3 3+2=5 ] . "2" is increment factor
array_semicolon2=1:2:6;
length_array_1=length(array_1);
%%
%use the linspace function.
%linspace(first,last,number_of_elements)
x = linspace(0,10,5);

%%
x = rand(2);%making matrix randomly 2x2, elements btw 0 and 1.

x = ones(2,3);% every element become "1".
x=zeros(2,2);

x(:,2); %chosing x matrix elements. (row,column) ":"-> means all
y = x(end,2); % end last element
A = [5 6; 7 8];
A(1,2);%6
 
clc
a=[1 2 3 ; 4  5 5];

size(a);
[arow,acol]=size(a);


plot(x,y,"r--o")
%The command plots a red (r) dashed (--) line with circle (o) markers. or single dash(-) 

%Notice that each plot command created a separate plot. You can plot one line on top of another in the same axes by using the hold on command.
plot(x1,y1)
hold on
plot(x2,y2)

%When you plot a single vector by itself, MATLAB uses the vector values as the y-axis data and sets the x-axis data to the range of 1 to n (the number of elements in the vector).
plot(y) 

%%
clc
clear all
t = 0:0.1:2*pi;  %
f=1;
T=1/f;
y1 = sin(2*pi*f*t);       % y(t)=Asin(2*pi*f*t)

plot(t, y1, 'b', 'LineWidth', 2); 
grid on;                       
xlabel('t');                   
ylabel('sin(t)');               
title('Sin Function-f=1');  
% Stem grafiği
figure;
stem(t, y1, 'b', 'filled');
grid on;
xlabel('t');
ylabel('sin(t)');
title('Sin Function - f = 1 Hz (Stem)');

%%
figure;% to display each graph in a separate window (figure),
f2=2;
T2=1/f2;
y2 = sin(2*pi*f2*t);       % y(t)=Asin(2*pi*f*t)
plot(t, y2, 'b', 'LineWidth', 2); 
grid on;                       
xlabel('t');                   
ylabel('sin(t)');               
title('Sin Function-f=2');


% Stem grafiği
figure;
stem(t, y2, 'r', 'filled');
grid on;
xlabel('t');
ylabel('sin(t)');
title('Sin Function - f = 2 Hz (Stem)');