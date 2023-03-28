function x=sample(A,B,f1,f2,fs,N)
t=0:1/fs:(N-1)/fs;
x=A*cos(2*pi*f1*t)+B*cos(2*pi*f2*t);
end