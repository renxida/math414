%Homework 07
function y=f(w,inter,bv,n)
y=zeros(n,1);
h=(inter(2)-inter(1))/(n+1);

i=1;
y(i)=bv(1) - 2*w(i) + w(i+1) - h*h*sin( (w(i+1)-bv(1)) / 2 );

for i=2:n-1
y(i)=w(i-1) - 2*w(i) + w(i+1) - h*h*sin( (w(i+1)-w(i-1)) / 2 );
end

i=n;
y(i)=w(i-1) - 2*w(i) + bv(2) - h*h*sin( (bv(2)-w(i-1)) / 2 );