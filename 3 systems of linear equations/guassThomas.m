function [x] = guassThomas(b,d,a,r)
%guassThomax: solve the x for the tridiagonal matrix
%note: this method ONLY work for tridiagonal matrix
%Inputs:
%   b: the vector below the diagonal vector
%   d: the diagonal vector
%   a: the vector above the diagonal vector
%   r: the vector on the right of the equation
%Output:
%   x: the solution vector

n = length(d); %the size of the tridiagonal matrix
%forward elimination
for i=2:n %looping forward
    factor = b(i)/d(i-1); %find the factor
    d(i) = d(i)-factor*a(i-1); %row reducing
    r(i) = r(i)-factor*r(i-1); %row reducing again @_@
end
%backward subsitution
x=zeros(n,1); %pre-allocate memory
x(n)=r(n)/d(n);
for i=n-1:-1:1 %looping backward
    x(i) = (r(i)-x(i+1)*a(i))/d(i); %solving the x value
end