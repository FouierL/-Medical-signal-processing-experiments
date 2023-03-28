clc
clear
load noise;
%%
%N=1
f=1/40;
w=pi/15;
t=(0:1:1499);
N=1;
x=N*cos(2*pi*f*t+w);
y=x+noise_x;
%%
%draw
figure(1);
subplot(2,3,1),plot(x),xlim([0,24*pi]);title('N=1,x信号函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,2),plot(noise_x),title('noise_x');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,3),plot(y),xlim([0,24*pi]);title('N=1,添加噪声后原函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,4),r=xcorr(x,x,'biased');
plot(r);title('N=1,x的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,5),r=xcorr(y,y,'biased');
plot(r);title('N=1,z的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,6),r=xcorr(x,y,'biased');
plot(r);title('N=1,x与z的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
%%
%N=0.01
f=1/40;
w=pi/15;
t=(0:1:1499);
N=0.01;
x=N*cos(2*pi*f*t+w);
y=x+noise_x;
%%
%draw
figure(2);
subplot(2,3,1),plot(x),xlim([0,24*pi]);title('N=0.01,x信号函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,2),plot(noise_x),title('noise_x');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,3),plot(y),xlim([0,24*pi]);title('N=0.01,添加噪声后原函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,4),r=xcorr(x,x,'biased');
plot(r);title('N=0.01,x的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,5),r=xcorr(y,y,'biased');
plot(r);title('N=0.01,z的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,6),r=xcorr(x,y,'biased');
plot(r);title('N=0.01,x与z的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
%%
%N=0.33
f=1/40;
w=pi/15;
t=(0:1:1499);
N=0.33;
x=N*cos(2*pi*f*t+w);
y=x+noise_x;
%%
%draw
figure(3);
subplot(2,3,1),plot(x),xlim([0,24*pi]);title('N=0.33,x信号函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,2),plot(noise_x),title('noise_x');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,3),plot(y),xlim([0,24*pi]);title('N=0.33,添加噪声后原函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,4),r=xcorr(x,x,'biased');
plot(r);title('N=0.33,x的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,5),r=xcorr(y,y,'biased');
plot(r);title('N=0.33,z的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,6),r=xcorr(x,y,'biased');
plot(r);title('N=0.33,x与z的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
%%
%N=5
f=1/40;
w=pi/15;
t=(0:1:1499);
N=5;
x=N*cos(2*pi*f*t+w);
y=x+noise_x;
%%
%draw
figure(4);
subplot(2,3,1),plot(x),xlim([0,24*pi]);title('N=5,x信号函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,2),plot(noise_x),title('noise_x');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,3),plot(y),xlim([0,24*pi]);title('N=5,添加噪声后原函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,4),r=xcorr(x,x,'biased');
plot(r);title('N=5,x的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,5),r=xcorr(y,y,'biased');
plot(r);title('N=5,z的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,6),r=xcorr(x,y,'biased');
plot(r);title('N=5,x与z的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
%%
%N=30
f=1/40;
w=pi/15;
t=(0:1:1499);
N=30;
x=N*cos(2*pi*f*t+w);
y=x+noise_x;
%%
%draw
figure(5);
subplot(2,3,1),plot(x),xlim([0,24*pi]);title('N=30,x信号函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,2),plot(noise_x),title('noise_x');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,3),plot(y),xlim([0,24*pi]);title('N=30,添加噪声后原函数');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,4),r=xcorr(x,x,'biased');
plot(r);title('N=30,x的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,5),r=xcorr(y,y,'biased');
plot(r);title('N=30,z的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,6),r=xcorr(x,y,'biased');
plot(r);title('N=30,x与z的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;