function [I] = simpson38(x,y)
%simpson38: calculate integration x,y with simpson 3/8 rule
%Note: must be four data points
%Input:
%   x = data x
%   y = data y
%Output:
%   I = integration with simpson 3/8 rule

n = length(x); %get length
if n~=length(y) || n~=4 %check for invalid length
    error('invalid length');
end

I = (x(n)-x(1)) * (y(1)+3*y(2)+3*y(3)+y(4))/8; %from formula
end