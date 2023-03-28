%%
%start
clc
clear
load data.mat;
N = 300;
fs=1;
b=1;
p=4;
%%
%calculate
Rxx = xcorr(data,'biased');% 求自相关函数
Rx = zeros(1,p+1);
% 取对称序列的后半部分
for i = 1:p+1
    Rx(i) = Rxx(i+N-1);
end
% 求出1阶AR模型的系数和预测误差功率
a(1,1) = -Rx(2)/Rx(1);
rou(1) = Rx(1)*(1-(a(1,1))^2);
for m = 2:p
    kmsum = 0;
    for i = 1:m-1
        kmsum = kmsum+a(m-1,i)*Rx(m-i+1);
    end
    k(m) = -(Rx(m+1)+kmsum)/rou(m-1);
    a(m,m) = k(m);
    for i = 1:m-1
        a(m,i) = a(m-1,i)+k(m)*a(m-1,m-i);
    end;
    rou(m) = rou(m-1)*(1-(k(m))^2);
end
G = (rou(p))^2;
[H,w] = freqz(G,[1,a(p,1:p)],N);% 在2*pi范围内N个等分点求系统函数
Hf = abs(H);
f = w/(2*pi);
%%
%pic
figure(2);
subplot(2,1,1),plot(w*fs/(2*pi),Hf,'b');title('自写函数，功率谱密度函数');xlabel('频率/Hz');ylabel('幅度/V');
[a,e,k] = aryule(data,4);
[h,w] = freqz(b,a); % AR 模型是一个全极点模型，所以 b=1；a 为 AR 模型参数,h 为 freqz 求出的频率响应，w 为对应的角频率。
P=e*abs(h).^2;     % 求功率，e 为模型白噪声方差。
subplot(2,1,2),plot(w*fs/(2*pi),P,'r');title('matlab调用函数，功率谱密度函数');xlabel('频率/Hz');ylabel('幅度/V'); % 作图显示 AR 模型功率谱估计，w*fs/(2*pi) 将角频率转化成频率形式 ，其中 fs=1 Hz，表示信号采样