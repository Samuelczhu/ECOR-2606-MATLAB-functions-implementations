function [r] = correlate(x,y, f)
%correlate: find the correlation coefficient r from x,y for straight line
%fit only
%Input:
%   x = the data x
%   y = the data y
%   f = the fit function
%Output:
%   r = the correlation coefficient r

if length(x)~=length(y) %check for invalid length
    error('length of x,y must be same');
end

ym = mean(y); %calculate the mean of y
st = sum((y-ym).^2); %calculate the sum of square data residual
sr = sum((y-f(x)).^2); %calculate the sum of squre estimate residual
r = sqrt((st-sr)/st); %calculate correlation coefficient
end