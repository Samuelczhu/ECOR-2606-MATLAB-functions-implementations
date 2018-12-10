%tests for differetial equation methods

f = @(x,y) x + x*y; %arbitrary function
x = 0:0.5:3; %arbitrary x vector
y0 = -2; %arbitrary y vector
[xo,yo] = ode45(f,x,y0); %ode45, the solution from MATLAB
[xe,ye] = eulerm(f,x,y0,1); %euler method
[xh,yh] = heuns(f,x,y0,1); %heuns method
[xm,ym] = midpoint(f,x,y0,1); %midpoint method
[xr,yr] = RK4(f,x,y0,1); %classical 4th order runge kuta method
plot(xo,yo,'k',xe,ye,'b',xh,yh,'r',xm,ym,'g',xr,yr,'y'); %plot the graph