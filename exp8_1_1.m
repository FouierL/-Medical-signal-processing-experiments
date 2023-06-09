
clear
clc
load noise.mat
%%
%start
A1=2;A2=2;f1=0.32;f2=0.35;fs=1;N=1024;T=1/fs;
noise=noise(1:1:N);
N1=64;N2=128;N3=256;
t1=0:1:N1-1;
t2=0:1:N2-1;
t3=0:1:N3-1;
%%
%sample
x1=A1*cos(2*pi*f1*t1)+A2*cos(2*pi*f2*t1)+noise(t1+1);
x2=A1*cos(2*pi*f1*t2)+A2*cos(2*pi*f2*t2)+noise(t2+1);
x3=A1*cos(2*pi*f1*t3)+A2*cos(2*pi*f2*t3)+noise(t3+1);
%calculate
S1=abs(fft(x1)).^2/N1;
S2=abs(fft(x2)).^2/N2;
S3=abs(fft(x3)).^2/N3;
%%
%draw
figure(1);
subplot(3,1,1);
plot(t1(1:0.5*N1)/N1,S1(1:0.5*N1),'r');
title('N=64');
xlabel('f/Hz');
ylabel('功率谱');
subplot(3,1,2);
plot(t2(1:0.5*N2)/N2,S2(1:0.5*N2),'b');
title('N=128');
xlabel('f/Hz');
ylabel('功率谱');
subplot(3,1,3);
plot(t3(1:0.5*N3)/N3,S3(1:0.5*N3));
title('N=256');
xlabel('f/Hz');ylabel('功率谱');
%%
%pic2
figure(2);
subplot(3,1,1);
plot(x1,'r');
title('N=64');
xlabel('点数');
ylabel('幅度/mV');
xlim([0 64]);
subplot(3,1,2);
plot(x2,'b');
title('N=128');
xlabel('点数');
ylabel('幅度/mV');
xlim([0 128]);
subplot(3,1,3);
plot(x3);
title('N=256');
xlabel('点数');
ylabel('幅度/mV');
xlim([0 256]);
