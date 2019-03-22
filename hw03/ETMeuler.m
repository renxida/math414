%Explicit trapezoidal method for integrating first order ODE
% t(1) = initial time
% w(1) = initial condition
% h = time step size
% n = number of time steps
t(1)=0.;
h=0.1;
n=10;
w(1)=1.;
ye(1)=1.;
e(1)=0.;
% Print output title lines
fprintf(1,'Explicit Trap method\n');
fprintf(1,'  t(I)        w(I)          y(I)          e(I)\n');
for i=1:n+1
t(i+1)=t(i)+h;
% Change right hand side f(i) as needed.
f(i)=(w(i)*t(i)+t(i)^3);
f(i+1)=((w(i)+h*f(i))*t(i+1)+t(i+1)^3);
%(a)
%f(i)=t(i);
%f(i+1)=1;
%(b)
w(i+1)=w(i)+(f(i)+f(i+1))*h/2;
% Change exact solution as needed.
ye(i+1)=3*exp(((t(i+1))^2)/2)-t(i+1)^2-2;
%
e(i+1)=w(i+1)-ye(i+1);
% Print output
fprintf(1,'%6.3f  %15.7e %15.7e %10.7f \n',t(i),w(i),ye(i),e(i));
end
%
% Plot results
%subplot(1,2,1)
plot(t,w,'g--x',t,ye,'b--o')
title('Explicit Trap method for ODE')
xlabel('Time')
ylabel(' y(t) ')
%ylabel('Approximate y(t)')
%
%subplot(1,2,2)
%plot(t,ye)
%title('Euler method for ODE')
%xlabel('Time')
%ylabel('Exact y(t)')