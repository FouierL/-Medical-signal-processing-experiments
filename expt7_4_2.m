clc
clear
load noise;
noise_z=noise_x+2;
%%
%pic1
figure(1);
subplot(2,2,1),r=xcorr(noise_x,noise_y,'biased');
plot(r);title('noise_x和noise_y有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on
con=xcov(noise_x,noise_y,'biased');
subplot(2,2,2),plot(con),title('noise_x和noise_y有偏互协方差函数 '),xlabel('延迟时间');
ylabel('幅度/μV');grid  on
subplot(2,2,3),r=xcorr(noise_z,noise_y,'biased');
plot(r);title('noise_z和noise_y有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on
con=xcov(noise_z,noise_y,'biased');
subplot(2,2,4),plot(con),title('noise_z和noise_y有偏互协方差函数 '),xlabel('延迟时间');
ylabel('幅度/μV');grid  on
%%
%pic2
figure(2)
subplot(2,2,1),r=xcorr(noise_x,noise_z,'unbiased');
plot(r);title('noise_x和noise_z无偏互相关函数'),xlabel('延迟时间');
ylabel('幅度/μV');grid  on
subplot(2,2,2),con=xcov(noise_x,noise_z,'unbiased');
plot(con),title('noise_x和noise_z无偏互协方差函数');xlabel('延迟时间');
ylabel('幅度/μV');
subplot(2,2,3),r=xcorr(noise_x,noise_y,'unbiased');
plot(r);title('noise_x和noise_y无偏互相关函数'),xlabel('延迟时间');
ylabel('幅度/μV');grid  on
subplot(2,2,4),con=xcov(noise_x,noise_y,'unbiased');
plot(con),title('noise_x和noise_y无偏互协方差函数');xlabel('延迟时间');
ylabel('幅度/μV');