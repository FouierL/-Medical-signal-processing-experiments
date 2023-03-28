clc
clear
load noise;
f=1/40;
w=pi/15;
t=(0:1:1499);
x=cos(2*pi*f*t+w);
y=x+noise_x;
%%
%draw
subplot(2,3,1),plot(x),xlim([0,24*pi]);title('x信号函数');xlabel('时间');
ylabel('幅度/V');grid on;
subplot(2,3,2),plot(noise_x),title('noise_x');xlabel('时间');
ylabel('幅度/V');grid on;
subplot(2,3,3),plot(y);title('添加噪声后原函数');xlabel('时间');
ylabel('幅度/V');grid on;
subplot(2,3,4),r=xcorr(x,x,'biased');
plot(r);title('x的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/V');grid on;
subplot(2,3,5),r=xcorr(y,y,'biased');
plot(r);title('z的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/V');grid on;
subplot(2,3,6),r=xcorr(x,y,'biased');
plot(r);title('x与z的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/V');grid on;