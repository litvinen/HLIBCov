clc;
clear;
format long
set(gca,'FontSize',18);
%ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_19April.txt', '-ascii');
ell2000=load('~/hlibpro-2.6/examples/111res_ell_nonnest_WHOLE_DOMAIN_2K_2May.txt', '-ascii');
ell4000=load('~/hlibpro-2.6/examples/111res_ell_nonnest_WHOLE_DOMAIN_4K_2May.txt', '-ascii');
ell8000=load('~/hlibpro-2.6/examples/111res_ell_nonnest_WHOLE_DOMAIN_8K_2May.txt', '-ascii');
ell16000=load('~/hlibpro-2.6/examples/111res_ell_nonnest_WHOLE_DOMAIN_16K_2May.txt', '-ascii');
ell32000=load('~/hlibpro-2.6/examples/111res_ell_nonnest_WHOLE_DOMAIN_8K_2May.txt', '-ascii');
ell64000=load('~/hlibpro-2.6/examples/111res_ell_nonnest_WHOLE_DOMAIN_8K_2May.txt', '-ascii');
ell128000=load('~/hlibpro-2.6/examples/111res_ell_nonnest_WHOLE_DOMAIN_8K_2May.txt', '-ascii');
ell256000=load('~/hlibpro-2.6/examples/111res_ell_nonnest_WHOLE_DOMAIN_8K_2May.txt', '-ascii');



ell2=ell2000(:,2);
ell4=ell4000(:,2);
ell8=ell8000(:,2);
ell16=ell16000(:,2);
ell32=ell32000(:,2);
ell64=ell64000(:,2);
ell128=ell128000(:,2);
ell256=ell256000(:,2);


Nell2=size(ell2000,1);
Nell4=size(ell4000,1);
Nell8=size(ell8000,1);
Nell16=size(ell16000,1);
Nell32=size(ell32000,1);
Nell64=size(ell64000,1);
Nell128=size(ell128000,1);
Nell256=size(ell256000,1);


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


grpell = [256000*ones(1,Nell256) 128000*ones(1,Nell128) 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
Cell = [ell256' ell128'  ell64' ell32' ell16' ell8' ell4' ell2'];
Qell = quantile(ell32,[.25 .50 .75]); % the quartiles of x

boxplot(Cell, grpell, 'grouporder',{'256000','128000','64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'256','128','64','32','16','8','4','2'});

% hold all;
% x=0:1:6;
% y25=Qell(1)*ones(size(x));
% y75=Qell(3)*ones(size(x));
% hold all
% plot(x,y25,':g','LineWidth',2);
% hold all;
% plot(x,y75,':g','LineWidth',2);
% hold all
% 
xlabel('$n$, samples in thousands','Interpreter','latex');
ylabel('$\ell$','Interpreter','latex');
save_figure(gcf, '20April_box_plots_ell_N_whole', 'figdir', '.', 'fontsize', 18 )
figure

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
