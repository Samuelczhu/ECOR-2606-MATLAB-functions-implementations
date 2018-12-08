%arbitrary data points
x = [1,3,5,-23.6,9];
y = [2,-4,6,8,10];

p=polyfit(x,y,3) %show the polyfit coefficient

%define polynomial function for general fit
f1 = @(x) x.^3;
f2 = @(x) x.^2;
f3 = @(x) x;
f4 = @(x) 1;
f = {f1,f2,f3,f4};

fit = generalfit(x,y,f) %show the general fit coefficient