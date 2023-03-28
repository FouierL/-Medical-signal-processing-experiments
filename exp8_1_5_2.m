%%
%start
clear
clc
load noise.mat
K=7;
a=0.5;
N0=1024;
L=N0/(1+(K-1)*(1-a));
L
fs=1;
F0=fs/L;
N0=1024;
T=1/fs;
A1=2;
A2=2;
f1=0.32;
f2=0.35;
fs=1;
t=0:1:N0-1;
%%
%calculate
S=calcbartlett(128,1024);
w=hanning(L,'periodic');
x=A1*cos(2*pi*f1*t)+A2*cos(2*pi*f2*t)+noise(t+1);
S1=pwelch(x,w,50,L);
%%
%draw
subplot(2,1,1)
F0=fs/128;
plot((0:1:128*0.5-1)*F0,S(1:1:128*0.5),'b')
xlabel('f/Hz')
title('N=128,自己编写的函数，bartlett')
ylabel('功率谱');
subplot(2,1,2)
F0=fs/L;
plot((0:1:L*0.5-1)*F0,S1(1:1:0.5*L))
xlabel('f/Hz')
title('hanning窗，pwelch函数，K=7,重叠率50%')
ylabel('功率谱');