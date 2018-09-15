% 1May 2018
function my_graphs_vs_eps_2May18(datafile)
%ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_19April.txt', '-ascii');
d=load(datafile, '-ascii');
index0=(d(:,2)==2000);
d2000=d(index0,:);
index0=(d(:,2)==4000);
d4000=d(index0,:);
index0=(d(:,2)==8000);
d8000=d(index0,:);
index0=(d(:,2)==16000);
d16000=d(index0,:);
index0=(d(:,2)==32000);
d32000=d(index0,:);
index0=(d(:,2)==64000);
d64000=d(index0,:);
index0=(d(:,2)==128000);
d128000=d(index0,:);


ell2=d2000(:,7);
ell4=d4000(:,7);
ell8=d8000(:,7);
ell16=d16000(:,7);
ell32=d32000(:,7);
ell64=d64000(:,7);
ell128=d128000(:,7);


truth_ell=0.7;
truth_nu=0.9;
truth_sigma=1.0;
truth_coeff=truth_sigma./power(truth_ell, 2*truth_sigma);

LL=[ell2 ell4 ell8 ell16 ell32 ell64 ell128];
%eps=[2 4 8 16 32 64 128];
eps=[128 64 32 16 8 4 2];
%plot(eps, LL(1:10,:)')
semilogx(eps, LL(1:10,:)')
x=0:1:8;
x=2.^x;
y=truth_ell*ones(size(x));
hold all
semilogx(x,y,':g','LineWidth',2);
xlabel('sample size', 'Interpreter','latex');
ylabel('$\ell$','Interpreter','latex');
save_figure(gcf, 'May2_plots_ell', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )


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
end

