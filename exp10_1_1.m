clear
clc
load d.mat
load X.mat
subplot(2,1,1)
plot(d,'b');
title('输入信号'),xlabel("N")
subplot(2,1,2)
plot(X,'r');
title('参考信号'),xlabel("N")
