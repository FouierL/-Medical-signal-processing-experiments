%%
%start
clear
clc
load EEG.mat
b=1;
fs=1000;
%%
%calculate
t1=1:500;
t2=1:1000;
t3=1:5000;
[a1,e1,k1]=aryule(EEG(t1),4);
[a2,e2,k2]=aryule(EEG(t2),4);
[a3,e3,k3]=aryule(EEG(t3),4);
[h1,w1] = freqz(b,a1,500);
[h2,w2] = freqz(b,a2,1000);
[h3,w3] = freqz(b,a3,5000);
P1 = e1*abs(h1).^2;
P2 = e2*abs(h2).^2;
P3 = e3*abs(h3).^2;
%%
%pic
subplot(3,1,1)
plot((0:1:249)*fs/500,P1(1:1:250),'b')
title('N=500，四阶AR模型功率谱密度函数')
xlabel('频率/Hz');ylabel('功率谱');
xlim([0,50]);
subplot(3,1,2)
plot((0:1:499)*fs/1000,P2(1:1:500),'r')
title('N=1000，四阶AR模型功率谱密度函数')
xlabel('频率/Hz');ylabel('功率谱');
xlim([0,50]);
subplot(3,1,3)
plot((0:1:2499)*fs/5000,P3(1:1:2500))
title('N=5000，四阶AR模型功率谱密度函数')
xlabel('频率/Hz');ylabel('功率谱');
xlim([0,50]);