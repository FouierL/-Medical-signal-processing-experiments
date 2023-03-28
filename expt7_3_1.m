clc
clear
load EEG;
%%
%calculate
meanFz=mean(EEG_Fz)
meanF4=mean(EEG_F4)
meanOz=mean(EEG_Oz)
varFz=var(EEG_Fz)
varF4=var(EEG_F4)
varOz=var(EEG_Oz)
stdFz=std(EEG_Fz)
stdF4=std(EEG_F4)
stdOz=std(EEG_Oz)
%%
%pic1
figure(1);
subplot(2,3,1),plot(EEG_Fz),title('EEG_Fz');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,2),plot(EEG_F4),title('EEG_F4');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,3),plot(EEG_Oz);title('EEG_Oz');xlabel('时间');
ylabel('幅度/μV');grid on;
subplot(2,3,4),r=xcorr(EEG_Fz,EEG_Fz,'biased');
plot(r);title('EEG_Fz的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,5),r=xcorr(EEG_F4,EEG_F4,'biased');
plot(r);title('EEG_F4的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(2,3,6),r=xcorr(EEG_Oz,EEG_Oz,'biased');
plot(r);title('EEG_Oz的有偏自相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
%%
%pic2
figure(2);
subplot(3,1,1),r=xcorr(EEG_Fz,EEG_F4,'biased');
plot(r);title('EEG_Fz和EEG_F4的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(3,1,2),r=xcorr(EEG_Fz,EEG_Oz,'biased');
plot(r);title('EEG_Fz和EEG_Oz的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;
subplot(3,1,3),r=xcorr(EEG_F4,EEG_Oz,'biased');
plot(r);title('EEG_F4和EEG_Oz的有偏互相关函数');xlabel('延迟时间');
ylabel('幅度/μV');grid on;