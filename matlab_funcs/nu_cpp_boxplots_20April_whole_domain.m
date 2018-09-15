clc;
clear;
format long
set(gca,'FontSize',18);
nu2000=load('/home/litvina/hlibpro-2.6/examples/111res_nu_WHOLE_DOMAIN_2K_20April.txt', '-ascii');
nu4000=load('/home/litvina/hlibpro-2.6/examples/111res_nu_WHOLE_DOMAIN_4K_20April.txt', '-ascii');
nu8000=load('/home/litvina/hlibpro-2.6/examples/111res_nu_WHOLE_DOMAIN_8K_20April.txt', '-ascii');
nu16000=load('/home/litvina/hlibpro-2.6/examples/111res_nu_WHOLE_DOMAIN_16K_20April.txt', '-ascii');
nu32000=load('/home/litvina/hlibpro-2.6/examples/111res_nu_WHOLE_DOMAIN_32K_20April.txt', '-ascii');
nu64000=load('/home/litvina/hlibpro-2.6/examples/111res_nu_WHOLE_DOMAIN_64K_20April.txt', '-ascii');
nu128000=load('/home/litvina/hlibpro-2.6/examples/111res_nu_WHOLE_DOMAIN_128K_20April.txt', '-ascii');
nu256000=load('/home/litvina/hlibpro-2.6/examples/111res_nu_WHOLE_DOMAIN_256K_20April.txt', '-ascii');



nu2=nu2000(:,2);
nu4=nu4000(:,2);
nu8=nu8000(:,2);
nu16=nu16000(:,2);
nu32=nu32000(:,2);
nu64=nu64000(:,2);
nu128=nu128000(:,2);
nu256=nu256000(:,2);


Nnu2=size(nu2000,1);
Nnu4=size(nu4000,1);
Nnu8=size(nu8000,1);
Nnu16=size(nu16000,1);
Nnu32=size(nu32000,1);
Nnu64=size(nu64000,1);
Nnu128=size(nu128000,1);
Nnu256=size(nu256000,1);


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



grpnu = [256000*ones(1,Nnu256) 128000*ones(1,Nnu128) 64000*ones(1,Nnu64), 32000*ones(1,Nnu32), 16000*ones(1,Nnu16), 8000*ones(1,Nnu8),4000*ones(1,Nnu4), 2000*ones(1,Nnu2)];
Cnu = [nu256' nu128'  nu64' nu32' nu16' nu8' nu4' nu2'];
Qnu = quantile(nu32,[.25 .50 .75]); % the quartiles of x

%boxplot(Cnu, grpnu, 'grouporder',{'128000','64000', '32000', '16000', '8000', '4000', '2000'}'labels',{'128','64','32','16','8','4','2'});
boxplot(Cnu, grpnu, 'grouporder',{'256000','128000','64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'256','128','64','32','16','8','4','2'});
% hold all;
% x=0:1:6;
% y25=Qnu(1)*ones(size(x));
% y75=Qnu(3)*ones(size(x));
% hold all
% plot(x,y25,':g','LineWidth',2);
% hold all;
% plot(x,y75,':g','LineWidth',2);
% hold all
% 
xlabel('$n$, samples in thousands','Interpreter','latex');
ylabel('$\nu$','Interpreter','latex');
save_figure(gcf, '20April_box_plots_nu_N_whole', 'figdir', '.', 'fontsize', 20 )
figure

% %save_figure(gcf, 'convergence_nu15_weak', 'figdir', '.', 'fontsize', 12)
% %           b     blue          .     point              -     solid
% %            g     green         o     circle             :     dotted
% %            r     red           x     x-mark             -.    dashdot 
% %            c     cyan          +     plus               --    dashed   
% %            m     magenta       *     star             (none)  no line
% %            y     ynuow        s     square
% %            k     black         d     diamond
% %            w     white         v     triangle (down)
% %                                ^     triangle (up)
% %                                <     triangle (left)
% %                                >     triangle (right)
% %                                p     pentagram
% %                                h     hexagram
% %                           
% 
