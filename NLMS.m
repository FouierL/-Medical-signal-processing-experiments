function [y,e]=NLMS(u,p,xin,xref)
%初始化
w=zeros(1,p);
e=zeros(1,length(xin));
xobs=[];
for i=1:length(xin)-p+1
    xobs=[xobs,xin(i:i+p-1)'];
end
%迭代计算
for i=1:length(xin)-p+1
    e(i)=xref(i)-w*xobs(:,i);
    s=sum(abs(xobs(:,i)).^2);
    w(1:p)=w(1:p)+(u*e(i)*xobs(:,i))'/s;
end
%输出
y=zeros(1,length(xin));
for i=1:length(xin)-p+1
    y(i)=w*xobs(:,i);
end
end