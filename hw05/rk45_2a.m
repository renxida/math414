function rk45
epsilon = 10^(-7);
h = 0.5;
hh(1) = h;
t = 0;
w = 0.5;
tt(1) = t
ww(1) = w;
wer(1)=0;
i = 1;
ii(1) = 1;
fprintf('Step %d: t = %6.4f, w = %18.15f\n', i, t(1), w(1));
tmax = 6;
while t<tmax
h = min(h, tmax-t);
k1 = h*f(t,w);
k2 = h*f(t+h/4, w+k1/4);
k3 = h*f(t+3*h/8, w+3*k1/32+9*k2/32);
k4 = h*f(t+12*h/13, w+1932*k1/2197-7200*k2/2197+7296*k3/2197);
k5 = h*f(t+h, w+439*k1/216-8*k2+3680*k3/513-845*k4/4104);
k6 = h*f(t+h/2, w-8*k1/27+2*k2-3544*k3/2565+1859*k4/4104-11*k5/40);
w1 = w + 25*k1/216+1408*k3/2565+2197*k4/4104-k5/5;
w2 = w + 16*k1/135+6656*k3/12825+28561*k4/56430-9*k5/50+2*k6/55;
R = abs(w1-w2)/h;
delta = 0.84*(epsilon/R)^(1/4);
if R<=epsilon
t = t+h;
w = w1;
i = i+1;
ii(i) = i;
tt(i) = t;
ww(i)= w;
wer(i)= abs(-(1/2)*(exp(t)) + t^2 + 2*t + 1 - w);
hh(i-1) = tt(i)-tt(i-1);
%fprintf('Step %d: t = %6.4f, w = %18.15f\n', i, t, w);
fprintf('Step %d: t = %6.4f, w = %18.15f, ye = %18.15f\n', i, t, w, wer(i));
h = delta*h;
hh(i)=h;
else
h = delta*h;
end
end
subplot(1,3,1)
hold on
plot(tt, g(tt), 'r--x')
plot(tt,ww,'b--o')
hold off
subplot(1,3,2)
plot(tt,wer,'r--x')
subplot(1,3,3)
plot(ii,hh,'b--o')
%%%  ye = -(1/2)*(e^t) + t^2 + 2t + 1
%%%%%%%%%%%%%%%%%%
function v = f(t,y)
v = y-t^2+1;
%%%%%%%%%%%%%%%%%%
function y = g(t)
y = -0.5*exp(t) + t*2 + 2*t + 1;