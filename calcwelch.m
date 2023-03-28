function S = calcwelch(L,alpha)
load noise.mat
N0=1024;
K=(N0-L)/((1-alpha)*L)+1;
noise=noise(1:1:N0);
A1=2;
A2=2;
f1=0.32;
f2=0.35;
fs=1;
N0=1024;
T=1/fs;
w=hanning(L,'periodic');
U=sum(w.^2);
S=0;
for i=1:K
    t=((i-1)*(1-alpha)*L):(L-1+(i-1)*(1-alpha)*L);
    x=A1*cos(2*pi*f1*t)+A2*cos(2*pi*f2*t)+noise(t+1).*w';
    S=S+abs(fft(x)).^2/L/U;
end
S=S/K;
end