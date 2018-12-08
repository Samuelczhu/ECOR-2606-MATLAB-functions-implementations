function [x] = naiveGuass(A,b)
%naiveGuass: solves the matrix Ax=b for x using naive guass method
%Inputs:
%   A: the square matrix A
%   b: the column matrix b
%Ouput
%   x: the solution column matrix x

%check for the dimension of the matrix A and b
[ra,ca] = size(A); %get size of the row and column of matrix A
[rb,cb] = size(b);
if ra~=ca || ra~=rb || cb~=1 %stupid dimension found
    error('bad dimension'); %complain to the user
end

c = [A b]; %combine matrix A and b
n=ca+1; %use to select the row, n is the column number of c
%naive guass method start from forward elimination to row echelon form
%becuase this method is too young too naive
for i=1:ra-1 %aka, this loop is for the pivot row
    for j=i+1:ra %aka, this loop is for the row below the pivot row
        c(j,i:n) = c(j,i:n) - c(j,i)/c(i,i)*c(i,i:n); %row reduce :)
    end
end

%now start the backward subsitution @_@
x=zeros(ra,1); %pre-allocate the x matrix
x(ra) = c(ra,n)/c(ra,ca); %find the last x value
for i=ra-1:-1:1 %looping backward @_@
    x(i) = (c(i,n)-c(i,i+1:ca)*x(i+1:ra))/c(i,i); %backward subsitution #_#
end
end