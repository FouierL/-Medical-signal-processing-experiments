%%
%start
clear
clc
load data.mat;
N = 300;
fs=1;
b=1;
p=3;
%%
%calculate
Rxx = xcorr(data,'biased');% 求自相关函数
Rx = zeros(1,p+1);
% 取对称序列的后半部分
for i = 1:p+1
    Rx(i) = Rxx(i+N-1);
end
Rmatl = zeros(p,p);
% 生成p个方程对应的矩阵式
for m = 1:p
    for n = 1:p
        Rmatl(m,n) = Rx(max(m,n)-min(m,n)+1);
    end
end
Rmatr = zeros(p,1);
for m = 1:p
    Rmatr(m,1) = -Rx(m+1);
end
% 输出参数ai
ai = (inv(Rmatl)*Rmatr)';% (Rmatl\Rmatr)'
% 根据自相关函数和ai求解系统增益
G = Rx(1);
for i = 1:p
    G = G+ai(i)*Rx(i);
end
fprintf('系统增益G=%f\n',G^0.5);
[H,w] = freqz(G^0.5,[1,ai],N);% 在2*pi范围内N个等分点求系统函数
% Px = (G^0.5)*(abs(H)).^2;
Hf = abs(H);
f = w/(2*pi);
%%
%pic
figure(1);
subplot(2,1,1),plot(w*fs/(2*pi),Hf,'b');title('自写函数，功率谱密度函数');xlabel('频率/Hz');ylabel('幅度/V');
[a,e,k] = aryule(data,3);
[h,w] = freqz(b,a); % AR 模型是一个全极点模型，所以 b=1；a 为 AR 模型参数,h 为 freqz 求出的频率响应，w 为对应的角频率。
P=e*abs(h).^2;     % 求功率，e 为模型白噪声方差。
subplot(2,1,2),plot(w*fs/(2*pi),P,'r');title('matlab调用函数，功率谱密度函数');xlabel('频率/Hz');ylabel('幅度/V'); % 作图显示 AR 模型功率谱估计，w*fs/(2*pi) 将角频率转化成频率形式 ，其中 fs=1 Hz，表示信号采样