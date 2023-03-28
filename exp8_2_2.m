%%
%start
clear
clc
load EEG.mat
fs=1000;
N0=length(EEG);
F0=fs/N0;
N1=1024;
N2=5120;
%%
%calculate
w1=hamming(N1,'periodic');
w2=hamming(N2,'periodic');
U1=sum(w1.^2);
U2=sum(w2.^2);
x1=EEG(1:N1).*w1';
x2=EEG(1:N2).*w2';
S1=abs(fft(x1)).^2/N1/U1;
S2=abs(fft(x2)).^2/N2/U2;
%%
%draw
subplot(2,2,1)
plot(0:N1-1,x1,'b')
ylabel('幅度/μV')
xlabel('n')
title('N=1024,时域波形')
xlim([0,1024]);
subplot(2,2,2)
plot(0:N2-1,x2,'r')
ylabel('幅度/μV')
xlabel('n')
title('N=5120,时域波形')
xlim([0,5120]);
subplot(2,2,3)
plot((0:300)*F0,S1(1:301))
xlabel('f/Hz')
ylabel('功率谱')
title('N=1024,hamming窗，修正周期图法功率谱')
subplot(2,2,4)
plot((0:300)*F0,S2(1:301))
xlabel('f/Hz')
ylabel('功率谱')
title('N=5120,hamming窗，修正周期图法功率谱')