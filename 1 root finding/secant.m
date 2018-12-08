function [xr] = secant(f,x0,x1,Edes)
%secant: find the root of the function f using secant method
%Inputs:
%   f: the function f to find the root
%   x0: the random guess point x0
%   x1: the random guess point x1
%   Edes: the desired error
%   notes: there may or may not have a zero between x0 and x1
%Ouput:
%   xr: the root of function f based on the two initial guesses

for i=1:100 %maximum 100 time to search
    xr = x1 - f(x1)*(x0-x1)/(f(x0)-f(x1)); % the formula of secant method
    if abs(xr-x1)<=Edes || f(xr)==0 %met the required error or f(xr) is zero, lucky:)
        return; %return the function because the zero is found
    end
    x0=x1; %set the x1 to x0
    x1=xr; %set the xr to x1
    % ready for the next iteration :)
end
%if here is reached, that mean no root found to met the requirement
error('maximum loop reached');
end