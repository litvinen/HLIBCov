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

flag=6; % \nu=0.9
flag=7; % \ell=0.7
flag=9; % \sigma=1.0
flag2=1; % 2 means 4000,3 means 8000,4 means 16000, 5 means 32000 ,6 means 64000
 datafile=('~/hlibpro-2.6.1/examples/results/111_5Mai2018_vs_eps_51.txt');
 my_errorbox_18Aug18_vs_eps_50_final(datafile, flag, flag2);
if(flag==6) %\nu
    truth=0.9;
end    
if(flag==7) %\ell
    truth=0.7;
end    
if(flag==9) %\sigma
    truth=1.0;
end    
hold all;

for jj=2:5
   datafile=strcat('~/hlibpro-2.6.1/examples/results/111_5Mai2018_vs_eps_', int2str(jj), '.txt');
   my_errorbox_18Aug18_vs_eps_50(datafile, flag, flag2);
end
  % datafile='~/hlibpro-2.6.1/examples/111_21Mai2018_vs_eps_2.txt';
  % my_errorbox_6Mai18_vs_eps_50(datafile, flag);
  

%truth_coeff=truth_sigma./power(truth_ell, 2*truth_sigma);

  
  
%truth=truth_sigma./power(truth_ell, 2*truth_sigma);

  
%legend('2','4', '8', '16', '32', '64', 'truth')
if(flag==6)
  ylabel('$\hat{\nu}$','Interpreter','latex');
%  save_figure(gcf, '6Mai2018_graphs_nuB', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
end
if(flag==7)
  ylabel('$\hat{\ell}$','Interpreter','latex');
 % save_figure(gcf, '6Mai2018_graphs_ellB', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
end
if(flag==9)
  ylabel('$\hat{\sigma}$','Interpreter','latex');
 % save_figure(gcf, '6Mai2018_graphs_sigmaB', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
end

%my_errorbox_vs_adaptk(datafile, 16000)
%my_errorbox_vs_adaptk(datafile, 128000);

%my_graphs_vs_eps_2May18(datafile);

%my_errorbox_vs_fixedk(datafile, 16000)
%my_errorbox_compute_fixedk(datafile, 8.0);
%my_errorbox_compute_fixedk_8(datafile, 6.0);
%my_errorbox_compute_fixedk_64(datafile, 9.0);
%my_errorbox_compute_fixedk_64(datafile, 12.0);


%datafile='~/hlibpro-2.6.1/examples/111res_2Mai2018_par3d_adaptive_div2.txt';
%my_errorbox_compute(datafile);

%datafile='~/hlibpro-2.6.1/examples/111res_29April2018_par3d_1e-8.txt';
%my_errorbox_compute_short(datafile);
%datafile='~/hlibpro-2.6.1/examples/111res_29April2018_par3d_1e-6.txt';
%my_errorbox_compute_short(datafile);
%figure
%datafile='~/hlibpro-2.6.1/examples/111res_29April2018_par3d_1e-6.txt';
%my_errorbox_compute_short(datafile);

