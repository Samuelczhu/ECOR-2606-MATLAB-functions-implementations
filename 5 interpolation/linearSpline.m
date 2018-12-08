function [yout] = linearSpline(x,y,xin)
%linearSpline: estimate yout value corresponding to xin using linear spline from x,y
%Input:
%   x = the x data
%   y = the y data
%   xin = the interest data xin
%Output
%   yout = the estimated yout value corresponding to xin

n = length(x); %get the length
if n~= length(y) %check for invalid length
    error('invalid length of x,y');
end

yout = zeros(1,length(xin)); %initialize yout
minx = min(x); %min x
maxx = max(x); %max x
for i = 1:length(xin) %travese through xin
    if xin(i)<minx || xin(i)>maxx %making sure that we are interpolating
        yout(i) = NaN;
    else
        lx = x(1); %lower bound x
        ly = y(1); %lower bound y
        for j = 2:length(y) %travese through j
            hx = x(j); %higher bound x
            hy = y(j); %higher bound y
            if hx>xin(i) %higher bounds found
                break;
            end
            lx = hx; %update lower bounds
            ly = hy;
        end %now the lower and upper bounds are found
        yout(i) = ly + (hy-ly)/(hx-lx) * (xin(i)-lx); %calculate element yout
    end 
end
end