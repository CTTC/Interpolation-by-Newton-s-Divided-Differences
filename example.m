clear all;clc;
x=0.6:0.1:1.0;
y=[1.433329 1.632316 1.896481 2.247908 2.718282];
u=[0.82 0.98];
[poly,v]=NewtonInterp(x,y,u);
figure(1);
plot(x,y,'r*',u,v,'go',w,z);  %Plot the interpolated points and given points
fun=sym2poly(poly);
disp(['The function is ' poly2str(fun,'x');] );
figure(2);
ezplot(poly,[0.5,1])    % Plot the symbolic function to test its correctness

