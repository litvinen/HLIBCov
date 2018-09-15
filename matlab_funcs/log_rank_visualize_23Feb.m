clc;
clear;
format long
figure
set(gca,'FontSize',16);


approx3=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/case1/111theta_case1_rank3.txt', '-ascii');
approx7=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/case1/111theta_case1_rank7_nu05_129.txt', '-ascii');
approx9=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/case1/111theta_case1_rank9_nu05_129.txt', '-ascii');

%approx=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank5_33_nu.txt', '-ascii');
%approx2=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank3_33.txt', '-ascii');
s=min(size(approx3,1), size(approx7,1), size(approx9,1));
approx3=approx3(1:s,:);
approx7=approx7(1:s,:);
approx9=approx9(1:s,:);

%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/111theta_case3_rank16_sigma2_4.txt', '-ascii');

%fprintf(f1, "%6.6g, %6.6g, %6.6g, %6.6g, %6.6g, %6.6g, %d, %6.6g  \n", 
%theta, nu, sigma2, L->cols*(log(2.0*PI))/2,quadratic,loglike,global_k,logdet);
 
nu3=approx3(:,1);
ell3=approx3(:,2);
var3=approx3(:,3);

 
nu7=approx3(:,1);
ell7=approx3(:,2);
var7=approx3(:,3);

 
nu9=approx3(:,1);
ell9=approx3(:,2);
var9=approx3(:,3);


%ell2=approx2(:,1);
%logdetC2=approx2(:,8);
%rank2=approx2(:,7);
%loglike2=approx2(:,6);


%plot(nu,logdetC,'-r','LineWidth',3);
%hold on
semilogy(nu, loglike,'-.r','LineWidth',2);
hold on;
semilogy(nu, zCinv,'-b','LineWidth',3);
hold on;
semilogy(nu, logdetC,':c','LineWidth',3);
hold on;

%plot(ell2,logdetC2,'-b','LineWidth',3);

legend('rank={5-12}')
legend('log-likelihood', 'z^TC^{-1}z');
%ylabel('\nu');
%ylim([0.01 0.1])
%title('Dependence of logdet(C) on cov. length')
xlabel('parameter \nu')
set(gca,'FontSize',16);
save_figure(gcf, 'log_det_length_nu33_k5', 'figdir', '.', 'fontsize', 16)

figure
%hold on
%plot(ell2,loglike2,'-b','LineWidth',2);
%hold on

%ylabel('-log-likelihood');
%ylabel('\nu');
%ylim([0.01 0.1])
%title('Dependence of log-likelihood on cov. length')
%xlabel('cov. length')
%set(gca,'FontSize',16);

%save_figure(gcf, 'log_like_length_nu33_k5', 'figdir', '.', 'fontsize', 16)


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
