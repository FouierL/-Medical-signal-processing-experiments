% LMS与NLMS滤波
clear
clc
load EMG.mat
load ECG.mat
xin=(EMG+ECG)';
xsignal=ECG';
xref=EMG';
p=7;u=0.0045;
[y1,e1]=LMS(u,p,xin,xref);
[y2,e2]=NLMS(u,p,xin,xref);
subplot(2,2,1)
plot(y1,'b')
title('LMS，p=7,μ=0.045')
subplot(2,2,2)
plot(y2,'b')
title('NLMS，p=7,μ=0.0045')
subplot(2,2,3)
plot(xin-e1,'r')
subplot(2,2,4)
plot(xin-e2,'r')
% 相关系数与信噪比
r11=corr(xin',ECG);
r12=corr(e1',ECG);
str1=strcat('方法一的p(d,ECG)为',num2str(r11),',p(e,ECG)为',num2str(r12));
disp(str1)
r21=corr(xin',ECG);
r22=corr(e2',ECG);
str2=strcat('方法二的p(d,ECG)为',num2str(r21),',p(e,ECG)为',num2str(r22));
disp(str2)
SNR1=10*log10(sum(xin.^2)/sum(xref.^2));
SNR2=10*log10(sum(y1.^2)/sum((e1).^2));
SNR3=10*log10(sum(y2.^2)/sum((e2).^2));
str3=strcat('滤波前的信噪比为',num2str(SNR1),'，LMS滤波后的信噪比为',num2str(SNR2),'，NLMS滤波后的信噪比为',num2str(SNR3));
disp(str3)

