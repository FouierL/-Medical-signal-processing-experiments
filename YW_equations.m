function [a,e,rc]=YW_equtions(p,Rxx)
a=zeros(1,p);
a=[1,a];
start=(length(Rxx)+1)/2;
R=Rxx(start:length(Rxx));
Rx=R(1);
rc=[];
for k=2:p+1
Rx=[Rx,R(k:-1:2)'];
Rx=[Rx;R(k:-1:1)];
e=a(1:k)*Rx(1:k,1);
Dk=a(1:k)*Rx(1:k,k);
rou=Dk/e;
rc=[rc;rou];
e=(1-rou^2)*e;
a(1:k)=a(1:k)-rou*a(k:-1:1);
end
end