% Collocation example text pg 367
%
n = 10;
a = 0.;
b = 1.;
ya = 0.;
yb = exp(1)/3;

for i = 1:n
    t(i)=a+(i-1)*(b-a)/(n-1);
    bn(i,1) = 0.;
    for j = 1:n
    ann(i,j) = 0.;
    end
end
% first eq
ann(1,1) = 1.;
bn(1,1) = ya;
% last eq
bn(n,1) = yb;
for j = 1:n
    ann(n,j) = 1.;
end
%
for i = 2:(n-1)
    for j = 1:n
        %residuals
        yyy = t(i)^(j-1);
        ddydtt = (j-1)*t(i)^(j-2);
        dddydttt = (j-1)*(j-2)*t(i)^(j-3);
        
        ann(i,j) = dddydttt - yyy -2*exp(t(i))/3;
        %ann(i,j)=(j-1)*(j-2)*t(i)^(j-3) - t(i)^(j-1) - 2/3*exp(t(i));
    end
end
ann;
bn;
c = linsolve(ann,bn)
%
y(1) = ya;
y(n) = yb;
for i = 2:(n-1)
    y(i) = 0;
    for j = 1:n
    y(i) = y(i)+c(j,1)*t(i)^(j-1);
    end
end
%    
plot(t,y, t, t.*exp(t)/3);
%
y2(1) = ya;
y2(n) = yb;
for i = 2:4*(n-1)
    t2(i) = a+(i-1)*(b-a)/(n-1);
    y2(i) = 0;
    for j = 1:n
    y2(i) = y2(i)+c(j,1)*t2(i)^(j-1);
    end
end
%    
%plot(t2,y2);
%