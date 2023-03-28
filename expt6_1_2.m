clc;
clear;
%%
A=2;B=5;f1=20;f2=50;fs=200;
N=60;range=(0:1:0.5*N-1)*fs/N;
x2=sample(A,B,f1,f2,fs,N);
%加窗
window_hamming=hamming(N,'periodic');
window_hanning=hanning(N,'periodic');
x2_hamming=x2.*window_hamming';
x2_hanning=x2.*window_hanning';
%%fft
Z1_k=fft(x2);
Z1_k_hamming=fft(x2_hamming);
Z1_k_hanning=fft(x2_hanning);
%%
%作图
tiledlayout(3,1);
ax1=nexttile;
stem(ax1,range,abs(Z1_k(1:1:0.5*N)),'b');
title('矩形窗');xlabel('频率/Hz');
ylabel('幅度');
ax2=nexttile;
stem(ax2,range,abs(Z1_k_hanning(1:1:0.5*N)),'r');
title('海宁窗');xlabel('频率/Hz');
ylabel('幅度');
ax3=nexttile;
stem(ax3,range,abs(Z1_k_hamming(1:1:0.5*N)));
title('汉明窗');xlabel('频率/Hz');
ylabel('幅度');


