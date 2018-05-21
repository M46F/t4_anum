function res = cubic_spline_hermit(x)
	y_plot = [];
	x_len = length(x);
	isnatural = 'tengah';
    res = [];
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
        abcd = interpolate(x1, x2, isnatural);
        res = [res;abcd'];
        x_test = (x1-x2)/2
        
    end 
end