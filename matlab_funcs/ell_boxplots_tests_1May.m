clc;
clear;
format long
set(gca,'FontSize',18);
%ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_19April.txt', '-ascii');
ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_30April.txt', '-ascii');
ell4000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_4K_30April.txt', '-ascii');
ell8000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_8K_30April.txt', '-ascii');


ell2=ell2000(:,2);
ell4=ell4000(:,2);
ell8=ell8000(:,2);


Nell2=size(ell2000,1);
Nell4=size(ell4000,1);
Nell8=size(ell8000,1);

%rng default;  % For reproducibility
%x1 = normrnd(5,1,100,1);
%x2 = normrnd(6,1,100,1);
%figure;
%boxplot([x1,x2],'notch','on','labels',{'mu = 5','mu = 6'})


%grpell = [256000*ones(1,Nell256) 128000*ones(1,Nell128) 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%Cell = [ell256' ell128'  ell64' ell32' ell16' ell8' ell4' ell2'];

boxplot([ell2(1:10) ell2(1:10) ell2(1:10)],'notch','on','labels',{'2K','4K', '8K'})

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
