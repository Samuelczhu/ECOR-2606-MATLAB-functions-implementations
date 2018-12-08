function [xr] = modiSecant(f,x0,Edes,dx)
%modiSecant: find the root of the function f using modified secant method
%Inputs:
%   f: the function to find root
%   x0: the initial guess
%   Edes: the desired error
%   dx: the change of x, smaller the value yeilds higer precision,
%   default is 10^-6
%Output:
%   xr: the root of the function f correspond to the initial guess

if nargin < 4 %number of argument is less than 4
    dx=10^-6; %default delta is 10^-6, which is very small :)
end
for i=1:100 %maximum 100 loops for root finding
    xr = x0 - dx*f(x0)/(f(x0+dx)-f(x0)); %the formula of modified secant method
    if abs(xr-x0)<Edes || f(xr)==0 %the root met the error requirement or f(xr) i zero, lucky!!:)
        return; %return the function because i am so lucky
    end
    x0=xr; %set the xr to x0, ready for the next iteration :)
end
%if here is reached, i am out of luck
error('maximum iteration reached');
end