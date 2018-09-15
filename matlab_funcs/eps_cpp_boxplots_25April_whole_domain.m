clc;
clear;
format long
set(gca,'FontSize',18);
eps2=load('/home/litvina/hlibpro-2.6/examples/111res_ell_e-2_WHOLE_DOMAIN_16K_25April.txt', '-ascii');
eps3=load('/home/litvina/hlibpro-2.6/examples/111res_ell_1e-3_WHOLE_DOMAIN_16K_25April.txt', '-ascii');
eps4=load('/home/litvina/hlibpro-2.6/examples/111res_ell_5e-4_WHOLE_DOMAIN_16K_25April.txt', '-ascii');
eps5=load('/home/litvina/hlibpro-2.6/examples/111res_ell_e-4_WHOLE_DOMAIN_16K_25April.txt', '-ascii');



ell2 = eps2(:,2);
ell3 = eps3(:,2);
ell4 = eps4(:,2);
ell5 = eps5(:,2);


Nell2=size(ell2,1);
Nell3=size(ell3,1);
Nell4=size(ell4,1);
Nell5=size(ell5,1);


grpeps = [(1e-5)*ones(1,Nell5) (1e-4)*ones(1,Nell4) (1e-3)*ones(1,Nell3)  (1e-2)*ones(1,Nell2)];
Ceps = [ell5 ell4 ell3 ell2 ];
figure;
boxplot(Ceps, 'labels',{'1e-5', '1e-4', '1e-3', '1e-2' })
%boxplot(Cnu, grpnu, 'grouporder',{'128000','64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});
%boxplot(Ceps, grpeps, 'grouporder',{'1e-5', '1e-4', '1e-3', '1e-2' });
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
xlabel('$\varepsilon$, samples in thousands','Interpreter','latex');
ylabel('$\ell$','Interpreter','latex');
save_figure(gcf, '25April_box_plots_ell_eps_whole', 'figdir', '.', 'fontsize', 20 )
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
