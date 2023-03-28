clc
clear
%%
%program
n1=500;
n2=10000;
x1=randn(1,n1);
x2=randn(1,n2);
%%
%calculate
meanx1=mean(x1)
meanx2=mean(x2)
varx1=var(x1)
varx2=var(x2)
stdx1=std(x1)
stdx2=std(x2)
%%
%draw
subplot(2,1,1),r=xcorr(x1,x1,'biased');
plot(r);title('x1的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,1,2),r=xcorr(x2,x2,'biased');
plot(r);title('x2的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;