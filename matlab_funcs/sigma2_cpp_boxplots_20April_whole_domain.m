clc;
clear;
format long
set(gca,'FontSize',18);
sigma2000=load('/home/litvina/hlibpro-2.6/examples/111res_sigma2_WHOLE_DOMAIN_2K_20April.txt', '-ascii');
sigma4000=load('/home/litvina/hlibpro-2.6/examples/111res_sigma2_WHOLE_DOMAIN_4K_20April.txt', '-ascii');
sigma8000=load('/home/litvina/hlibpro-2.6/examples/111res_sigma2_WHOLE_DOMAIN_8K_20April.txt', '-ascii');
sigma16000=load('/home/litvina/hlibpro-2.6/examples/111res_sigma2_WHOLE_DOMAIN_16K_20April.txt', '-ascii');
sigma32000=load('/home/litvina/hlibpro-2.6/examples/111res_sigma2_WHOLE_DOMAIN_32K_20April.txt', '-ascii');
sigma64000=load('/home/litvina/hlibpro-2.6/examples/111res_sigma2_WHOLE_DOMAIN_64K_20April.txt', '-ascii');
sigma128000=load('/home/litvina/hlibpro-2.6/examples/111res_sigma2_WHOLE_DOMAIN_128K_20April.txt', '-ascii');
sigma256000=load('/home/litvina/hlibpro-2.6/examples/111res_sigma2_WHOLE_DOMAIN_256K_20April.txt', '-ascii');



sigma2=sigma2000(:,2);
sigma4=sigma4000(:,2);
sigma8=sigma8000(:,2);
sigma16=sigma16000(:,2);
sigma32=sigma32000(:,2);
sigma64=sigma64000(:,2);
sigma128=sigma128000(:,2);
sigma256=sigma256000(:,2);


Nsigma2=size(sigma2000,1);
Nsigma4=size(sigma4000,1);
Nsigma8=size(sigma8000,1);
Nsigma16=size(sigma16000,1);
Nsigma32=size(sigma32000,1);
Nsigma64=size(sigma64000,1);
Nsigma128=size(sigma128000,1);
Nsigma256=size(sigma256000,1);


%approx=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank5_33_sigma.txt', '-ascii');
%approx2=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111L_Havard_rank3_33.txt', '-ascii');
%s=min(min(size(d8000,1),size(d4000,1)), min(size(d32000,1), size(d16000,1)));
%approx3=approx3(1:s,:);
%approx7=approx7(1:s,:);
%approx9=approx9(1:s,:);

%approx8=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank8.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/16Feb/111theta_case1_rank16.txt', '-ascii');
%approx16=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/111theta_case3_rank16_sigma2_4.txt', '-ascii');


%sigma2=approx2000(:,1);
%sigma4=approx4000(:,1);
%sigma8=approx8000(:,1);
%sigma16=approx16000(:,1);
%sigma32=approx32000(:,1);



grpsigma = [256000*ones(1,Nsigma256) 128000*ones(1,Nsigma128) 64000*ones(1,Nsigma64), 32000*ones(1,Nsigma32), 16000*ones(1,Nsigma16), 8000*ones(1,Nsigma8),4000*ones(1,Nsigma4), 2000*ones(1,Nsigma2)];
Csigma = [sigma256'  sigma128'  sigma64' sigma32' sigma16' sigma8' sigma4' sigma2'];
Qsigma = quantile(sigma32,[.25 .50 .75]); % the quartiles of x

boxplot(Csigma, grpsigma, 'grouporder',{'256000','128000','64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'256', '128','64','32','16','8','4','2'});

% hold all;
% x=0:1:6;
% y25=Qsigma(1)*ones(size(x));
% y75=Qsigma(3)*ones(size(x));
% hold all
% plot(x,y25,':g','LineWidth',2);
% hold all;
% plot(x,y75,':g','LineWidth',2);
% hold all
% 
xlabel('$n$, samples in thousands','Interpreter','latex');

ylabel('$\sigma^2$','Interpreter','latex');
save_figure(gcf, '20April_box_plots_sigma_N_whole', 'figdir', '.', 'fontsize', 18 )
figure

% %save_figure(gcf, 'convergence_sigma15_weak', 'figdir', '.', 'fontsize', 12)
% %           b     blue          .     point              -     solid
% %            g     green         o     circle             :     dotted
% %            r     red           x     x-mark             -.    dashdot 
% %            c     cyan          +     plus               --    dashed   
% %            m     magenta       *     star             (none)  no line
% %            y     ysigmaow        s     square
% %            k     black         d     diamond
% %            w     white         v     triangle (down)
% %                                ^     triangle (up)
% %                                <     triangle (left)
% %                                >     triangle (right)
% %                                p     pentagram
% %                                h     hexagram
% %                           
% 
