clc;
clear;
format long
set(gca,'FontSize',18);
%approx3=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/case3/111theta_case3_rank3.txt', '-ascii');
approx7=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case2_rank7_nu05_129.txt', '-ascii');
approx9=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case2_rank9_nu05_129.txt', '-ascii');

%approx8=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank8.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank16.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/111theta_case3_rank16_sigma2_4.txt', '-ascii');

truth_ell=0.1001;%0.1001; %0.0334%0.2337;%0.1001
truth_nu=0.5;
truth_sigma2=1.0;
size1=size(approx7,1);
size2=size(approx9,1);
%size3=size(approx16,1);
%size4=size(approx3,1);

n=min([size1 size2]);
%n=min([size1 size2 size3 size4]);

% n, nu, l,sigma2 ,|S|_F ,|S|_2,|C|_F ,|C|_2,|S-C|_2 ,|S-C|_2/|S|_2,rank
%ell3=approx3(:,2);

ell7=approx7(:,2);
nu7=approx7(:,1);
sigma2_7=approx7(:,3);

ell9=approx9(:,2);
nu9=approx9(:,1);
sigma2_9=approx9(:,3);

boxplot([ell7(1:n) ell9(1:n)], [7 9]);

%boxplot([ell3(1:n) ell5(1:n) ell8(1:n) ell16(1:n)], [3 5 8 16]);
%boxplot([ell3(1:n) ell8(1:n)], [8 9]);

%boxplot([sigma2_5(1:n) sigma2(1:n) sigma2A(1:n)], [5 8 16]);
%boxplot([nu5(1:n) nu8(1:n) nu16(1:n)], [5 8 16]);
x=0:1:3;
y=truth_ell*ones(size(x));
hold all
plot(x,y,'-r','LineWidth',2);
hold all
ylabel('cov. length');
%ylabel('\nu');
ylim([0.01 0.2])
%title('Dependence on H-matrix ranks, Case 3')
xlabel('H-matrix rank')
save_figure(gcf, 'boxplots_case1', 'figdir', '.', 'fontsize', 12)

%boxplot([ell5(1:n) ell(1:n) ellA(1:n)], [5 8 16]);
%boxplot([sigma2_5(1:n) sigma2(1:n) sigma2A(1:n)], [5 8 16]);
%boxplot([ell5(1:n) nu8(1:n) nu16(1:n)], [5 8 16]);
figure
boxplot([nu7(1:n) nu9(1:n)], [7 9]);
x=0:1:4;
y=truth_nu*ones(size(x));
hold all
plot(x,y,'-r','LineWidth',2);
hold all
%ylabel('cov. length');
ylabel('\nu');
ylim([0.4 0.6])
title('Dependence on H-matrix ranks, Case 1')
xlabel('H-matrix rank')

% 
% allmean=mean(myf);
% allvar=var(myf);
% allstd=std(myf);
% all_cv=allstd./allmean
% R=size(ell, 1);
% ell_mean = mean(ell)
% nu_mean = mean(nu)
% sigma2_mean = mean(sigma2)
% ell_var = var(ell)
% nu_var = var(nu)
% sigma2_var = var(sigma2)
% ell_truth = 0.0334
% nu_truth = 0.5
% sigma2_truth = 1.0
% rel_err_ell_mean=abs(ell_mean-ell_truth)/abs(ell_truth)
% rel_err_nu_mean=abs(nu_mean-nu_truth)/abs(nu_truth)
% rel_err_sigma2_mean=abs(nu_mean-sigma2_truth)/abs(sigma2_truth)
% ell2=ell_truth*ones(R,1);
% plot(ell2, ell,'.')
% 
% hold on
% plot(ell_truth, ell_mean+sqrt(sigma2_var),'*')
% hold on
% plot(ell_truth, ell_mean-sqrt(sigma2_var),'*')
% figure
% plot3(ell,nu,sigma2,'.')
% %errorbar(ell_truth, ell_mean, ell)
% %plot(myf(:,2), myf(:, 3), '-rs','LineWidth',3 , 'MarkerSize', 12 );
% xlabel('A');
% ylabel('B');
% title('AB')
% hold on;
% 
% %save_figure(gcf, 'convergence_nu15_weak', 'figdir', '.', 'fontsize', 12)
% %           b     blue          .     point              -     solid
% %            g     green         o     circle             :     dotted
% %            r     red           x     x-mark             -.    dashdot 
% %            c     cyan          +     plus               --    dashed   
% %            m     magenta       *     star             (none)  no line
% %            y     yellow        s     square
% %            k     black         d     diamond
% %            w     white         v     triangle (down)
% %                                ^     triangle (up)
% %                                <     triangle (left)
% %                                >     triangle (right)
% %                                p     pentagram
% %                                h     hexagram
% %                           
% 
