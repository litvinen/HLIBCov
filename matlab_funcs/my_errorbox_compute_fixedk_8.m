function my_errorbox_vs_fixedk(datafile, n, k)
%ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_19April.txt', '-ascii');
d=load(datafile, '-ascii');
indexN=(d(:,2)==n);
d=d(indexN, :);
index0=(d(:,3)==5);
r5 =d(index0,:);
index0=(d(:,3)==6);
r6 =d(index0,:);
index0=(d(:,3)==8);
r8=d(index0,:);
index0=(d(:,3)==10);
r10=d(index0,:);
index0=(d(:,3)==12);
r12=d(index0,:);






ell5=r5(:,6);
ell6=r6(:,6);
ell8=r8(:,6);
ell10=r10(:,6);
ell12=r12(:,6);

nu5=r5(:,5);
nu6=r6(:,5);
nu8=r8(:,5);
nu10=r10(:,5);
nu12=r12(:,5);

sigma5=r5(:,8);
sigma6=r6(:,8);
sigma8=r8(:,8);
sigma10=r10(:,8);
sigma12=r12(:,8);

Nell5=size(ell5,1);
Nell6=size(ell6,1);
Nell8=size(ell8,1);
Nell10=size(ell10,1);
Nell12=size(ell12,1);

n=Nell5;
coeff5=sigma5(1:n)./power(ell5(1:n), 2*sigma5(1:n));
n=Nell6;
coeff6=sigma6(1:n)./power(ell6(1:n), 2*sigma6(1:n));
n=Nell8;
coeff8=sigma8(1:n)./power(ell8(1:n), 2*sigma8(1:n));
n=Nell10;
coeff10=sigma10(1:n)./power(ell10(1:n), 2*sigma10(1:n));
n=Nell12;
coeff12=sigma12(1:n)./power(ell12(1:n), 2*sigma12(1:n));




%approx=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank5_33_nu.txt', '-ascii');
%approx2=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank3_33.txt', '-ascii');
%s=min(min(size(d8000,1),size(d4000,1)), min(size(d32000,1), size(d16000,1)));
%approx3=approx3(1:s,:);
%approx7=approx7(1:s,:);
%approx9=approx9(1:s,:);

%approx8=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank8.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank16.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/111theta_case3_rank16_sigma2_4.txt', '-ascii');


%nu2=approx2000(:,1);
%nu4=approx4000(:,1);
%nu8=approx8000(:,1);
%nu16=approx16000(:,1);
%nu32=approx32000(:,1);


%grp = [128000*ones(1,Nell128), 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
grp = [12*ones(1,Nell12),10*ones(1,Nell10),8*ones(1,Nell8),6*ones(1,Nell6), 5*ones(1,Nell5)];
%grp = [32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [128000*ones(1,Nell128) 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
C = [ell12' ell10' ell8' ell6' ell5'];
%C = [ell128'  ell64' ell32' ell16' ell8' ell4' ell2'];
%C = [ell32' ell16' ell8' ell4' ell2'];
%C = [ell8' ell4' ell2'];
%C = [nu32' nu16' nu8' nu4' nu2'];
%C = [nu128'  nu64' nu32' nu16' nu8' nu4' nu2'];
%C = [sigma32' sigma16' sigma8' sigma4' sigma2'];
%C = [sigma128'  sigma64' sigma32' sigma16' sigma8' sigma4' sigma2'];
%C = [coeff128'  coeff64' coeff32' coeff16' coeff8' coeff4' coeff2'];
%C = [coeff32' coeff16' coeff8' coeff4' coeff2'];
%Qell = quantile(ell32,[.25 .50 .75]); % the quartiles of x

boxplot(C, grp, 'grouporder',{'12', '10', '8', '6', '5'},'labels',{'12','10','8','4','2'});
%boxplot(C, grp, 'grouporder',{'32000', '16000', '8000', '4000', '2000'},'labels',{'32','16','8','4','2'});
%boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
%boxplot(C, grp, 'grouporder',{'128000', '64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});

truth_ell=0.7;
truth_nu=0.9;
truth_sigma=1.0;
truth_coeff=truth_sigma./power(truth_ell, 2*truth_sigma);

x=0:1:7;
y=truth_ell*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
hold all
%ylabel('cov. length');
%ylabel('\nu');
%ylim([0.02 0.06])
%title('Dependence on H-matrix ranks, Case 3')




xlabel('$n$, samples in thousands','Interpreter','latex');
ylabel('$\ell$','Interpreter','latex');
save_figure(gcf, 'May1_ell_fK6', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )


figure
grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%C = [nu32' nu16' nu8' nu4' nu2'];
%C = [nu8' nu4' nu2'];
C = [nu8' nu4' nu2'];
%boxplot(C, grp, 'grouporder',{'32000', '16000', '8000', '4000', '2000'},'labels',{'32','16','8','4','2'});
%boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
x=0:1:5;
y=truth_nu*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
hold all

xlabel('$n$, samples in thousands','Interpreter','latex');
ylabel('$\nu$','Interpreter','latex');
save_figure(gcf, 'May1_nu_fK6', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )


figure
%grp = [16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%C = [sigma16' sigma8' sigma4' sigma2'];
%C = [sigma32' sigma16' sigma8' sigma4' sigma2'];
%C = [sigma8' sigma4' sigma2'];
C = [sigma8' sigma4' sigma2'];
%boxplot(C, grp, 'grouporder',{'16000', '8000', '4000', '2000'},'labels',{'16','8','4','2'});
%boxplot(C, grp, 'grouporder',{'32000', '16000', '8000', '4000', '2000'},'labels',{'32','16','8','4','2'});
%boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
x=0:1:5;
y=truth_sigma*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
hold all

xlabel('$n$, samples in thousands','Interpreter','latex');
ylabel('$\sigma^2$','Interpreter','latex');
save_figure(gcf, 'May1_sigma_fK6', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )

figure
%grp = [16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%C = [coeff16' coeff8' coeff4' coeff2'];
%C = [coeff32' coeff16' coeff8' coeff4' coeff2'];
%C = [coeff8' coeff4' coeff2'];
C = [coeff8' coeff4' coeff2'];
%boxplot(C, grp, 'grouporder',{'16000', '8000', '4000', '2000'},'labels',{'16','8','4','2'});
%boxplot(C, grp, 'grouporder',{'32000', '16000', '8000', '4000', '2000'},'labels',{'32','16','8','4','2'});
boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
%boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
x=0:1:5;
y=truth_coeff*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
hold all

%boxplot(C, grp, 'grouporder',{'64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'64','32','16','8','4','2'});
xlabel('$n$, samples in thousands','Interpreter','latex');
ylabel('$\sigma^2/\ell^{2\nu}$','Interpreter','latex');
save_figure(gcf, 'May1_coeff_fK6', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )

%save_figure(gcf, '27May_box_plots_nu_N_whole_cpp', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
%save_figure(gcf, '27May_box_plots_sigma2_N_whole_cpp', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
%save_figure(gcf, '27May_box_plots_coeff_N_whole_cpp', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )

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
end

