function my_errorbox_9Sept18_vs_eps_50_final(datafile, flag, flag2)
%ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_19April.txt', '-ascii');
d=load(datafile, '-ascii');
index=[2000 4000 8000 16000 32000 64000 128000];
v=index(flag2)
index0=(d(:,2)==v);
dd = d(index0,:);

eps=dd(:,3);
ell2=dd(:,flag);
semilogx(eps, ell2, 'color', 'black', 'LineWidth',2)
hold on
%plot(eps, ell2)
% .     point              -     solid
% % %            g     green         o     circle             :     dotted
% % %            r     red           x     x-mark             -.    dashdot 
% % %            c     cyan          +     plus               --    dashed   
% % %            m     magenta       *     star             (none)  no line
% % %            y     yellow        s     square
  
  
if(flag==6) %\nu
    truth=0.9;
end    
if(flag==7) %\ell
    truth=0.7;
end    
if(flag==8) %\sigma
    truth=1.0;
end    
%truth=truth_sigma./power(truth_ell, 2*truth_sigma);


x=1:1:12;
x=power(2, x);
epsx=(2e-8)*x;
xlim([1e-8, 1e-4]);
y=truth*ones(size(eps));
hold all
semilogx(eps, y',':g','LineWidth', 4);
hold off;
legend OFF;

str0 = {'2000', '4000', '8000', '16000', '32000', '64000', '128000'};
legend(str0(flag2), 'truth')
%legend('2', '4', '8', '16', '32', '64', '128', 'truth')
xlabel('accuracy','Interpreter','latex');


%Aell=[ell2 ell4 ell8 ell16 ell32 ell64 ell128];

%figure
%Aell=[ell4(1:10,:) ell8 ell16 ell32 ell64];
%semilogx(eps, Aell');

%
%plot(Aell');
%x=0:1:size(Aell,2);
%y=truth_ell*ones(size(x));
%hold on
%plot(x,y,':g','LineWidth',2);
%hold on
%xlabel('replicates','Interpreter','latex');
%ylabel('$\ell$','Interpreter','latex');
%save_figure(gcf, '4Mai2018_graphs_ell_tr', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )



% nu2=d2000(:,6);
% nu4=d4000(:,6);
% nu8=d8000(:,6);
% nu16=d16000(:,6);
% nu32=d32000(:,6);
% nu64=d64000(:,6);
% nu128=d128000(:,6);
% 
% Anu=[nu2 nu4 nu8 nu16 nu32 nu64 nu128 ];
% 
% sigma2=d2000(:,9);
% sigma4=d4000(:,9);
% sigma8=d8000(:,9);
% sigma16=d16000(:,9);
% sigma32=d32000(:,9);
% sigma64=d64000(:,9);
% sigma128=d128000(:,9);
% 
% Asigma=[sigma2 sigma4 sigma8 sigma16 sigma32 sigma64 sigma128 ];
% 
% Nell2=size(ell2,1);
% Nell4=size(ell4,1);
% Nell8=size(ell8,1);
% Nell16=size(ell16,1);
% Nell32=size(ell32,1);
% Nell64=size(ell64,1);
% Nell128=size(ell128,1);
% 
% 
% n=Nell2;
% coeff2=sigma2(1:n)./power(ell2(1:n), 2*sigma2(1:n));
% n=Nell4;
% coeff4=sigma4(1:n)./power(ell4(1:n), 2*sigma4(1:n));
% n=Nell8;
% coeff8=sigma8(1:n)./power(ell8(1:n), 2*sigma8(1:n));
% n=Nell16;
% coeff16=sigma16(1:n)./power(ell16(1:n), 2*sigma16(1:n));
% n=Nell32;
% coeff32=sigma32(1:n)./power(ell32(1:n), 2*sigma32(1:n));
% n=Nell64;
% coeff64=sigma64(1:n)./power(ell64(1:n), 2*sigma64(1:n));
% n=Nell128;
% coeff128=sigma128(1:n)./power(ell128(1:n), 2*sigma128(1:n));
% 
% 
% Ac=[coeff2 coeff4 coeff8 coeff32 coeff64 coeff128];
% 
% %approx=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank5_33_nu.txt', '-ascii');
% %approx2=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank3_33.txt', '-ascii');
% %s=min(min(size(d8000,1),size(d4000,1)), min(size(d32000,1), size(d16000,1)));
% %approx3=approx3(1:s,:);
% %approx7=approx7(1:s,:);
% %approx9=approx9(1:s,:);
% 
% %approx8=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank8.txt', '-ascii');
% %approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank16.txt', '-ascii');
% %approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/111theta_case3_rank16_sigma2_4.txt', '-ascii');
% 
% 
% %nu2=approx2000(:,1);
% %nu4=approx4000(:,1);
% %nu8=approx8000(:,1);
% %nu16=approx16000(:,1);
% %nu32=approx32000(:,1);
% 
% 
% %grp = [128000*ones(1,Nell128), 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% grp = [128000*ones(1,Nell128), 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [128000*ones(1,Nell128) 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% C = [ell128' ell64' ell32' ell16' ell8' ell4' ell2'];
% %C = [ell128'  ell64' ell32' ell16' ell8' ell4' ell2'];
% %C = [ell32' ell16' ell8' ell4' ell2'];
% %C = [ell8' ell4' ell2'];
% %C = [nu32' nu16' nu8' nu4' nu2'];
% %C = [nu128'  nu64' nu32' nu16' nu8' nu4' nu2'];
% %C = [sigma32' sigma16' sigma8' sigma4' sigma2'];
% %C = [sigma128'  sigma64' sigma32' sigma16' sigma8' sigma4' sigma2'];
% %C = [coeff128'  coeff64' coeff32' coeff16' coeff8' coeff4' coeff2'];
% %C = [coeff32' coeff16' coeff8' coeff4' coeff2'];
% %Qell = quantile(ell32,[.25 .50 .75]); % the quartiles of x
% 
% boxplot(C, grp, 'grouporder',{'128000', '64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});
% %boxplot(C, grp, 'grouporder',{'32000', '16000', '8000', '4000', '2000'},'labels',{'32','16','8','4','2'});
% %boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
% %boxplot(C, grp, 'grouporder',{'128000', '64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});
% 
% truth_ell=0.7;
% truth_nu=0.9;
% truth_sigma=1.0;
% truth_coeff=truth_sigma./power(truth_ell, 2*truth_sigma);
% 
% x=0:1:8;
% y=truth_ell*ones(size(x));
% hold on
% plot(x,y,':g','LineWidth',2);
% hold on
% %ylabel('cov. length');
% %ylabel('\nu');
% %ylim([0.02 0.06])
% %title('Dependence on H-matrix ranks, Case 3')
% 
% 
% 
% 
% xlabel('$n$, samples in thousands','Interpreter','latex');
% ylabel('$\ell$','Interpreter','latex');
% save_figure(gcf, 'May1_ell_fK9', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
% 
% 
% figure
% grp = [64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %C = [nu32' nu16' nu8' nu4' nu2'];
% %C = [nu8' nu4' nu2'];
% C = [nu64' nu32' nu16' nu8' nu4' nu2'];
% %boxplot(C, grp, 'grouporder',{'32000', '16000', '8000', '4000', '2000'},'labels',{'32','16','8','4','2'});
% %boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
% boxplot(C, grp, 'grouporder',{'64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'64','32','16','8','4','2'});
% x=0:1:8;
% y=truth_nu*ones(size(x));
% hold on
% plot(x,y,':g','LineWidth',2);
% hold on
% 
% xlabel('$n$, samples in thousands','Interpreter','latex');
% ylabel('$\nu$','Interpreter','latex');
% save_figure(gcf, 'May1_nu_fK9', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
% 
% 
% figure
% %grp = [16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% grp = [64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %C = [sigma16' sigma8' sigma4' sigma2'];
% %C = [sigma32' sigma16' sigma8' sigma4' sigma2'];
% %C = [sigma8' sigma4' sigma2'];
% C = [sigma64' sigma32' sigma16' sigma8' sigma4' sigma2'];
% %boxplot(C, grp, 'grouporder',{'16000', '8000', '4000', '2000'},'labels',{'16','8','4','2'});
% %boxplot(C, grp, 'grouporder',{'32000', '16000', '8000', '4000', '2000'},'labels',{'32','16','8','4','2'});
% %boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
% boxplot(C, grp, 'grouporder',{'64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'64','32','16','8','4','2'});
% x=0:1:8;
% y=truth_sigma*ones(size(x));
% hold on
% plot(x,y,':g','LineWidth',2);
% hold on
% 
% xlabel('$n$, samples in thousands','Interpreter','latex');
% ylabel('$\sigma^2$','Interpreter','latex');
% save_figure(gcf, 'May1_sigma_fK9', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
% 
% figure
% %grp = [16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %grp = [8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% grp = [64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
% %C = [coeff16' coeff8' coeff4' coeff2'];
% %C = [coeff32' coeff16' coeff8' coeff4' coeff2'];
% %C = [coeff8' coeff4' coeff2'];
% C = [coeff64' coeff32' coeff16' coeff8' coeff4' coeff2'];
% %boxplot(C, grp, 'grouporder',{'16000', '8000', '4000', '2000'},'labels',{'16','8','4','2'});
% %boxplot(C, grp, 'grouporder',{'32000', '16000', '8000', '4000', '2000'},'labels',{'32','16','8','4','2'});
% boxplot(C, grp, 'grouporder',{'64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'64','32','16','8','4','2'});
% %boxplot(C, grp, 'grouporder',{'8000', '4000', '2000'},'labels',{'8','4','2'});
% x=0:1:8;
% y=truth_coeff*ones(size(x));
% hold on
% plot(x,y,':g','LineWidth',2);
% hold on
% 
% %boxplot(C, grp, 'grouporder',{'64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'64','32','16','8','4','2'});
% xlabel('$n$, samples in thousands','Interpreter','latex');
% ylabel('$\sigma^2/\ell^{2\nu}$','Interpreter','latex');
% save_figure(gcf, 'May1_coeff_fK9', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
% 
% %save_figure(gcf, '27May_box_plots_nu_N_whole_cpp', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
% %save_figure(gcf, '27May_box_plots_sigma2_N_whole_cpp', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
% %save_figure(gcf, '27May_box_plots_coeff_N_whole_cpp', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
% 
% % %save_figure(gcf, 'convergence_nu15_weak', 'figdir', '.', 'fontsize', 12)
% % %           b     blue          .     point              -     solid
% % %            g     green         o     circle             :     dotted
% % %            r     red           x     x-mark             -.    dashdot 
% % %            c     cyan          +     plus               --    dashed   
% % %            m     magenta       *     star             (none)  no line
% % %            y     yellow        s     square
% % %            k     black         d     diamond
% % %            w     white         v     triangle (down)
% % %                                ^     triangle (up)
% % %                                <     triangle (left)
% % %                                >     triangle (right)
% % %                                p     pentagram
% % %                                h     hexagram
% % %                           
% % 
% end
% 
