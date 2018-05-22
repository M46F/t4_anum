function res = adaptive_simpson(f, a, b, tol)
  total = simpson_rule(f,a,b);
  res = adaptive_simpson_helper(f, a, b, tol, total);
  res(2) += 1;
endfunction

function res = adaptive_simpson_helper(f, a, b, tol, total)
  c = (a+b)/2;
  left = simpson_rule(f, a, c);
  right = simpson_rule(f, c, b);
  
  if abs(left + right - total) <= 15 * tol
    res = [left + right + (left + right - total)/15, 2];
  else
    res = adaptive_simpson_helper(f, a, c, tol/2, left) + adaptive_simpson_helper(f, c, b, tol/2, right);
  endif
endfunction
