function [brackets] = increSearch(f, min, max, points)
%increSearch: find all the bounds that contain a zero in between
%Inputs:
%   f: the function to search
%   min: the minimum x
%   max: the maximum x
%   points: the points between min and max; more points will be more
%   accurate but slower to search
%Ouput:
%   brackets: the 2d vectors that contains the bounds for zeros

x = linspace(min,max,points); %create a x vector
index=1; %index for the row of the brackets
for i=1:(points-1) %loop over the element in x, except for the last element
    if sign(f(x(i))) ~= sign(f(x(i+1))) %the function changed sign, imples there is a zero in between
        brackets(index, 1) = x(i); %lower x of the bound
        brackets(index, 2) = x(i+1); %upper x of the bound
        index = index+1; %increase the index for the row
    end
end
end