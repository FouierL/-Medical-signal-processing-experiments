clc;
clear;
A=2;B=5;f1=20;f2=50;fs=200;
N=250;
range4=(0:1:N/2-1)*fs/N;
x4=sample(A,B,f1,f2,fs,N);
%dft
Z4k=fft(x4);
%%
%作图
tiledlayout(2,1);
ax1 = nexttile;
stem(ax1,range4,x4(1:1:0.5*N),'b');
title('x4');xlabel('250点序列');
ylabel('幅度');
ax2 = nexttile;
stem(ax2,range4,abs(Z4k(1:1:0.5*N)));
title('Z4k');xlabel('频率/Hz');
ylabel('幅度');

