function [hasil_error, res] = cubic_spline_hermit(x)
	y_plot = [];
	x_len = length(x);
	isnatural = 'tengah';
    res = [];
    s = zeros(length(x)-1,1);
    for i=1:x_len-1
        x1 = x(i);
        x2 = x(i+1);
        if i == 1
        	isnatural = x1;
        elseif i == x_len-1
        	isnatural = x2;
        else
        	isnatural = 'tengah';
        end
        abcd = interpolate(x1, x2, isnatural)';
        res = [res;abcd];
        x_test = (x1+x2)/2;
        hermite_y = [x_test**3; x_test**2; x_test; 1];
        hermite_y = abcd * hermite_y;
        s(i) = hermite_y;
        actual_y = runge(x_test);
        hasil_error(i) = abs( (actual_y - hermite_y) / actual_y );
    end 
    hasil_error = max(hasil_error);
end