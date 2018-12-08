function [d] = difference(x)
%difference: calculate the difference between adjacent elements in x
%same as MATLAB diff()
%Input:
%   x = the x vector
%   d = the difference vector

d = zeros(1,length(x)-1); %initialize d
for i=1:length(x)-1 %traverse through x
    d(i) = x(i+1)-x(i);
end
end