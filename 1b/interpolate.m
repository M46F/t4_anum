function abcd = interpolate(x1, x2, isnatural)
	A1 = [x1**3, x1**2, x1, 1];
	A2 = [x2**3, x2**2, x2, 1];
	A3 = [3*x1**2, 2*x1, 1, 0];
	A4 = [3*x2**2, 2*x2, 1, 0];
	b1  = runge(x1);
	b2  = runge(x2);
	b3  = find_grad(@runge, x1);
	b4  = find_grad(@runge, x2);
	% jika xi = 0 atau xi = n
	if isnatural == 'tengah'
		A = [A1;A2;A3;A4];
		b = [b1;b2;b3;b4];
	else
		A5 = [6*isnatural, 1, 0, 0];
		A = [A1;A2;A3;A4;A5];
		b = [b1;b2;b3;b4;0];
	end
	abcd = A\b;
end