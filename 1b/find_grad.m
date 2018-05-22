function [g]=find_grad(f, X)
  n = length(X);
  g = zeros(n, 1);
  h=sqrt(eps);
  for k=1:n
    x1=X;
    x1(k)=x1(k)+h*i;
    g(k)=imag(f(x1))/h;
  end
end