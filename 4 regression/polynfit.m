function [p] = polynfit(x,y,order)
%polynfit: find coefficient for order polynomial that best fit the data,
%same as MATLAB polyfit
%Input:
%   x = the data x
%   y = the data y
%Output:
%   p = the vector p contains the coefficients

n = length(x); %get the length
if n~=length(y) %check for invalid length
    error('length for x,y must be same');
end

if order>=n %check for bad order
    error('order must be less than the length of vector');
end

%calculate the matrix provided at regression p.40
A = zeros(order+1,order+1); %initialize matrix x
for i=1:order+1 %traverse through row
    for j=1:order+1 %traverse through column
        A(i,j) = sum(x.^((order+1)*2-i-j)); %caluclate the element in A
    end
end

b = zeros(order+1,1); %initialze matrix b
for i=1:order+1 %traverse through b
    b(i) = sum(x.^(order+1-i).*y); %calculate element b
end

p = A\b; %calculate coeffient p
p = p'; %transpose p to row vector

end