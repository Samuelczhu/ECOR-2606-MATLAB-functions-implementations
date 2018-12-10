function [x,y] = midpoint(f,x,y0,dis)
%midpoint: solve differential equation using midpoint method
%Inputs:
%   f = the vector friendly derivative function, i.e. f=@(x) x.*y means dy/dx = x*y
%   x = the x vector, must be evenly spaced
%   y0 = the initial y value
%   dis = display option, 1 for show, 0 for not show, default is 0
%Outputs:
%   x = the x vector, same as input x
%   y = the solution y vector

if nargin<4 %check for inputs
    dis = 0; %default is not show
end

if dis %show table
    fprintf('i\t  xi\t  yi\t  pi\t  yi+1/2\t  slope\n'); %print header
end

n = length(x); %find the length
h = x(2)-x(1); %find the step
y = zeros(1,n); %initialize y vector
y(1) = y0; %initialize y0
for i=1:n %loop to find solution
    pi = f(x(i),y(i)); %find the slope at i
    yi12 = y(i) + pi*(h/2); %find the yi+1/2
    slope = f(x(i)+(h/2),yi12); %find the slope at midpoint
    if i~=n %prevent index out of bound
        y(i+1) = y(i) + slope*h; %find the yi+1
    end
    if dis %show table
        fprintf('%d\t%6.3f\t%6.3f\t%6.3f\t%6.3f\t%6.3f\n',i-1,x(i),y(i),pi,yi12,slope); %show row
    end
end
end