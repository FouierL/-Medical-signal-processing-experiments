clear
clc
load EMG.mat
load ECG.mat
d=EMG+ECG;
subplot(2,1,1)
plot(d,'b');
title('输入信号'),xlabel("N")
subplot(2,1,2)
plot(EMG,'r');
title('参考信号'),xlabel("N")