function [xr] = bisect(f, xl, xh, Edes)
%bisect: find the root of the function using bisection method
%note: there must be a root between xl and xh
%Inputs:
%   f: the function f for root finding
%   xl: the lower bound x
%   xh: the upper bound x
%   Edes: the desire error
%Output:
%   xr: the root of the function

for i=1:1000 %maximum loop times for searching the root
    xr=(xl+xh)/2; %assume the middle point is the root
    if (xh-xl)/2 <= Edes %the maximum error is less than the error desired
        return; %return the function because the root met the requirement
    end
    if sign(f(xr)) ~= sign(f(xl)) %the sign of the function of xr and xl is different
        %this implies that the root is between xr and xl
        xh=xr; %so set the x high to x root
    else %the zero is between xr and xh
        xl=xr; %set the x low to x root
    end
end
%if here is reached, that meam no root met the requirement after 1000 loops
error('maximum loop reached'); 
end