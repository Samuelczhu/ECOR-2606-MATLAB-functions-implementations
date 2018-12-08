function [xr] = falsePos(f, xl, xh, n)
%falsePos: find the root of function f using false position method
%note: there must be a root in between xl and xh
%Inputs:
%   f: the function to find root
%   xl: the lower bound x
%   xh: the higher bound x
%   n: the times of loop; high the n yeilds more accurate search but takes
%   longer time. If nothing enter, default 100 time
%   note: this method does not allow a desired error
%Ouput:
%   xr: the root of the function between xl and xh
if nargin<4 %input argument less than four
    n=100; %default loop 100 time
end
for i=1:n %loop n times to search for loop
    xr = xh - f(xh)*(xl-xh)/(f(xl)-f(xh)); %the formula of false position
    if sign(f(xr)) ~= sign(f(xl)) %the sign of f between xr and xl changes
        %this implies a zero in between xr and xl
        xh=xr; %set the x high to x root
    else %implies a zero in between xr and xh
        xl=xr; %set the x low to x root
    end
end
end
    