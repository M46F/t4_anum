function p = newton_interpolation(t,y)
  n = length(t);
  f = [ y'  zeros(n,n-1)];
  for r=2:n
    for c=2:r
      f(r,c) = (f(r,c-1) - f(r-1,c-1) ) / (t(r) - t(r-c+1));
    end
  end
  f
  c = @(x) [f(1,1)];
  interp = @(x) [(x - t(1))];
  for i = 2:n
    c = @(x) [c(x) f(i,i)* interp(x)];
    interp = @(x) interp(x)*(x-t(i));
  end
  p = @(x) sum( c(x) );
end
