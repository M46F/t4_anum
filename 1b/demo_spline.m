disp("Yahallo");
first = -4;
last = 4;
% n_point = [2,4,8,16,32,64,128,256,512,1024];
n_point = [2,4,8,16,32];
len_n = length(n_point);
for i=1:len_n
	xx = linspace(first, last, n_point(i));
	e = cubic_spline_hermit(xx);
end