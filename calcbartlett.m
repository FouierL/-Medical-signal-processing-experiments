function S=calcbartlett(N,N0)
load noise.mat
noise=noise(1:1:N0);
A1=2;
A2=2;
f1=0.32;
f2=0.35;
fs=1;
N0=1024;
T=1/fs;
K=N0/N;
S=0;
for i=1:K
    t=((i-1)*N:i*N-1)*T;
    x=A1*cos(2*pi*f1*t)+A2*cos(2*pi*f2*t)+noise(t+1);
    S=S+abs(fft(x)).^2;
end
S=S/N0;
end