clc;
clear;

cd '/home/litvina/hlibpro-2.6/examples/'
A = load('A.mat')
L = load('L.mat')
u = load('U.mat')
v = load('Uafter.mat')

n=size(A.A,1);


%spy(A.A)
B=(chol(A.A));
spy(B)
norm(A.A-B'*B,'fro')
y1=B'*u.u;
norm_y1=norm(y1, 'fro')
%figure
%spy(L.L)

y2=L.L*u.u;
norm_y2=norm(y2, 'fro')
norm_dif12=norm(y1-y2,'fro')
