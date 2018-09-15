%my_vis_likelihood.m
clc;
clear
set(gca,'FontSize',20)
mydata=load('/home/litvina/111gsl/Matern_cov/L.txt');

plot(mydata(:,1), mydata(:,3),'-.rs','LineWidth',3,                'MarkerSize',10)
hold all
plot(mydata(:,1), mydata(:,4),'-bs','LineWidth',3,                'MarkerSize',10)
hold all
plot(mydata(:,1), mydata(:,5),'--ks','LineWidth',3,                'MarkerSize',10)
hold all



xlabel('parameter \theta, truth \theta*=12'); 
ylabel('Log-likelihood(\theta )');
title('Shape of Log-likelihood(\theta)');
legend('log(det(C))', 'z^TC^{-1}z', 'Log-likelihood');
%xlabel('$n$','Interpreter','latex'