function [pp] = polyderi(p)
%polyderi: calculate the derivative of polynomial
%same as MATLAB polyder()
%Input:
%   p = the coefficient of polynomial
%Output:
%   pp = the coefficient of derivative

n = length(p); %get length
pp = zeros(1,n-1); %initialize pp
for i=n-1:-1:1 %travese through p
    pp(n-i) = p(n-i)*i; %taking derivative of polynomial
end
end
