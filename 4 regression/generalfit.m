function [a] = generalfit(x,y,f)
%bestfit: use general linear fit to fit x,y
%Note: f contains array of function: {f1,f2,f3...}
%Input:
%   x = data point x
%   y = data point y, must be row vector
%   f = the array of funtions to fit, i.e. {@(x)1, @(x)x, @(x)x.^2}
%Output:
%   a = the vector coefficient a: a0f1 + a1f2 + a2f3...

n = length(x); %find the length of data points
if n~=length(y) %check for invalid length
    error('invalid length');
end

m = length(f); %find the length of function vector
Z = zeros(n,m); %initialize Z
for i=1:n %traverse through row
    for j=1:m %traverse through the column
        Z(i,j)=f{j}(x(i)); %find the element in z
    end
end


A = Z'*Z; %find matrix A
b = Z'*y'; %find vector b
a = A\b; %find coefficient vector a
a=a'; %transpose a to row vector
end