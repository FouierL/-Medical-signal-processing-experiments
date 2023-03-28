clc
clear
load noise;
meanx=mean(noise_x)
meany=mean(noise_y)
varx=var(noise_x)
vary=var(noise_y)
stdx=std(noise_x)
stdy=std(noise_y)
%%
%pic1
figure(1);
subplot(2,2,1),plot(noise_x);title('noise_x');xlabel('噪声');
ylabel('幅度/V');grid on
[c,n]=xcorr(noise_x,10,'coeff');
subplot(2,2,2),plot(n,c),title('自相关函数 '),xlabel('延迟时间');
ylabel('幅度/V');grid  on
[b,m]=xcov(noise_x,10,'coeff');
subplot(2,2,3),plot(m,b),title('协方差函数'),xlabel('延迟时间');
ylabel('幅度/V');grid  on
subplot(2,2,4),pwelch(noise_x,33,32,[],500),title('功率谱密度函数')
%%
%pic2
figure(2);
subplot(2,2,1),plot(noise_y);title('noise_y');grid on
[c,n]=xcorr(noise_y,10,'coeff');
subplot(2,2,2),plot(n,c),title('自相关函数'),xlabel('延迟时间');
ylabel('幅度/V');grid  on
[b,m]=xcov(noise_y,10,'coeff');
subplot(2,2,3),plot(m,b),title('协方差函数'),xlabel('延迟时间');
ylabel('幅度/V');grid  on
subplot(2,2,4),pwelch(noise_y,33,32,[],500),title('功率谱密度函数'),grid  on
%%
%pic3
figure(3);
subplot(2,2,1),r=xcorr(noise_x,noise_y,'biased');
plot(r);title('noise_x和noise_y有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/V');grid on
con=xcov(noise_x,noise_y,'biased');
subplot(2,2,2),plot(con),title('noise_x和noise_y有偏互协方差函数 '),xlabel('延迟时间');
ylabel('幅度/V');grid  on
subplot(2,2,3),r=xcorr(noise_x,noise_y,'unbiased');
plot(r);title('noise_x和noise_y无偏互相关函数'),xlabel('延迟时间');
ylabel('幅度/V');grid  on
subplot(2,2,4),con=xcov(noise_x,noise_y,'unbiased');
plot(con),xlabel('延迟时间');
ylabel('幅度/V');title('noise_x和noise_y无偏互协方差函数');
%%
%pic4
figure(4);
subplot(2,2,1),plot(noise_x);title('noise_x');xlabel('噪声');
ylabel('幅度/V');grid on
r=xcorr(noise_x,noise_x,'biased');
subplot(2,2,2),plot(r),title('自相关函数 '),xlabel('延迟时间');
ylabel('幅度/V');grid  on
cov=xcov(noise_x,noise_x,'biased');
subplot(2,2,3),plot(cov),title('协方差函数'),xlabel('延迟时间');
ylabel('幅度/V');grid  on
subplot(2,2,4),pwelch(noise_x,33,32,[],500),title('功率谱密度函数')
%%
%pic5
figure(5);
subplot(2,2,1),plot(noise_x);title('noise_y');xlabel('噪声');
ylabel('幅度/V');grid on
r=xcorr(noise_y,noise_y,'biased');
subplot(2,2,2),plot(r),title('自相关函数 '),xlabel('延迟时间');
ylabel('幅度/V');grid  on
cov=xcov(noise_y,noise_y,'biased');
subplot(2,2,3),plot(cov),title('协方差函数'),xlabel('延迟时间');
ylabel('幅度/V');grid  on
subplot(2,2,4),pwelch(noise_x,33,32,[],500),title('功率谱密度函数')