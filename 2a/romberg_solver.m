format long;n = [8, 64];f = @(x) e^x;g = @(x) cos(x);for i = 1:length(n)  tic;  [res_f, err_f] = romberg(f, 0, 1 , n(i));  [res_g, err_g] = romberg(g, 0, pi/2, n(i));  res = res_f * res_g;  err = err_f * err_g;  time = toc;  disp(i)  disp(time)  disp(res)  disp(err)endfor