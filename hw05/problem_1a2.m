function [t,w] = rungekutta_a
h = 0.05;
t(1) = 0;
w(1) = 0;
fprintf(' Step 0: t = %12.8f, w = %12.8f\n', t, w);
for i=1:20
    k1 = h*f(t(i),w(i));
    k2 = h*f(t(i)+h/2, w(i)+k1/2);
    k3 = h*f(t(i)+h/2, w(i)+k2/2);
    k4 = h*f(t(i)+h, w(i)+k3);
    w(i+1) = w(i) + (k1+2*k2+2*k3+k4)/6;
    t(i+1) = t(i) + h;
    fprintf('Step %d: t = %6.4f, w = %18.15f\n', i, t(i+1), w(i+1));
end
%%%%%%%%%%%%%%%%%%
function v = f(t,y)
v = y^2+1;