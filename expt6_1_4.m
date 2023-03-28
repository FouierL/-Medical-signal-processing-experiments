clc;
clear;
%定义常量
A=2;B=5;f1=20;f2=50;fs=30;
N=60;
%生成坐标轴
range5=(0:1:N/2-1)*fs/N;
%生成抽样序列
x5=sample(A,B,f1,f2,fs,N);
%dft
Z5k=fft(x5);
%作图
subplot(2,1,1),stem(x5,'b');
title('x5');xlabel('fs=30的60点序列');
ylabel('幅度');grid on;
subplot(2,1,2),stem(abs(Z5k));
title('Z5k');xlabel('频率/Hz');
ylabel('幅度');
xlim([0,30])

