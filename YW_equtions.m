function [a,e,rc]=YW_equtions(p,Rxx)
Rx = zeros(1, p + 1);  % Rx(0)，Rx(1), Rx(2), ........Rx(p)共p + 1个数
start=(length(Rxx)+1)/2;%自相关序列对称，取一半
R=Rxx(start:length(Rxx));%自相关序列对称，取一半
Rx=R(1);
R = zeros(p, p);
a = zeros(p, 1);
b = zeros(p, 1);
for i = 1: p
    for j = 1: p
        R(i, j) = Rx(abs(i - j) + 1);  % YW方程的系数矩阵
    end
end

for k = 1: p
    b(k, 1) = -1 * Rx(k + 1);   % YW方程右边的常数向量
end

a = R\b;     % YW方程的解

a = a';         % AR模型的系数a（i）

%% 求白噪声的方差
e = 0;
e = e + 1 * Rx(1);  % a0=1
for i = 1 : length(a)
    e = e + a(i) * Rx(i + 1);
end
end
