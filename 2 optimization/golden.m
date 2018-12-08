function [x] = golden(f, xl, xu, Edes)
%golden: find the x of the minimum of function f using golden-section search
%Inputs:
%   f: the function f to find the minimum
%   xl: the lower bound xl
%   xu: the upper bound xu
%   Edes: the desired error
%Output:
%   x: the x corresponding to the minimum of function f

phi = (1+sqrt(5))/2; %the phi value
%setting up for the first iteration
x1=xl+(phi-1)*(xu-xl); %formula from golden section search
x2=xu-(phi-1)*(xu-xl); %aka, formula again -_-
dx0=xu-xl; % used for error
fx1 = f(x1); %evaluate f(x1)
fx2 = f(x2); %evaluate f(x2)
for i=1:1000 %maximum loop 1000 times to seach for the minimum
    Emax = dx0 * (phi-1)^(i-1)/2; %formula for maximum error
    if Emax<=Edes %met the error requirement
        x = (xl+xu)/2; %x is the mid point according to the
        return; %return now because we are lucky $_$
    end
    if fx1>fx2 %fx1 is greater than fx2
        xu=x1; %upper bound became x1
        x1=x2; %x1 became x2;
        fx1=fx2; %reuse fx2, very efficient @_@
        x2=xu-(phi-1)*(xu-xl); %re-calculate x2 using formula
        fx2=f(x2); %re-calculate fx2
    else %f(x1) is less than f(x2) <or equal to, who knows...>
        xl=x2; %lower bound became x2
        x2=x1; %x2 became x1;
        fx2=fx1; %reuse fx1, very efficient #_#
        x1=xl+(phi-1)*(xu-xl); %re-calculate x1 using formula
        fx1=f(x1); %re-calculate fx1
    end
    %ready for the next iteration :)
end
%if here is reached, that mean we are not lucky !_!
error('maximum loops reached');
end