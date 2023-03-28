%%
%start
clc
clear
load data.mat;
fs=1;
%%
%calculate and pic
figure(2);
b=1;
r=xcorr(data,data,'biased');
[a,e,rc1]=YW_equations(3,r);
[h,w] = freqz(b,a); % AR 模型是一个全极点模型，所以 b=1；a 为 AR 模型参数,h 为 freqz 求出的频率响应，w 为对应的角频率。
P=e*abs(h).^2;     % 求功率，e 为模型白噪声方差。
subplot(2,1,1),plot(w*fs/(2*pi),P,'b');title('自写函数，功率谱密度函数');xlabel('频率/Hz');ylabel('功率谱');
[a,e,k] = aryule(data,3);
[h,w] = freqz(b,a); % AR 模型是一个全极点模型，所以 b=1；a 为 AR 模型参数,h 为 freqz 求出的频率响应，w 为对应的角频率。
P=e*abs(h).^2;     % 求功率，e 为模型白噪声方差。
subplot(2,1,2),plot(w*fs/(2*pi),P,'r');title('matlab调用函数，功率谱密度函数');xlabel('频率/Hz');ylabel('功率谱'); % 作图显示 AR 模型功率谱估计，w*fs/(2*pi) 将角频率转化成频率形式 ，其中 fs=1 Hz，表示信号采样