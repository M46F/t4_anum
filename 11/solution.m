disp("start");
t = [-1; -0.75; -0.5; -0.25; 0; 0.25; 0.5; 0.75; 1];
y = sin(pi*t);
p = newton_interpolation(t',y');
lin_space = linspace(-2,2,100);

real = [];
polim = [];


errors = [];
for temp = lin_space
 real_res = sin(pi*temp);
 polim_res = p(temp);
 error = abs(real_res - polim_res) / real_res;
 errors = [errors error];
 
 real = [real real_res];
 polim = [polim polim_res];
end

hold on;
plot(t,y,'ob');
plot(lin_space,real,'-b');
plot(lin_space,polim,'-r');
title('Newton Interpolation: Uniform spaced nodes');
legend('samples', 'real result', 'interpolation');