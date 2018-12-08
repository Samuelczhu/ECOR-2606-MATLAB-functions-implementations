function [x,flag,i] = jacobi(A,b,maxI,tol,x0)
%jacobi: solve Ax=b using Jacobi iteration
%Inputs:
%   A: the square matrix A
%   b: the column matrix b
%   maxI: the maximum loop time
%   tol: the tolorence
%   x0: the initial guess; if nothing enter, defualt is zero vector
%Outputs
%   x: the solution column matrix
%   flag: 1 is converged, 0 is diverged
%   i: the loop time to solve

if nargin<5 %not enough input
    x0=zeros(size(b)); %the default x0 is zeros vector
end

%check for dimensions
[ra,ca]=size(A); %getting the size of matrix A
[rb,cb]=size(b); %getting the size of matrix b
if ra~=ca || ra~=rb || cb~=1 %checking whether dimensions is valid
    error('bad dimensions'); %complain to user
end

%construct matrix c and d
c=zeros(size(A)); %pre-allocate memory
d=zeros(size(b)); %pre-allocate memory
for i=1:ra %loop over the row
    if A(i,i)==0 %bad pivot
        error('zero diagonal element'); %complain to user
    end
    c(i,:)=-A(i,:)/A(i,i); %assign value to matrix c
    c(i,i)=0; %the pivot of matrix c is zero
    d(i)=b(i)/A(i,i); %assign value matrix d
end

%loop to find the solution
x=x0; %prepare to loop
for i=1:maxI %loop maximum maxI times
    xold=x; %xold is now x
    x=c*x+d; %aka, the formula
    if norm(x-xold)<tol %check whether we met the tolorence
        flag=1; %we converged!
        return; %lucky, we are finished now
    end
    %ready to loop back
end
flag=0; %unlucky, we diverged @_@
end
    