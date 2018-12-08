function [I] = simpson13(x,y)
%simpson13: evaluate integration x,y with composite simpson 1/3 rule
%Note: must be odd number of data point
%Input:
%   x = data x
%   y = data y
%Output:
%   I = the integration with composite simpson 1/3

n = length(x); %get length
if n~=length(y) || mod(n,2)==0 %check for invalid length
    error('invalid length');
end

h = (x(n)-x(1))/(n-1); %calculate step
sum=0; %initialize sum
for i=2:n-1 %traverse through y
    if mod(i,2)==0 %case 1
        sum = sum+4*y(i); %from formula
    else %case 2
        sum = sum+2*y(i); %from formula
    end
end
sum = sum + y(1)+y(n); %finish sum
I = (h/3)*sum; %calculate integration
end
