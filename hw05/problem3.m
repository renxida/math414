% Program 6.8 Adams-Bashforth-Moulton second-order p-c
% Inputs: time interval inter,
% ic=[y0] initial condition
% number of steps n, number of (multi)steps s for explicit method
% Output: time steps t, solution y
% Calls multistep methods such as ab2step.m and am1step.m
% Example usage: [t,y]=predcorr([0 1],1,20,2)
%  HW   [t,y,ye]=predcorr([0 6],0.5,20,2)
function [t,y,ye]=predcorr(inter,ic,n,s)
h=(inter(2)-inter(1))/n;
% Start-up phase
ye(1) = ic;
y(1,:)=ic;t(1)=inter(1);
for i=1:s-1 % start-up phase, using one-step method
    t(i+1)=t(i)+h;
    y(i+1,:)=trapstep(t(i),y(i,:),h);
    %
    ye(i+1) = -(1/2)*(exp(t(i+1))) + t(i+1)^2 + 2*t(i+1) + 1;
    %
    f(i,:)=ydot(t(i),y(i,:));
end
for i=s:n % multistep method loop
    t(i+1)=t(i)+h;
    f(i,:)=ydot(t(i),y(i,:));
    y(i+1,:)=ab2step(t(i),i,y,f,h); % predict
    f(i+1,:)=ydot(t(i+1),y(i+1,:));
    y(i+1,:)=am% Program 6.8 Adams-Bashforth-Moulton second-order p-c
% Inputs: time interval inter,
% ic=[y0] initial condition
% number of steps n, number of (multi)steps s for explicit method
% Output: time steps t, solution y
% Calls multistep methods such as ab2step.m and am1step.m
% Example usage: [t,y]=predcorr([0 1],1,20,2)
%  HW   [t,y,ye]=predcorr([0 6],0.5,20,2)
function [t,y,ye]=predcorr(inter,ic,n,s)
h=(inter(2)-inter(1))/n;
% Start-up phase
ye(1) = ic;
y(1,:)=ic;t(1)=inter(1);
for i=1:s-1 % start-up phase, using one-step method
    t(i+1)=t(i)+h;
    y(i+1,:)=trapstep(t(i),y(i,:),h);
    %
    ye(i+1) = -(1/2)*(exp(t(i+1))) + t(i+1)^2 + 2*t(i+1) + 1;
    %
    f(i,:)=ydot(t(i),y(i,:));
end
for i=s:n % multistep method loop
    t(i+1)=t(i)+h;
    f(i,:)=ydot(t(i),y(i,:));
    y(i+1,:)=ab2step(t(i),i,y,f,h); % predict
    f(i+1,:)=ydot(t(i+1),y(i+1,:));
    y(i+1,:)=am1step(t(i),i,y,f,h); % correct
    %
    ye(i+1) = -(1/2)*(exp(t(i+1))) + t(i+1)^2 + 2*t(i+1) + 1;
    %
end
plot(t,y,'k--x',t,ye)
title(' MultiStep  HW05  prob 3 ')
xlabel(' Time ')
ylabel(' y(t)    x = predcorr ')
function y=trapstep(t,x,h)
%one step of the Trapezoid Method from section 6.2
z1=ydot(t,x);
g=x+h*z1;
z2=ydot(t+h,g);
y=x+h*(z1+z2)/2;
function z=ab2step(t,i,y,f,h)
%one step of the Adams-Bashforth 2-step method
z=y(i,:)+h*(3*f(i,:)-f(i-1,:))/2;
function z=am1step(t,i,y,f,h)
%one step of the Adams-Moulton 1-step method
z=y(i,:)+h*(f(i+1,:)+f(i,:))/2;
function z=ydot(t,y) % IVP
%z=t*y+t^3;
z=y-t^2+1;
%1step(t(i),i,y,f,h); % correct
    %
    ye(i+1) = -(1/2)*(exp(t(i+1))) + t(i+1)^2 + 2*t(i+1) + 1;
    %
end
plot(t,y,'k--x',t,ye)
title(' MultiStep  HW05  prob 3 ')
xlabel(' Time ')
ylabel(' y(t)    x = predcorr ')
function y=trapstep(t,x,h)
%one step of the Trapezoid Method from section 6.2
z1=ydot(t,x);
g=x+h*z1;
z2=ydot(t+h,g);predcorr
y=x+h*(z1+z2)/2;
function z=ab2step(t,i,y,f,h)
%one step of the Adams-Bashforth 2-step method
z=y(i,:)+h*(3*f(i,:)-f(i-1,:))/2;
function z=am1step(t,i,y,f,h)
%one step of the Adams-Moulton 1-step method
z=y(i,:)+h*(f(i+1,:)+f(i,:)predcorr)/2;
function z=ydot(t,y) % IVP
%z=t*y+t^3;
z=y-t^2+1;
%