function [xr] = newton(f, df, x0, Edes)
%newton: find the root of the function f using Newon-Raphson method
%Inputs:
%   f: the function f for root finding
%   df: the derivative of the function f
%   x0: the initial guess x
%   Edes: the desired error
%Ouputs:
%   xr: the root of the function f near the initial guess

for i=1:100 %maximum loop 100 times for root finding
    xr=x0-f(x0)/df(x0);
    if abs(xr-x0)<=Edes %meet the error requirement
        return; %return the function because the requirement is met
    end
    x0=xr; %x0 is now the xr; ready for the next iteration
end
%if here is reached, that implies the root wasn't met the requiment in 100
%loops
error('maximum number of loops reached');
end