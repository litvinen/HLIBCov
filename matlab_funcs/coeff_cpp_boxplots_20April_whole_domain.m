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
nnu2=size(nu2000,1);
Nnu4=size(nu4000,1);
Nnu8=size(nu8000,1);
Nnu16=size(nu16000,1);
Nnu32=size(nu32000,1);
Nnu64=size(nu64000,1);
Nnu128=size(nu128000,1);
Nnu256=size(nu256000,1);
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
ell2000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_2K_19April.txt', '-ascii');
ell4000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_4K_19April.txt', '-ascii');
ell8000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_8K_19April.txt', '-ascii');
ell16000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_16K_19April.txt', '-ascii');
ell32000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_32K_19April.txt', '-ascii');
ell64000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_64K_19April.txt', '-ascii');
ell128000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_128K_19April.txt', '-ascii');
ell256000=load('/home/litvina/hlibpro-2.6/examples/111res_ell_WHOLE_DOMAIN_256K_20April.txt', '-ascii');
ell2=ell2000(:,2);
ell4=ell4000(:,2);
ell8=ell8000(:,2);
ell16=ell16000(:,2);
ell32=ell32000(:,2);
ell64=ell64000(:,2);
ell128=ell128000(:,2);
ell256=ell256000(:,2);
Nell2=size(ell2000,1);
Nell4=size(ell4000,1);
Nell8=size(ell8000,1);
Nell16=size(ell16000,1);
Nell32=size(ell32000,1);
Nell64=size(ell64000,1);
Nell128=size(ell128000,1);
Nell256=size(ell256000,1);


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

n256=min(min(size(sigma256,1), size(ell256,1)),size(sigma256,1));
n=n256;
coeff256=sigma256(1:n)./power(ell256(1:n), 2*sigma256(1:n));



grpcoeff = [256000*ones(1,n256) 128000*ones(1,n128) 64000*ones(1,n64), 32000*ones(1,n32), 16000*ones(1,n16), 8000*ones(1,n8),4000*ones(1,n4), 2000*ones(1,n2)];
Ccoeff = [coeff256'  coeff128'  coeff64' coeff32' coeff16' coeff8' coeff4' coeff2'];
%Qnu = quantile(nu32,[.25 .50 .75]); % the quartiles of x

%boxplot(Cnu, grpnu, 'grouporder',{'128000','64000', '32000', '16000', '8000', '4000', '2000'}'labels',{'128','64','32','16','8','4','2'});
boxplot(Ccoeff, grpcoeff, 'grouporder',{'256000','128000','64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'256','128','64','32','16','8','4','2'});
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
ylabel('$\sigma^2/\ell^{2\nu}$','Interpreter','latex');
save_figure(gcf, '20April_box_plots_coeff_N_whole', 'figdir', '.', 'fontsize', 20 )
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
