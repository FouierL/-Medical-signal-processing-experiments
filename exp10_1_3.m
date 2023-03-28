clc;
clear;
load d.mat
load ECG.mat
load EMG.mat
load X.mat
w1=zeros(1,10);
for i=11:2500
x=zeros(1,10);
for j=1:10
x(j)=X(i-j);
end
emx1(i)=d(i)-sum(w1.*x);
w1=w1+2*0.003*emx1(i).*x;
end
subplot(4,2,1),plot(emx1,'r'),title('p=10时ε'),xlim([11 2500])
subplot(4,2,2),plot(d-emx1),title('p=10时d-ε'),xlim([11 2500])
w2=zeros(1,20);
for i=21:2500
x=zeros(1,20);
for j=1:20
x(j)=X(i-j);
end
emx2(i)=d(i)-sum(w2.*x);
w2=w2+2*0.003*emx2(i).*x;
end
subplot(4,2,3),plot(emx2,'r'),title('p=20时ε'),xlim([21 2500])
subplot(4,2,4),plot(d-emx2),title('p=20时d-ε'),xlim([21 2500])
w3=zeros(1,30);
for i=31:2500
x=zeros(1,30);
for j=1:30
x(j)=X(i-j);
end
emx3(i)=d(i)-sum(w3.*x);
w3=w3+2*0.003*emx3(i).*x;
end
subplot(4,2,5),plot(emx3,'r'),title('p=30时ε'),xlim([31 2500])
subplot(4,2,6),plot(d-emx3),title('p=30时d-ε'),xlim([31 2500])
w4=zeros(1,40);
for i=41:2500
x=zeros(1,40);
for j=1:40
x(j)=X(i-j);
end
emx4(i)=d(i)-sum(w4.*x);
w4=w4+2*0.003*emx4(i).*x;
end
subplot(4,2,7),plot(emx4,'r'),title('p=40时ε'),xlim([41 2500])
subplot(4,2,8),plot(d-emx4),title('p=40时d-ε'),xlim([41 2500])