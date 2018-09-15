clc;
clear;

%diters=load('/home/litvina/hlibpro-2.6.1/examples/111res_3Mai2018_vs_eps_iters_128K.txt', '-ascii');
%d=load('/home/litvina/hlibpro-2.6.1/examples/111res_3Mai2018_vs_eps_128K.txt', '-ascii');
%diters=load('/home/litvina/hlibpro-2.6.1/examples/111res_3Mai2018_vs_eps_iters.txt', '-ascii');
%d=load('/home/litvina/hlibpro-2.6.1/examples/111res_3Mai2018_vs_eps.txt', '-ascii');
d=load('/home/litvina/hlibpro-2.6.1/examples/111_4Mai2018_vs_eps_17.txt', '-ascii');


eps = d(:,3);
ell=d(:,7);
nu=d(:,6);
sigma=d(:,9);
coeff=sigma./power(ell, 2*sigma);


truth_ell=0.7;
truth_nu=0.9;
truth_sigma=1.0;
truth_coeff=truth_sigma./power(truth_ell, 2*truth_sigma);

semilogx(eps, ell)
hold all
x=0:1:(size(eps,1)-1);
%x=2.^x;
y=truth_ell*ones(size(x));
%semilogx(eps,y,':g','LineWidth',2);
%ylim=([0.65 0.9]);
xlabel('$\varepsion$', 'Interpreter','latex');
ylabel('$\ell$','Interpreter','latex');
save_figure(gcf, 'May4_plots_ell', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )


nu2=d2000(:,6);
nu4=d4000(:,6);
nu8=d8000(:,6);
nu16=d16000(:,6);
nu32=d32000(:,6);
nu64=d64000(:,6);
nu128=d128000(:,6);

figure
NU=[nu2 nu4 nu8 nu16 nu32 nu64 nu128];
plot(NU(1:10,:)')
x=0:1:8;
y=truth_ell*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
xlabel('accuracy $\eps$', 'Interpreter','latex');
ylabel('$\nu$','Interpreter','latex');
save_figure(gcf, 'May2_plots_nu', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )


sigma2=d2000(:,9);
sigma4=d4000(:,9);
sigma8=d8000(:,9);
sigma16=d16000(:,9);
sigma32=d32000(:,9);
sigma64=d64000(:,9);
sigma128=d128000(:,9);

figure
SIGMA=[sigma2 sigma4 sigma8 sigma16 sigma32 sigma64 sigma128];
plot(SIGMA(1:10,:)')
x=0:1:8;
y=truth_ell*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
xlabel('accuracy $\eps$', 'Interpreter','latex');
ylabel('$\sigma$','Interpreter','latex');
save_figure(gcf, 'May2_plots_sigma', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )


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

