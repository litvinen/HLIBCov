clc;
clear;
set(gca,'FontSize',20);
myf=load('/home/litvina/111gsl/Matern_cov/111theta.txt', '-ascii');
%Hrank=9:2:29;
Hrank=myf(:,2);
%x(find(diff(x)))
Hrank=unique(Hrank);
R=size(Hrank,1);
theta=myf(:,3);
for i=1:R
    temp=theta(myf(:,2)==Hrank(i),:);
    mymean(i)=mean(temp);
    mymedian(i)=median(temp);
    mystd(i)=std(temp);
end    



theta_truth = 0.3*ones(1,40);
%errorbar(Hrank, mymean, mystd, 'xr','LineWidth',3,'MarkerSize',10);
errorbar(Hrank, mymean, mystd,'xr' ,'LineWidth',3,'MarkerSize',10);

hold all
plot(theta_truth, 'LineWidth',3)
xlabel('approx. rank');
ylabel('parameter \theta');
%xlabel('$n$','Interpreter','latex'
hold all;
plot(Hrank, mymedian, 'X', 'LineWidth',3,'MarkerSize',10)

%errorbar(Hrank, mymedian, mystd, '+b','LineWidth',3);
legend('mean', 'truth','median')


