clc;
clear;
format long
set(gca,'FontSize',18);
%approx3=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/case3/111theta_case3_rank3.txt', '-ascii');
%d2000=load('../C2000/111_3Jan_2000.txt', '-ascii');
%d4000=load('../C4000/111_3Jan_4000.txt', '-ascii');
%d8000=load('../C8000/111_3Jan_8000.txt', '-ascii');
%d16000=load('../C16000/111_3Jan_16000.txt', '-ascii');
%d32000=load('../C32000/111_3Jan_32000.txt', '-ascii');

approx2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_15Jan_2000_sigma.txt', '-ascii');
approx4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_15Jan_4000_sigma.txt', '-ascii');
approx8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_15Jan_8000_sigma.txt', '-ascii');
approx16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_15Jan_16000_sigma.txt', '-ascii');
approx32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_15Jan_32000_sigma.txt', '-ascii');


%for nu
%approx2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_8Jan_2000_smallK.txt', '-ascii');
%approx4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_8Jan_4000_smallK.txt', '-ascii');
%approx8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_8Jan_8000_smallK.txt', '-ascii');
%approx16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_8Jan_16000_smallK.txt', '-ascii');
%approx32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_4Jan_32000_smallK.txt', '-ascii');


%for nu
%approx2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_12Jan_2000_nu.txt', '-ascii');
%approx4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_14Jan_4000_nu_LARGE.txt', '-ascii');
%approx8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_12Jan_8000_nu.txt', '-ascii');
%approx16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_12Jan_16000_nu.txt', '-ascii');
%approx32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_12Jan_32000_nu.txt', '-ascii');


%for \ell
%approx2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_9Jan_2000_sigma_smallK.txt', '-ascii');
%approx4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_9Jan_4000_sigma_smallK.txt', '-ascii');
%approx8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_9Jan_8000_sigma_smallK.txt', '-ascii');
%approx16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_9Jan_18000_sigma_smallK.txt', '-ascii');
%approx32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_9Jan_32000_sigma_smallK.txt', '-ascii');



s2=approx2000(:,1);
s4=approx4000(:,1);
s8=approx8000(:,1);
s16=approx16000(:,1);
s32=approx32000(:,1);


N2=size(approx2000,1);
N4=size(approx4000,1);
N8=size(approx8000,1);
N16=size(approx16000,1);
N32=size(approx32000,1);



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


figure

%grp = [2000*ones(1,N2),4000*ones(1,N4), 8000*ones(1,N8), 16000*ones(1,N16), 32000*ones(1,N32)]
grp = [2000*ones(1,N2),4000*ones(1,N4), 8000*ones(1,N8), 16000*ones(1,N16), 32000*ones(1,N32)]
%C=[nu2' nu4' nu8' nu16' nu32'];
%C=[nu2' nu4' nu8' nu16' ];
C=[s2' s4' s8' s16' s32'];

boxplot(C, grp);
xlabel('number of locations ');
ylabel('variance ');
save_figure(gcf, '15Jan_box_plots_sigma_nest_middle', 'figdir', '.', 'fontsize', 16)


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
