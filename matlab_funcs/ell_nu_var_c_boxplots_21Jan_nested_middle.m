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
c32 = sigma32(1:26)./power(ell32(1:26), 2*nu32(1:26));



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



grpell = [2000*ones(1,Nell2),4000*ones(1,Nell4), 8000*ones(1,Nell8), 16000*ones(1,Nell16), 32000*ones(1,Nell32)]
grpnu = [2000*ones(1,Nnu2),4000*ones(1,Nnu4), 8000*ones(1,Nnu8), 16000*ones(1,Nnu16), 32000*ones(1,Nnu32)]
grpsigma = [2000*ones(1,Nsigma2),4000*ones(1,Nsigma4), 8000*ones(1,Nsigma8), 16000*ones(1,Nsigma16), 32000*ones(1,Nsigma32)]
grpc = [2000*ones(1,Nc2),4000*ones(1,Nc4), 8000*ones(1,Nc8), 16000*ones(1,Nc16), 32000*ones(1,Nc32)]
Cell = [ell2' ell4' ell8' ell16' ell32'];
Cnu = [nu2' nu4' nu8' nu16' nu32'];
Csigma = [sigma2' sigma4' sigma8' sigma16' sigma32'];
Cc = [c2' c4' c8' c16'  c32'];

boxplot(Cell, grpell);
xlabel('number of locations ');
ylabel('cov. length ell');
save_figure(gcf, '21Jan_box_plots_ell_N_nest_middle', 'figdir', '.', 'fontsize', 16)
figure
boxplot(Cnu, grpnu);
xlabel('number of locations ');
ylabel('nu');
save_figure(gcf, '21Jan_box_plots_nu_N_nest_middle', 'figdir', '.', 'fontsize', 16)
figure
boxplot(Csigma, grpsigma);
xlabel('number of locations ');
ylabel('variance sigma^2');
save_figure(gcf, '21Jan_box_plots_sigma_N_nest_middle', 'figdir', '.', 'fontsize', 16)
figure
boxplot(Cc, grpc);
xlabel('number of locations ');
ylabel('sigma^2/power(ell, 2 \nu)');
save_figure(gcf, '21Jan_box_plots_c_N_nest_middle', 'figdir', '.', 'fontsize', 16)
