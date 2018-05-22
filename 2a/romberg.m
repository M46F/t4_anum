# This code is inspired by http://www.math.mcgill.ca/gantumur/math578f09/matlab/romberg.m# the algorithm follows http://www.math.usm.edu/lambers/mat460/fall09/lecture29.pdffunction [res, err]=romberg(fun, a, b, n)  h = b-a;  r(1,1) = h*(feval(fun,a)+feval(fun,b))/2;  for j=2:n    h = h/2;    sum = 0;    for i=1:2^(j-2)      sum = sum + feval(fun, a+(2*i-1)*h);    end    r(j,1) = (r(j-1,1)/2)+(h*sum);    for k = 2:j      r(j,k) = r(j,k-1) + (r(j,k-1)-r(j-1,k-1))/(4^(k-1)-1);    end  end  res = r(n,n);  err= r(n,n) - r(n-1,n-1);end            