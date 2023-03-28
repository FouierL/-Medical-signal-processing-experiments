clc;
clear;
%%
A=2;B=5;f1=20;f2=50;fs=200;
N=[20,60,200];
range1=(0:1:N(1)/2-1)*fs/N(1);
range2=(0:1:N(2)/2-1)*fs/N(2);
range3=(0:1:N(3)/2-1)*fs/N(3);
x1=sample(A,B,f1,f2,fs,N(1));%抽样序列
x2=sample(A,B,f1,f2,fs,N(2));
x3=sample(A,B,f1,f2,fs,N(3));
Z1k=fft(x1);
Z1_k=fft(x1,20);
Z2_k=fft(x1,60);
Z3_k=fft(x1,200);
Z2_k=fft(x2);
Z3_k=fft(x3);
%%
%图1
subplot(2,3,1),stem(x1,'b');
title('x1');xlabel('20点序列');
ylabel('幅度');grid on;
subplot(2,3,2),stem(abs(Z1k));
title('Z1k');xlabel('频率/Hz');
ylabel('幅度');grid on;
xlim([0,10]);
subplot(2,3,3),stem(abs(Z1_k));
title('Z1_k');xlabel('频率/Hz');
ylabel('幅度');grid on;
xlim([0,10]);
subplot(2,3,4),stem(abs(Z2_k));
title('Z2_k');xlabel('频率/Hz');
ylabel('幅度');grid on;
xlim([0,30]);
subplot(2,3,5),stem(abs(Z3_k));
title('Z3_k');xlabel('频率/Hz');
ylabel('幅度');grid on;
xlim([0,100]);
figure
%图2
subplot(2,1,1);
stem(x2,'b');
title('x2');xlabel('60点序列');
ylabel('幅度');grid on;
subplot(2,1,2);
stem(abs(Z2_k));
title('Z2k');xlabel('频率/Hz');
ylabel('幅度');
xlim([0,30]);
figure
%图3
subplot(2,1,1);
stem(x3,'b');
title('x3');xlabel('200点序列');
ylabel('幅度');grid on;
subplot(2,1,2);
stem(abs(Z3_k));
title('Z3k');xlabel('频率/Hz');
ylabel('幅度');
xlim([0,100]);
%图4
figure(4);
subplot(2,3,1),stem(range1*N(1)/fs,x1(1:1:0.5*N(1)),'b');
title('x1');xlabel('20点序列');
ylabel('幅度');grid on;
subplot(2,3,4),stem(range1,abs(Z1_k(1:1:0.5*N(1))));
title('Z1_k');xlabel('频率/Hz');
ylabel('幅度');grid on;
subplot(2,3,2),stem(range2*N(2)/fs,x2(1:1:0.5*N(2)),'b');
title('x2');xlabel('60点序列');
ylabel('幅度');grid on;
subplot(2,3,5),stem(range2,abs(Z2_k(1:1:0.5*N(2))));
title('Z2_k');xlabel('频率/Hz');
ylabel('幅度');grid on;
subplot(2,3,3),stem(range3*N(3)/fs,x3(1:1:0.5*N(3)),'b');
title('x3');xlabel('200点序列');
ylabel('幅度');grid on;
subplot(2,3,6),stem(range3,abs(Z3_k(1:1:0.5*N(3))));
title('Z3_k');xlabel('频率/Hz');
ylabel('幅度');
