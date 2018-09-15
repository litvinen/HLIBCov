clc;
clear;
format long
set(gca,'FontSize',18);
%ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_19April.txt', '-ascii');
Sameh = load('~/Dropbox/111Hcov_paper/111Sameh/111Sameh.txt', '-ascii');
ind=find(Sameh(:,1)==2000)
d2000 = Sameh(ind, :)
ind=find(Sameh(:,1)==4000)
d4000 = Sameh(ind, :)
ind=find(Sameh(:,1)==8000)
d8000 = Sameh(ind, :)
ind=find(Sameh(:,1)==16000)
d16000 = Sameh(ind, :)
ind=find(Sameh(:,1)==32000)
d32000 = Sameh(ind, :)

ell2=d2000(:, 3);
ell4=d4000(:, 3);
ell8=d8000(:, 3);
ell16=d16000(:, 3);
ell32=d32000(:, 3);
nu2=d2000(:, 4);
nu4=d4000(:, 4);
nu8=d8000(:, 4);
nu16=d16000(:, 4);
nu32=d32000(:, 4);
sigma2=d2000(:, 2);
sigma4=d4000(:, 2);
sigma8=d8000(:, 2);
sigma16=d16000(:, 2);
sigma32=d32000(:, 2);


N2=size(ell2,1);
N4=size(ell4,1);
N8=size(ell8,1);
N16=size(ell16,1);
N32=size(ell32,1);


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


grpell = [32000*ones(1,N32),16000*ones(1,N16),8000*ones(1,N8),4000*ones(1,N4), 2000*ones(1,N2)];
%Cell = [ell32' ell16' ell8' ell4' ell2'];
%Cell = [nu32' nu16'  nu8' nu4' nu2'];
Cell = [sigma32' sigma16' sigma8' sigma4' sigma2'];
%Qell = quantile(ell32,[.25 .50 .75]); % the quartiles of x

boxplot(Cell, grpell, 'grouporder',{'32000','16000','8000', '4000', '2000'},'labels',{'32', '16', '8','4','2'});

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
ylabel('$\sigma^2$','Interpreter','latex');
%ylabel('$\nu$','Interpreter','latex');
%ylabel('$\ell$','Interpreter','latex');
save_figure(gcf, 'Sameh_7May_box_plots_sigma2', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
%save_figure(gcf, 'Sameh_10May_box_plots_nu', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
%save_figure(gcf, 'Sameh_7May_box_plots_ell', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )


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
