clc;
clear;

n1=4;
n=4*n1*n1;
a=-0.15;
b=0.15;
l=1:1:sqrt(n);
r=1:1:sqrt(n);
%gerate values from the uniform distribution on the interval [a,b]: r = a + (b-a).*rand(100,1);
[l2,r2] = meshgrid(l,r);
x=a+(b-a).*rand(1,n)-0.5;
y=a+(b-a).*rand(1,n)-0.5;
l2(:) = (l2(:))/sqrt(n);
r2(:) = (r2(:))/sqrt(n);
plot(l2(:),r2(:), '*');
hold all;
x = l2(:)+x'/sqrt(n);
y = r2(:)+y'/sqrt(n);

plot(x,y, '*')

