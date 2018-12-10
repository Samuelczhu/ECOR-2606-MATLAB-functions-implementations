function [x,y] = eulerm(f,x,y0,dis)
%eulerm: solve the oridinary differential equation with euler method
%Inputs:
%   f = the vector friendly differential equation, i.e. f = @(x,y) x.*y means dy/dt = x*y
%   x = the x vectors of interest, step must be consistant
%   y0 = the initial guess y0
%   dis = display table: 1 for show, 0 for not show, default is 0
%Output:
%   x = the x vector, same as input
%   y = the solution y vector corresponding to the x vector

if nargin<4 %input less than 4
    dis=0; %default is not show
end

if dis %show table
    fprintf('i\t  xi\t  yi\t  slope\n'); %print the header
end

n=length(x); %get the length
y = zeros(1,n); %initialize y
y(1) = y0; %assign the initial guess
h = x(2)-x(1); %find the step
for i=1:n %loop through x
    slope = f(x(i),y(i));
    if dis %if display
        fprintf('%d\t%6.3f\t%6.3f\t%6.3f\n',i-1,x(i),y(i),slope);
    end
    if i~=n %not the last loop
        y(i+1) = y(i) + slope*h; %calculate the next y
    end
end
end