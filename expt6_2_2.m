clc;
clear;
load EEG.mat
N0=length(EEG);fs=1000;
N=[200,500,1000,1500];
range1=(0:1:N(1)/2-1)*fs/N(1);
range2=(0:1:N(2)/2-1)*fs/N(2);
range3=(0:1:N(3)/2-1)*fs/N(3);
range4=(0:1:N(4)/2-1)*fs/N(4);
x1=EEG(1:N(1));
x2=EEG(N(1)+1:N(1)+N(2));
x3=EEG(N(1)+N(2)+1:N(1)+N(2)+N(3));
x4=EEG(N(1)+N(2)+N(3)+1:N(1)+N(2)+N(3)+N(4));
%dft
Z1=fft(x1);
Z2=fft(x2);
Z3=fft(x3);
Z4=fft(x4);
%图1
subplot(2,1,1),plot((1:1:N(1)),x1(1:1:N(1)),'b');
title('x1');
xlabel('序列点200');
ylabel('幅度');grid on;
subplot(2,1,2),plot(range1,abs(Z1(1:1:0.5*N(1))));
title('Z1');
xlabel('频率/Hz');
ylabel('振幅');
xlim([0,50]);grid on;
figure
%图2
subplot(2,1,1),plot((1:1:N(2)),x2(1:1:N(2)),'b');
title('x2');
xlabel('序列点500');
ylabel('幅度');grid on;
subplot(2,1,2),plot(range2,abs(Z2(1:1:0.5*N(2))));
title('Z2');
xlabel('频率/Hz');
ylabel('振幅');
xlim([0,50]);grid on;
figure
%图3
subplot(2,1,1),plot((1:1:N(3)),x3(1:1:N(3)),'b');
title('x3');
xlabel('序列点1000');
ylabel('幅度');grid on;
subplot(2,1,2),plot(range3,abs(Z3(1:1:0.5*N(3))));
title('Z3');
xlabel('频率/Hz');
ylabel('振幅');
xlim([0,50]);grid on;
figure
%图4
subplot(2,1,1),plot((1:1:N(4)),x4(1:1:N(4)),'b');
title('x4');
xlabel('序列点1500');
ylabel('幅度');grid on;
subplot(2,1,2),plot(range4,abs(Z4(1:1:0.5*N(4))));
title('Z4');
xlabel('频率/Hz');
ylabel('振幅');
xlim([0,50]);grid on;

