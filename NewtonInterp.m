function [poly,v]= NewtonInterp(x,y,u)
%Input: x is the vector contains the given x coordinates
%       y is the vector contains the given y coordinates
%       u is the vector contains the x coordinates of the inserted points
%Output:v is the vector contains the y coordinates of the inserted points
%       poly is the symbolic interpolation function with variable x
F=zeros(length(x));
m=length(x);
u=u(:);
F(:,1)=y(:);
for i=2:m
 for j=2:i
     F(i,j)=(F(i,j-1)-F(i-1,j-1))/(x(i)-x(i-j+1));
 end
end
I=ones(length(u),m);
for k=2:m
    I(:,k)=I(:,k-1).*(u-x(k-1));
end
v=I*diag(F);
%display the symbolic function with variable X;
syms X bb poly
A=[1];
for t=2:m
    bb=A(end)*(X-x(t-1));
    A=[A bb];
end
poly=A*diag(F);
end