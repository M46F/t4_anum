function [err, elapsed] = generate_image(n_point)
	first = -4;
	last = 4;
	xx = linspace(first, last, n_point);
	tic;
	res = cubic_spline_hermit(xx);
	elapsed = toc;
	fig = figure();
	hold on;
	err = [];
	spline_result = [];
	actual_result = [];
	xxx_all = [];
	for i=1:n_point-1
		xxx = linspace(xx(i), xx(i+1), 250);
		xxx_all = [xxx_all, xxx];
		xxx_len = length(xxx);
		a = res(i,1);
		b = res(i,2);
		c = res(i,3);
		d = res(i,4);
		for j=1:xxx_len
			spline_y = a*xxx(j)**3 + b*xxx(j)**2 + c*xxx(j) + d;
			actual_y = runge(xxx(j));
			err = [err, abs( (actual_y - spline_y) / actual_y )];
			spline_result = [spline_result; spline_y];
			actual_result = [actual_result; actual_y];
		end
	end
	plot(xxx_all, actual_result, 'r-');
	plot(xxx_all, spline_result, 'b-');
	legend('Runge', 'Cubic Spline');
	file = strcat(strcat('runge',num2str(n_point)),'.png');
	print(file);
	saveas(fig,file);
	hold off;
	err = max(err);
end