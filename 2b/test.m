format long;

eps = [1e-3 1e-4 1e-5];
f = @(x) e^x;
g = @(x) cos(x);

for i = 1:length(eps)
  %disp(["Epsilon + " , num2str(eps(i)]);
  disp(eps(i));
  
  tic;
  l1 = adaptive_simpson(f, 0, 1 ,eps(i))
  l2 = adaptive_simpson(g, 0, pi/2, eps(i))
  res = l1(1) * l2(1)
  toc;
endfor
