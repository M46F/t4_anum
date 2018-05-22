disp("start");
t = [-1; -0.75; -0.5; -0.25; 0; 0.25; 0.5; 0.75; 1];
y = sin(pi*t);
p = newton_interpolation(t',y');
lin_space_1 = linspace(-1,1,100);
lin_space_2 = linspace(-2,2,100);

real = [];
polim = [];
errors = [];
for temp = lin_space_1
 real_res = sin(pi*temp);
 polim_res = p(temp);
 error = abs(real_res - polim_res) / real_res;
 errors = [errors error];
 
 real = [real real_res];
 polim = [polim polim_res];
end
[max_e, index_error] = max(errors);
avg_e = mean(errors);

fprintf("from -1 to 1\n");
fprintf("max error: %d\n", max_e);
fprintf("max error index: %d\n", index_error);
fprintf("max error happened when t= %d\n", lin_space_1(index_error));
fprintf("max error sin(pi*t)=: %d\n", real(index_error));
fprintf("max error p(t)=: %d\n", polim(index_error));
fprintf("avg error: %d\n", avg_e);

hold on;
plot(t,y,'ob');
plot(lin_space_1,real,'-b');
plot(lin_space_1,polim,'-r');
title('Newton Interpolation: Uniform spaced nodes from -1 to 1');
legend('samples', 'real result', 'interpolation');
figure;




real = [];
polim = [];
errors = [];
for temp = lin_space_2
 real_res = sin(pi*temp);
 polim_res = p(temp);
 error = abs(real_res - polim_res) / real_res;
 errors = [errors error];
 
 real = [real real_res];
 polim = [polim polim_res];
end
[max_e, index_error] = max(errors);
avg_e = mean(errors);

fprintf("from -2 to 2\n");
fprintf("max error: %d\n", max_e);
fprintf("max error index: %d\n", index_error);
fprintf("max error happened when t=: %d\n", lin_space_2(index_error));
fprintf("max error sin(pi*t)=: %d\n", real(index_error));
fprintf("max error p(t)=: %d\n", polim(index_error));
fprintf("avg error: %d\n", avg_e);

hold on;
plot(t,y,'ob');
plot(lin_space_2,real,'-b');
plot(lin_space_2,polim,'-r');
title('Newton Interpolation: Uniform spaced nodes from -2 to 2');
legend('samples', 'real result', 'interpolation');