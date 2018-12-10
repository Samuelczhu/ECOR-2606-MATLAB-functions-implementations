function [x,y] = RK4(f,x,y0,dis)
%RK4: solve differential equation using classic 4th order Rung-Kuta method
%Inputs:
%   f = the vector friendly derivative function, i.e. f=@(x,y) x.*y means dy/dx = x*y
%   x = the x vectors, must be evenly spaced
%   y0 = the initial y value
%   dis = display option, 1 for show, 0 for not show, default is 0
%Outputs:
%   x = the x vector, same as input x vector
%   y = the solution y vectors

if nargin<4 %dis is not inputted
    dis=0; %default is not show
end

if dis %show table
    fprintf('i\t  xi\t  yi\t  k1\t  k2\t  k3\t  k4\t  slope\n'); %print the header
end

n = length(x); %get the length
h = x(2)-x(1); %get the step
y = zeros(1,n); %initialize y vector
y(1) = y0; %set the y0 to y(1)
for i=1:n %loop for solution
    k1 = f(x(i),y(i)); %find k1
    k2 = f(x(i)+(1/2)*h, y(i)+(1/2)*k1*h); %find k2
    k3 = f(x(i)+(1/2)*h, y(i)+(1/2)*k2*h); %find k3
    k4 = f(x(i)+h, y(i)+k3*h); %find k4
    slope = (1/6)*k1 + (1/3)*k2 + (1/3)*k3 + (1/6)*k4; %find slope
    if i~=n %not the last loop
        y(i+1) = y(i)+slope*h; %find the next y
    end
    if dis %show table
        fprintf('%d\t%6.3f\t%6.3f\t%6.3f\t%6.3f\t%6.3f\t%6.3f\t%6.3f\n',i-1,x(i),y(i),k1,k2,k3,k4,slope); %print row
    end
end
end