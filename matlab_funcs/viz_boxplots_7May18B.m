clc;
clear;
format long
set(gca,'FontSize',18);

%datafile='~/hlibpro-2.6.1/examples/111res_29April2018_par3d_fixed.txt';
%datafile='~/hlibpro-2.6.1/examples/111res_2Mai2018_par3d_adaptive.txt';


%datafile='~/hlibpro-2.6.1/examples/111_5Mai2018_vs_eps_2.txt';
%my_errorbox_6Mai18_vs_eps_50(datafile);
%datafile='~/hlibpro-2.6.1/examples/111_5Mai2018_vs_eps_3.txt';
%my_errorbox_6Mai18_vs_eps_50(datafile);

%flag=6; % \nu=0.9
%flag=7; % \ell=0.7
flag=9; % \sigma=1.0
   %datafile=strcat('~/hlibpro-2.6.1/examples/111_5Mai2018_vs_eps_1.txt');

   %datafile=strcat('~/hlibpro-2.6.1/examples/111res_2Mai2018_par3d_adaptive_div2.txt');
   datafile=strcat('~/hlibpro-2.6.1/examples/111res_3Mai2018_vs_eps_128K.txt');
   d=load(datafile, '-ascii');
   index0=(d(:,2)==2000);
   D2=d(index0,:);
   index0=(d(:,2)==4000);
   D4=d(index0,:);
   index0=(d(:,2)==8000);
   D8=d(index0,:);
   index0=(d(:,2)==16000);
   D16=d(index0,:);
   index0=(d(:,2)==32000);
   D32=d(index0,:);
   index0=(d(:,2)==64000);
   D64=d(index0,:);
   index0=(d(:,2)==128000);
   D128=d(index0,:);

   %datafile=strcat('~/hlibpro-2.6.1/examples/111res_1Mai2018_par3d_adaptive.txt');
   datafile=strcat('~/hlibpro-2.6.1/examples/data.txt');
   d=load(datafile, '-ascii');
   index0=(d(:,2)==2000);
   D2=cat(1, D2, d(index0,:));
   index0=(d(:,2)==4000);
   D4=cat(1, D4, d(index0,:));
   index0=(d(:,2)==8000);
   D8=cat(1, D8, d(index0,:));
   index0=(d(:,2)==16000);
   D16=cat(1, D16, d(index0,:));
   index0=(d(:,2)==32000);
   D32=cat(1, D32, d(index0,:));
   index0=(d(:,2)==64000);
   D64=cat(1, D64, d(index0,:));
   index0=(d(:,2)==128000);
   D128=cat(1, D128, d(index0,:));

%    datafile=strcat('~/hlibpro-2.6.1/examples/111res_29April2018_par3d_fixed.txt');
%    d=load(datafile, '-ascii');
%    index0=(d(:,2)==2000);
%    D2=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==4000);
%    D4=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==8000);
%    D8=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==16000);
%    D16=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==32000);
%    D32=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==64000);
%    D64=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==128000);
%    D128=[d(index0,1) d(index0,:)];
%    datafile=strcat('~/hlibpro-2.6.1/examples/111res_29April2018_par3d_1e-4.txt');
%    d=load(datafile, '-ascii');
%    index0=(d(:,2)==2000);
%    D2=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==4000);
%    D4=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==8000);
%    D8=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==16000);
%    D16=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==32000);
%    D32=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==64000);
%    D64=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==128000);
%    D128=[d(index0,1) d(index0,:)];
%    datafile=strcat('~/hlibpro-2.6.1/examples/111res_29April2018_par3d_1e-6.txt');
%    d=load(datafile, '-ascii');
%    index0=(d(:,2)==2000);
%    D2=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==4000);
%    D4=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==8000);
%    D8=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==16000);
%    D16=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==32000);
%    D32=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==64000);
%    D64=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==128000);
%    D128=[d(index0,1) d(index0,:)];
% 
% datafile=strcat('~/hlibpro-2.6.1/examples/111res_29April2018_par3d_1e-8.txt');
%    d=load(datafile, '-ascii');
%    index0=(d(:,2)==2000);
%    D2=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==4000);
%    D4=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==8000);
%    D8=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==16000);
%    D16=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==32000);
%    D32=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==64000);
%    D64=[d(index0,1) d(index0,:)];
%    index0=(d(:,2)==128000);
%    D128=[d(index0,1) d(index0,:)];
% 


for jj=1:50
   datafile=strcat('~/hlibpro-2.6.1/examples/111_5Mai2018_vs_eps_', int2str(jj), '.txt');
   d=load(datafile, '-ascii');
   index0=(d(:,2)==2000);
   d2000=d(index0,:);
   D2=cat(1, D2, d2000);
   index0=(d(:,2)==4000);
   d4000=d(index0,:);
   D4=cat(1, D4, d4000);
   index0=(d(:,2)==8000);
   d8000=d(index0,:);
   D8=cat(1, D8, d8000);
   index0=(d(:,2)==16000);
   d16000=d(index0,:);
   D16=cat(1, D16, d16000);
   index0=(d(:,2)==32000);
   d32000=d(index0,:);
   D32=cat(1, D32, d32000);
   index0=(d(:,2)==64000);
   d64000=d(index0,:);
   D64=cat(1, D64, d64000);
   index0=(d(:,2)==128000);
   d128000=d(index0,:);
   D128=cat(1, D128, d128000);


end
ell2=D2(:,7);
ell4=D4(:,7);
ell8=D8(:,7);
ell16=D16(:,7);
ell32=D32(:,7);
ell64=D64(:,7);
ell128=D128(:,7);

nu2=D2(:,6);
nu4=D4(:,6);
nu8=D8(:,6);
nu16=D16(:,6);
nu32=D32(:,6);
nu64=D64(:,6);
nu128=D128(:,6);

sigma2=D2(:,9);
sigma4=D4(:,9);
sigma8=D8(:,9);
sigma16=D16(:,9);
sigma32=D32(:,9);
sigma64=D64(:,9);
sigma128=D128(:,9);


Nell2=size(ell2,1);
Nell4=size(ell4,1);
Nell8=size(ell8,1);
Nell16=size(ell16,1);
Nell32=size(ell32,1);
Nell64=size(ell64,1);
Nell128=size(ell128,1);

n=Nell2;
coeff2=sigma2(1:n)./power(ell2(1:n), 2*sigma2(1:n));
n=Nell4;
coeff4=sigma4(1:n)./power(ell4(1:n), 2*sigma4(1:n));
n=Nell8;
coeff8=sigma8(1:n)./power(ell8(1:n), 2*sigma8(1:n));
n=Nell16;
coeff16=sigma16(1:n)./power(ell16(1:n), 2*sigma16(1:n));
n=Nell32;
coeff32=sigma32(1:n)./power(ell32(1:n), 2*sigma32(1:n));
n=Nell64;
coeff64=sigma64(1:n)./power(ell64(1:n), 2*sigma64(1:n));
n=Nell128;
coeff128=sigma128(1:n)./power(ell128(1:n), 2*sigma128(1:n));




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


grp = [128000*ones(1,Nell128), 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%grp = [128000*ones(1,Nell128) 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
%C = [ell128'  ell64' ell32' ell16' ell8' ell4' ell2'];
%C = [ell16' ell8' ell4' ell2'];
%C = [nu32' nu16' nu8' nu4' nu2'];
%C = [nu128'  nu64' nu32' nu16' nu8' nu4' nu2'];
%C = [sigma32' sigma16' sigma8' sigma4' sigma2'];
C = [sigma128'  sigma64' sigma32' sigma16' sigma8' sigma4' sigma2'];
%C = [coeff128'  coeff64' coeff32' coeff16' coeff8' coeff4' coeff2'];
%C = [coeff32' coeff16' coeff8' coeff4' coeff2'];
%Qell = quantile(ell32,[.25 .50 .75]); % the quartiles of x


%boxplot(C, grp, 'grouporder',{'16000', '8000', '4000', '2000'},'labels',{'16','8','4','2'});
boxplot(C, grp, 'grouporder',{'128000', '64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});

truth_ell=0.7;
truth_nu=0.9;
truth_sigma=1.0;
truth_coeff=truth_sigma./power(truth_ell, 2*truth_sigma);

x=0:1:8;
y=truth_ell*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
hold all



%xlabel('$n$, samples in thousands','Interpreter','latex');
%ylabel('$\hat{\ell}$','Interpreter','latex');
%save_figure(gcf, '7Mai2018_box_plots_ell', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )


figure
grp = [128000*ones(1,Nell128), 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
C = [nu128' nu64' nu32' nu16' nu8' nu4' nu2'];
boxplot(C, grp, 'grouporder',{'128000', '64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});
x=0:1:8;
y=truth_nu*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
hold all

%xlabel('$n$, samples in thousands','Interpreter','latex');
%ylabel('$\hat{\nu}$','Interpreter','latex');
%save_figure(gcf, '7Mai2018_box_plots_nu', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )


figure
grp = [128000*ones(1,Nell128), 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
C = [sigma128' sigma64' sigma32' sigma16' sigma8' sigma4' sigma2'];
boxplot(C, grp, 'grouporder',{'128000', '64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128', '64','32','16','8','4','2'});
x=0:1:8;
y=truth_sigma*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
ylim([0.8 1.2])
hold all

%xlabel('$n$, samples in thousands','Interpreter','latex');
%ylabel('$\hat{\sigma}^2$','Interpreter','latex');
%save_figure(gcf, '7Mai2018_box_plots_sigma2', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )

figure
grp = [128000*ones(1,Nell128), 64000*ones(1,Nell64), 32000*ones(1,Nell32), 16000*ones(1,Nell16), 8000*ones(1,Nell8),4000*ones(1,Nell4), 2000*ones(1,Nell2)];
C = [coeff128' coeff64' coeff32' coeff16' coeff8' coeff4' coeff2'];
boxplot(C, grp, 'grouporder',{'128000', '64000', '32000', '16000', '8000', '4000', '2000'},'labels',{'128','64','32','16','8','4','2'});
xlabel('$n$, samples in thousands','Interpreter','latex');
ylabel('$\hat{\sigma}^2/\hat{\ell}^{2\hat{\nu}}$','Interpreter','latex');
x=0:1:8;
y=truth_coeff*ones(size(x));
hold all
plot(x,y,':g','LineWidth',2);
hold all

save_figure(gcf, '7Mai2018_box_plots_coeff', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
