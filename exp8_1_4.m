clear
clc
%%
%start
N=[128,256,512];
fs=1;
N0=1024;
%%
%calculate and draw
S=calcbartlett(N(1),1024);
subplot(3,1,1)
F0=fs/N(1);
plot((0:1:N(1)*0.5-1)*F0,S(1:1:N(1)*0.5),'b')
xlabel('f/Hz')
title('N=128,bartlett')
ylabel('功率谱');
S=calcbartlett(N(2),1024);
subplot(3,1,2)
F0=fs/N(2);
plot((0:1:N(2)*0.5-1)*F0,S(1:1:N(2)*0.5),'r')
xlabel('f/Hz')
title('N=256,bartlett')
ylabel('功率谱');
S=calcbartlett(N(3),1024);
subplot(3,1,3)
F0=fs/N(3);
plot((0:1:N(3)*0.5-1)*F0,S(1:1:N(3)*0.5))
xlabel('f/Hz')
title('N=512,bartlett')
ylabel('功率谱');