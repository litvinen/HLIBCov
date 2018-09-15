clc;
clear;
format long
set(gca,'FontSize',18);
ell2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_11Jan_2000_ell_smallK.txt', '-ascii');
ell4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_11Jan_4000_ell_smallK.txt', '-ascii');
ell8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_11Jan_8000_ell_smallK.txt', '-ascii');
ell16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_11Jan_16000_ell_smallK.txt', '-ascii');
ell32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_11Jan_32000_ell_smallK.txt', '-ascii');

%for nu
nu2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_12Jan_2000_nu.txt', '-ascii');
nu4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_12Jan_4000_nu.txt', '-ascii');
nu8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_12Jan_8000_nu.txt', '-ascii');
nu16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_13Jan_16000_nu.txt', '-ascii');
nu32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_13Jan_32000_nu.txt', '-ascii');

%for sigma
sigma2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_15Jan_2000_sigma.txt', '-ascii');
sigma4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_15Jan_4000_sigma.txt', '-ascii');
sigma8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_15Jan_8000_sigma.txt', '-ascii');
sigma16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_15Jan_16000_sigma.txt', '-ascii');
sigma32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_15Jan_32000_sigma.txt', '-ascii');

%for \ell
%approx2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_9Jan_2000_sigma_smallK.txt', '-ascii');
%approx4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_9Jan_4000_sigma_smallK.txt', '-ascii');
%approx8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_9Jan_8000_sigma_smallK.txt', '-ascii');
%approx16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_9Jan_18000_sigma_smallK.txt', '-ascii');
%approx32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_9Jan_32000_sigma_smallK.txt', '-ascii');

ell2=ell2000(:,1);
ell4=ell4000(:,1);
ell8=ell8000(:,1);
ell16=ell16000(:,1);
ell32=ell32000(:,1);


nu2 = nu2000(:,1);
nu4 = nu4000(:,1);
nu8 = nu8000(:,1);
nu16 = nu16000(:,1);
nu32 = nu32000(:,1);

sigma2 = sigma2000(:,1);
sigma4 = sigma4000(:,1);
sigma8 = sigma8000(:,1);
sigma16 = sigma16000(:,1);
sigma32 = sigma32000(:,1);

c2 = sigma2(1:50)./power(ell2(1:50), 2*nu2(1:50));
c4 = sigma4(1:50)./power(ell4(1:50), 2*nu4(1:50));
c8 = sigma8(1:50)./power(ell8(1:50), 2*nu8(1:50));
c16 = sigma16(1:50)./power(ell16(1:50), 2*nu16(1:50));
c32 = sigma32(1:44)./power(ell32(1:44), 2*nu32(1:44));



Nell2=size(ell2000,1);
Nell4=size(ell4000,1);
Nell8=size(ell8000,1);
Nell16=size(ell16000,1);
Nell32=size(ell32000,1);

Nnu2=size(nu2000,1);
Nnu4=size(nu4000,1);
Nnu8=size(nu8000,1);
Nnu16=size(nu16000,1);
Nnu32=size(nu32000,1);

Nsigma2=size(sigma2000,1);
Nsigma4=size(sigma4000,1);
Nsigma8=size(sigma8000,1);
Nsigma16=size(sigma16000,1);
Nsigma32=size(sigma32000,1);

Nc2=size(c2,1);
Nc4=size(c4,1);
Nc8=size(c8,1);
Nc16=size(c16,1);
Nc32=size(c32,1);

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



grpell = [ 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
grpnu = [32000*ones(1,Nnu32), 16000*ones(1,Nnu16), 8000*ones(1,Nnu8), 4000*ones(1,Nnu4),  2000*ones(1,Nnu2)]
grpsigma = [32000*ones(1,Nsigma32),  16000*ones(1,Nsigma16), 8000*ones(1,Nsigma8), 4000*ones(1,Nsigma4), 2000*ones(1,Nsigma2)]
grpc = [32000*ones(1,Nc32), 16000*ones(1,Nc16), 8000*ones(1,Nc8), 4000*ones(1,Nc4),  2000*ones(1,Nc2)]
Cell = [ell32' ell16' ell8' ell4' ell2'];
Cnu = [nu32' nu16' nu8' nu4' nu2'];
Csigma = [sigma32' sigma16' sigma8' sigma4' sigma2'];
Cc = [c32' c16' c8' c4'  c2'];
Qell = quantile(ell32,[.25 .50 .75]); % the quartiles of x
Qnu = quantile(nu32,[.25 .50 .75]); % the quartiles of x
Qsigma2 = quantile(sigma32,[.25 .50 .75]); % the quartiles of x
Qc = quantile(c32,[.25 .50 .75]); % the quartiles of x

boxplot(Cell, grpell, 'grouporder',{'32000', '16000', '8000', '4000', '2000'});
hold all;
x=0:1:6;
y25=Qell(1)*ones(size(x));
y75=Qell(3)*ones(size(x));
hold all
plot(x,y25,':g','LineWidth',2);
hold all;
plot(x,y75,':g','LineWidth',2);
hold all

xlabel('$n$','Interpreter','latex');
ylabel('$\ell$','Interpreter','latex');
save_figure(gcf, '7Feb_box_plots_ell_N_nest_middle', 'figdir', '.', 'fontsize', 18 )
figure
boxplot(Cnu, grpnu, 'grouporder',{'32000', '16000', '8000', '4000', '2000'});
hold all;
y25=Qnu(1)*ones(size(x));
y75=Qnu(3)*ones(size(x));
hold all
plot(x,y25,':g','LineWidth',2);
hold all;
plot(x,y75,':g','LineWidth',2);
hold all


xlabel('$n$','Interpreter','latex');
ylabel('$\nu$','Interpreter','latex');
save_figure(gcf, '7Feb_box_plots_nu_N_nest_middle', 'figdir', '.', 'fontsize', 18)
figure
boxplot(Csigma, grpsigma, 'grouporder',{'32000', '16000', '8000', '4000', '2000'});
hold all
y25=Qsigma2(1)*ones(size(x));
y75=Qsigma2(3)*ones(size(x));
hold all
plot(x,y25,':g','LineWidth',2);
hold all;
plot(x,y75,':g','LineWidth',2);
hold all

xlabel('$n$','Interpreter','latex');
ylabel('$\sigma^2$','Interpreter','latex');
save_figure(gcf, '7Feb_box_plots_sigma_N_nest_middle', 'figdir', '.', 'fontsize', 18)
figure
boxplot(Cc, grpc, 'grouporder',{'32000', '16000', '8000', '4000', '2000'});

hold all
y25=Qc(1)*ones(size(x));
y75=Qc(3)*ones(size(x));
hold all
plot(x,y25,':g','LineWidth',2);
hold all;
plot(x,y75,':g','LineWidth',2);
hold all
xlabel('$n$','Interpreter','latex');
ylabel('$\frac{\sigma^2}{\ell^{2\nu}}$','Interpreter','latex');
save_figure(gcf, '7Feb_box_plots_c_N_nest_middle', 'figdir', '.', 'fontsize', 18)

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
