clc;
clear;
format long
set(gca,'FontSize',18);


d2000=load('~/hlibpro-2.6/examples/c/3May_2K.txt', '-ascii');
d4000=load('~/hlibpro-2.6/examples/c/3May_4K.txt', '-ascii');
d8000=load('~/hlibpro-2.6/examples/c/3May_8K.txt', '-ascii');
d16000=load('~/hlibpro-2.6/examples/c/3May_16K.txt', '-ascii');
d32000=load('~/hlibpro-2.6/examples/c/3May_32K.txt', '-ascii');
d64000=load('~/hlibpro-2.6/examples/c/3May_64K.txt', '-ascii');
d128000=load('~/hlibpro-2.6/examples/c/3May_128K.txt', '-ascii');



ell2=d2000(:,3);
ell4=d4000(:,3);
ell8=d8000(:,3);
ell16=d16000(:,3);
ell32=d32000(:,3);
ell64=d64000(:,3);
ell128=d128000(:,3);

nu2=d2000(:,2);
nu4=d4000(:,2);
nu8=d8000(:,2);
nu16=d16000(:,2);
nu32=d32000(:,2);
nu64=d64000(:,2);
nu128=d128000(:,2);

sigma2=d2000(:,4);
sigma4=d4000(:,4);
sigma8=d8000(:,4);
sigma16=d16000(:,4);
sigma32=d32000(:,4);
sigma64=d64000(:,4);
sigma128=d128000(:,4);


nnu2=size(nu2,1);
Nnu4=size(nu4,1);
Nnu8=size(nu8,1);
Nnu16=size(nu16,1);
Nnu32=size(nu32,1);
Nnu64=size(nu64,1);
Nnu128=size(nu128,1);

Nsigma2=size(sigma2,1);
Nsigma4=size(sigma4,1);
Nsigma8=size(sigma8,1);
Nsigma16=size(sigma16,1);
Nsigma32=size(sigma32,1);
Nsigma64=size(sigma64,1);
Nsigma128=size(sigma128,1);
Nell2=size(ell2,1);
Nell4=size(ell4,1);
Nell8=size(ell8,1);
Nell16=size(ell16,1);
Nell32=size(ell32,1);
Nell64=size(ell64,1);
Nell128=size(ell128,1);


n2=min(min(size(sigma2,1), size(ell2,1)),size(sigma2,1));
n=n2;
coeff2=sigma2(1:n)./power(ell2(1:n), 2*sigma2(1:n));
n4=min(min(size(sigma4,1), size(ell4,1)),size(sigma4,1));
n=n4;
coeff4=sigma4(1:n)./power(ell4(1:n), 2*sigma4(1:n));
n8=min(min(size(sigma8,1), size(ell8,1)),size(sigma8,1));
n=n8;
coeff8=sigma8(1:n)./power(ell8(1:n), 2*sigma8(1:n));
n16=min(min(size(sigma16,1), size(ell16,1)),size(sigma16,1));
n=n16;
coeff16=sigma16(1:n)./power(ell16(1:n), 2*sigma16(1:n));
n32=min(min(size(sigma32,1), size(ell32,1)),size(sigma32,1));
n=n32;
coeff32=sigma32(1:n)./power(ell32(1:n), 2*sigma32(1:n));
n64=min(min(size(sigma64,1), size(ell64,1)),size(sigma64,1));
n=n64;
coeff64=sigma64(1:n)./power(ell64(1:n), 2*sigma64(1:n));
n128=min(min(size(sigma128,1), size(ell128,1)),size(sigma128,1));
n=n128;
coeff128=sigma128(1:n)./power(ell128(1:n), 2*sigma128(1:n));



grpcoeff = [128000*ones(1,n128) 64000*ones(1,n64), 32000*ones(1,n32), 16000*ones(1,n16), 8000*ones(1,n8),4000*ones(1,n4), 2000*ones(1,n2)];
Ccoeff = [coeff128'  coeff64' coeff32' coeff16' coeff8' coeff4' coeff2'];
%Qnu = quantile(nu32,[.25 .50 .75]); % the quartiles of x

%boxplot(Cnu, grpnu, 'grouporder',{'128000','64000', '32000', '16000', '8000', '4000', '2000'}'labels',{'128','64','32','16','8','4','2'});
boxplot(Ccoeff, grpcoeff, 'grouporder',{'128000','64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});
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
%ylabel('$\ell$','Interpreter','latex');
ylabel('$\sigma^2/\ell^{2\nu}$','Interpreter','latex');
%save_figure(gcf, '21May_box_plots_coeff_N_whole', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
save_figure(gcf, '21May_box_plots_coeff_N_whole', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
%save_figure(gcf, '21May_box_plots_ell_N_whole', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsMay2017/', 'fontsize', 18 )
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
