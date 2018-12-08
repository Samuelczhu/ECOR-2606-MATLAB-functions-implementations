function [x, flag, i] = guassSeidel(A,b,maxI,tol,x0)
%guassSeidel: solve Ax=b using Guass Seidel iteration 
%Inputs:
%   A: the sqaure matrix A
%   b: the column matrix b
%   maxI: the maximum loop times 
%   tol: the tolorence
%   x0: the initial guess; if nothing is enter, defualt is zero vector
%Outputs:
%   x: the solution matrix x
%   flag: 1 is converged, 0 is diverged
%   i: the loop times to solve the matrix

if nargin<5 %checking for number of inputs
    x0=zeros(size(b)); %the default x0 is zeros vector
end

%checking for dimensions
[ra,ca]=size(A);
[rb,cb]=size(b);
if ra~=ca || ra~=rb || cb~=1 %checking for invalid dimensions
    error('bad dimension'); %complain to user
end

%create the c and d matrix
c=zeros(size(A)); %pre-allocate memory for c
d=zeros(size(b)); %pre-allocate memory for d
for i=1:ra %loop through the row
    if A(i,i)==0 %zero pivot
        error('zero diagonal elements'); %complain to user
    end
    c(i,:) = -A(i,:)/A(i,i); %calculating elements in matrix c
    c(i,i)=0; %the pivot of c is zero
    d(i)=b(i)/A(i,i); %caclulate for d
end

%loop to solve for soltion
x=x0; %prepare to loop
for i=1:maxI %loop maxI times to solve
    xold=x; %assign x to xold
    for j=1:ra %loop over the row in matrix
        x(j)=c(j,:)*x+d(j); %solve for x
    end
    if norm(x-xold)<tol %check for meet the tolerence requirement
        flag=1; %we converged! lucky *_*
        return; %finished
    end
    %ready for next loop
end
flag=0; %unlucky, we diverged #_#
end