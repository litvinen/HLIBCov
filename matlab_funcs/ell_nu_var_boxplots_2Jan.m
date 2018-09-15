clc;
clear;
format long
set(gca,'FontSize',18);
%approx3=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/case3/111theta_case3_rank3.txt', '-ascii');
d2000=load('1RESULTS/111ALLresults_31Dec_2000.txt', '-ascii');
d4000=load('1RESULTS/111ALLresults_31Dec_4000.txt', '-ascii');
d8000=load('1RESULTS/111ALLresults_31Dec_8000.txt', '-ascii');
d16000=load('1RESULTS/111ALLresults_31Dec_16000.txt', '-ascii');
d32000=load('1RESULTS/111ALLresults_31Dec_32000.txt', '-ascii');

N2=size(d2000,1);
N4=size(d4000,1);
N8=size(d8000,1);
N16=size(d16000,1);
N32=size(d32000,1);



%approx=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank5_33_nu.txt', '-ascii');
%approx2=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank3_33.txt', '-ascii');
s=min(min(size(d8000,1),size(d4000,1)), min(size(d32000,1), size(d16000,1)));
%approx3=approx3(1:s,:);
%approx7=approx7(1:s,:);
%approx9=approx9(1:s,:);

%approx8=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank8.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank16.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/111theta_case3_rank16_sigma2_4.txt', '-ascii');


nu2=d2000(:,1);
ell2=d2000(:,2);
sigma2=d2000(:,3);

nu4=d4000(:,1);
ell4=d4000(:,2);
sigma4=d4000(:,3);

nu8=d8000(:,1);
ell8=d8000(:,2);
sigma8=d8000(:,3);

nu16=d16000(:,1);
ell16=d16000(:,2);
sigma16=d16000(:,3);

nu32=d32000(:,1);
ell32=d32000(:,2);
sigma32=d32000(:,3);





grp = [2000*ones(1,N2),4000*ones(1,N4), 8000*ones(1,N8), 16000*ones(1,N16), 32000*ones(1,N32)]
C=[nu2' nu4' nu8' nu16' nu32'];
boxplot(C, grp);
xlabel('number of measurements ');
ylabel('\nu');
save_figure(gcf, 'box_plots_nu_N', 'figdir', '.', 'fontsize', 12)
figure

C=[ell2' ell4' ell8' ell16' ell32'];
boxplot(C, grp);
xlabel('number of measurements ');
ylabel('covariance length');
save_figure(gcf, 'box_plots_ell_N', 'figdir', '.', 'fontsize', 12)
figure

C=[sigma2' sigma4' sigma8' sigma16' sigma32'];
boxplot(C, grp);
xlabel('number of measurements ');
ylabel('variance \sigma^2');
save_figure(gcf, 'box_plots_sigma_N', 'figdir', '.', 'fontsize', 12)
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
