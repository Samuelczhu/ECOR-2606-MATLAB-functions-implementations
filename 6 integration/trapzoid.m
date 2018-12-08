function [I] = trapzoid(x,y)
%trapzoid: evaluate integration x,y with composite trapzoidal rule
%same as MATLAB trapz()
%Input:
%   x = data x
%   y = data y
%Output:
%   I = integration with trapzoidal rule

n = length(x); %get length
if n~=length(y) %check for invalid length
    error('length of x and y must be the same');
end

I=0; %initialize sum
for i=2:n %traverse through vector
    I = I + (y(i)+y(i-1))*(x(i)-x(i-1))/2; %sum the area of trapzoid
end
end