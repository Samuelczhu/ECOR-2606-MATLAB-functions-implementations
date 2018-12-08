function [x] = guassJordan(A, b)
%guassJordan: solve Ax=b using Guass-Jordan elimination
%Inputs:
%   A: the square matrix A
%   b: the column matrix b
%Ouput:
%   x: the solution matrix x

%check the stupid dimension
[ra,ca]=size(A);%get the number of row and column of A
[rb,cb]=size(b);%м╛ио for matrix b
if ra~=ca || ra~=rb || cb~=1
    error('bad dimension'); %stupid dimensions found
end

c=[A b]; %combine matrix A and b
n=ca+1; %the number of column of matrix c
%forward elimination with partial pivoting
for i=1:ra-1 %loop for pivot row :)
    [p, j]=max(abs(c(i:ra,i))); %find the appropriate pivot and its position
    if j~=1 %oops, the position is wrong
        temp=c(i,:);%ready to swap
        c(i,:)=c(i+j-1,:); %swapping
        c(i+j-1,:)=temp; %swapped
    end
    if c(i,i)==0 %oops, still zero
        error('no unique solution'); %complain to user
    end %partial pivoting, bye for now +_+
    for j=i+1:ra %loop for the row below the pivot row
        c(j,i:n) = c(j,i:n) - (c(j,i)/c(i,i))*c(i,i:n); %row reducing
    end
end

%backward elimination
for i=ra:-1:2 %row for backward pivot
    for j=i-1:-1:1 %row for backward row above the pivot row
        c(j,i:n)=c(j,i:n)-(c(j,i)/c(i,i))*c(i,i:n); %row reducing
        c(j,i)=0; %prevent error from minus same, or close to same, value @_@
    end
end
%normalize
for i=1:ra %loop over each row
    c(i,:)=c(i,:)/c(i,i); %make all the pivots one
    c(i,i)=1; %it is one anyway *_*
end
x=c(:,n); %extracting the value for x
end    