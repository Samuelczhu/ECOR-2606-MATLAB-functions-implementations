function [m,b,r2] = linregr(x,y,dis)
%linregr: calculate the a, b, and r2 from given data sets
%Input:
%   x = the data x
%   y = the data y
%   dis = 0 for not plot, 1 for plot, default is 0
%Output:
%   m = slope, the ceofficient of y=mx+b
%   b = b, the coefficient of y=mx+b

if nargin<3 %user do not enter dis
    dis=0; %default is zero
end

if length(x)~=length(y) %check for valid length
    error('invalid length');
end

n = length(x); %get the length x
sxy = sum(x.*y); %caluculate sum of xiyi
sx = sum(x); %calculate sum of x
sy = sum(y); %calculate sum of y
sx2 = sum(x.^2); %calculate sum of x^2

%determine the best fit line
m = (n*sxy-sx*sy)/(n*sx2-sx^2); %caluclate m
b = (sx2*sy-sx*sxy)/(n*sx2-sx^2); %calculate b

%calculate the coefficient of determination r2
ym = mean(y); %caluclate the mean of y
st = sum((y-ym).^2); %calculate sum of squres of the data residuals
sr = sum((y-b-m*x).^2); %calculate sum of the squres of the estimate residuals
r2 = (st-sr)/(st); %calculate r2

if dis
    xv = linspace(min(x),max(x)); %create vector x
    yv = m*xv+b; %create vector y
    plot(x,y,'o',xv,yv); %plot the data
    title('data points and best fit line'); %add title
    xlabel('x'); %add x label
    ylabel('y'); %add y label
    grid on; %add grid
end
