clc;
clear;
%加载数据
load EEG.mat
N=length(EEG);fs=1000;
range=(0:1:N/2-1)*fs/N;
%dft
Z=fft(EEG);
%作图
subplot(2,1,1),plot(range*N/fs,EEG(1:1:0.5*N),'b');
title('时域波形');xlabel('时间/s');
ylabel('幅度');grid on;
subplot(2,1,2),plot(range,abs(Z(1:1:0.5*N)));
title('频域波形');xlabel('频率/Hz');
ylabel('幅度');
xlim([0,30]);
