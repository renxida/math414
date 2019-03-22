function z=F(s, doplt)
%  (a,b) is the time interval
%   yb is the desired BC at the far end t=b
a=1;b=2;yb=1/12;
%
ydot=@(t,y) [y(2);18*(y(1))^2];
% [t,y]=ode45(ydot,[a,b],[ya,s]);
[t,y]=ode45(ydot,[a,b],[1/3,s]);
if exist('doplt', 'var')
plot(t, y(:,1))
end
z=y(end,1)-yb; % end means last entry of solution y
end
%