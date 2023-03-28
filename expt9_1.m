%%
%start
clc
clear
load data.mat;
%%
%calculate and draw
r=xcorr(data,data,'biased');
subplot(2,1,1)
plot(data,'b')
xlabel('n')
ylabel('信号幅度/V')
title('时域信号')
subplot(2,1,2)
plot([-299:1:299],r,'r')
title('data的有偏自相关序列');xlabel('延迟时间');ylabel('功率谱');