function [d] = grad(x)
%grad: calculate gradient of x, same as MATLAB gradient
%Intput:
%   x = data x
%Output:
%   d = the gradient

n = length(x); %get length
d = zeros(1,n); %initialze d
for i=2:n-1 %traverse through x
    d(i) = (x(i+1)-x(i-1))/2; %from formula
end
d(1) = x(2)-x(1); %from formula
d(n) = x(n)-x(n-1); %from formula
end
