function [x,y] = heuns(f,x,y0,dis)
%heuns: solve the differenctial equation using heun's method
%Inputs:
%   f = the derivative function, i.e. f=@(x) x*y means dy/dt = x*y
%   x = the x vector, must be evenly spaced
%   y0 = initial y value
%   dis = display option, 1 for show, 0 for not show
%Outputs:
%   x = the x vector, same as input
%   y = the solution y vector corresponding to x vector

if nargin<4 %check for input
    dis = 0; %default dis is false
end

if dis %show the table
    fprintf('i\t  xi\t  yi\t  pi\t  pi+1\t  slope\n'); %print the header
end

n = length(x); %find the length
h = x(2)-x(1); %find the step
y = zeros(1,n); %initialize the y vector
y(1) = y0; %initialize y0
for i=1:n %loop to find solution
    pi = f(x(i),y(i)); %find the derivative at i
    yi1 = y(i)+pi*h; %find the yi+1 using euler method
    if i~=n
        pi1 = f(x(i+1),yi1); %find the derivative at i+1
    else 
        pi1 = NaN;
    end
    slope = (pi+pi1)/2; %find the average slope
    if i~=n %not the last loop
        y(i+1) = y(i)+slope*h; %find the true yi+1
    end
    if dis %shoe table
        fprintf('%d\t%6.3f\t%6.3f\t%6.3f\t%6.3f\t%6.3f\n',i-1,x(i),y(i),pi,pi1,slope); %show row
    end
end
end
