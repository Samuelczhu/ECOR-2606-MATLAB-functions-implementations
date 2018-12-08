function [yi] = eulermethod(f,x1,y1,h,maxI,dis)
%eulermethod: calculate xout using euler method
%Input:
%   f = the derivative function f
%   x1 = initial x
%   y1 = initial y
%   h = step h
%   maxI = maximum iteration
%   dis = display: 1 to show, 0 not to show, default is 0
%Output:
%   yout = y from euler method after maxI iteration

if nargin<5 %dis is not inputed
    dis=0; %default is 0
end


yi = y1; %initialize yi
xi = x1; %initialize xi

if dis %check for display
    fprintf('i\t\txi\t\t\tyi\n'); %print the header
    fprintf('0\t%f\t%f\n',xi,yi); %print the first row
end

for i=1:maxI %iterate to find yout
    yi = yi+f(xi,yi)*h; %formula
    xi = xi+h; %increment xi
    if dis
        fprintf('%d\t%f\t%f\n',i,xi,yi); %show row
    end
end
end