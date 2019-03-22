function z=G(s, doplt)
%  (a,b) is the time interval
%   yb is the desired BC at the far end t=b
a=0;b=1;yb=log(2);
%
ydot=@(t,y) [y(2);2*exp(2*y(1)^2)*(1-t*t)];
% [t,y]=ode45(ydot,[a,b],[ya,s]);
[t,y]=ode45(ydot,[a,b],[0,s]);
if exist('doplt', 'var')
plot(t, y(:,1))
end
z=y(end,1)-yb; % end means last entry of solution y
end
%