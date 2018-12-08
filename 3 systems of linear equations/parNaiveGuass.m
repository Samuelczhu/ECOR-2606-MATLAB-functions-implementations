function [x] = parNaiveGuass(A, b)
%parNaiveGuass: solve Ax=b using Guassian elimination with partial pivoting
%Inputs:
%   A: the square matrix A
%   b: the column matrix b
%Ouputs
%   x: the solution column matrix x

%checking for stupid inputs
[ra,ca]=size(A); %get the number of row and column of matrix A
[rb,cb]=size(b); %同上
if ra~=ca || ra~=rb || cb~=1 
    error('bad dimension'); %haha, stupid input found !_!
end

c = [A b]; %combine matrix A and b
n=ca+1; %the number of column of c
%forward elimination with partial pivoting
for i=1:(ca-1)
    [p, k] = max(abs(c(i:ra,i))); %search for the appropriate pivot
    if k~=1 %oops, the largest absolute pivot is not the first one
        temp=c(i,:); %ready to swap
        c(i,:)=c(i+k-1,:); %swapping
        c(i+k-1,:)=temp; %swapped
    end %now the pivot is the largest
    if c(i,i)==0 %pivot is still 0
        error('no unique solution'); %complain to user
    end
    % partial pivoting finished, 开始干正事
    for j=i+1:ra %select the row below the pivot row
        c(j,i:n)=c(j,i:n) - (c(j,i)/c(i,i))*c(i,i:n); %row reducing
    end
end

%backward subsitution
x=zeros(ra,1); %pre-allocate memory location for x
x(ra) = c(ra,n)/c(ra,ca); %find the last x
for i=ra-1:-1:1 %looping backward
    x(i) = (c(i,n)-(c(i,i+1:ca)*x(i+1:ra)))/c(i,i); %backward subsituting
end
end