%Homework 07
function a=jac(w,inter,bv,n)
a=zeros(n,n);h=(inter(2)-inter(1))/(n+1);
for j=1:n
a(j,j)=-2;
end;

ww = [bv(1); w; bv(2)];%shifted w

for j=1:n-1
a(j+1,j)=1+h*h/2*cos(ww(j+2)-ww(j));
end
for j=2:n
a(j-1,j)=1-h*h/2*cos(ww(j+2)-ww(j));
end
%