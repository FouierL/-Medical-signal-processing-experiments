%%
%start
clear
clc
load noise.mat
A1=1.5;
A2=2;
A3=0.4;
f1=0.3;
f2=0.35;
N=1024;
fs=1;
F0=f2-f1;
T=1/F0;
t=0:1:N-1;
x=A1*cos(2*pi*f1*t)+A2*cos(2*pi*f2*t)+A3*noise(t+1);%这里noise中的序列标号要加一，不然报错
%%
%calculate
[a,e,rc]=aryule(x,14);
e
[h2,w2]=freqz(1,a);
P=e*abs(h2).^2;
%%
%pic
plot(w2*fs/(2*pi),P,'b'); title('AR模型功率谱密度函数,k=14');xlabel('频率/Hz');ylabel('功率谱');