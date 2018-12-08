function [xout] = richardson(x, dis)
%richardson: calculate the richardson extrapolation using romberg pyramid
%Input:
%   x = the initial vector
%   dis = display process, 1 to display, 0 not to display, default 0
%Output:
%   xout = the best estimate

if nargin<2 %did not input display
    dis=0; %default is 0
end

n = length(x); %length of vector
A = zeros(n,n); %initialize A
A(:,1) = x; %initialize first column of A
for j=2:length(x) %traverse through column
    for i=1:length(x)+1-j %traverse through row
        A(i,j) = (4^(j-1)*A(i+1,j-1)-A(i,j-1))/(4^(j-1)-1); %formula from formula sheet
    end
end
if dis %show process, ignore 0
    A
end
xout = A(1,n); %extract solution
end