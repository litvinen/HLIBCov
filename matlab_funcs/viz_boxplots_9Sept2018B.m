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
%flag=7; % \ell=0.7
%flag=8; % \sigma^2=1.0
flag2=5; % 2 3 4 5 6 7
 datafile=('~/hlibpro-2.6.1/examples/results/111_5Mai2018_vs_eps_2.txt');
 my_errorbox_9Sept18_vs_eps_50_final(datafile, flag, flag2);
if(flag==6) %\nu
    truth=0.9;
end    
if(flag==7) %\ell
    truth=0.7;
end    
if(flag==8) %\sigma
    truth=1.0;
end    
hold all;

%data=zeros();
for jj=2:68
   datafile=strcat('~/hlibpro-2.6.1/examples/results/111_5Mai2018_vs_eps_', int2str(jj), '.txt');
   output = my_errorbox_9Sept18_vs_eps_50(datafile, flag, flag2);
   eps=output(:,1)
   if(jj==2)
       all_values = output(:,2)
   else    
       all_values = [all_values, output(:,2)]
   end    
end
%eps=output(:,1)
%iosr.statistics.functionalBoxPlot(eps, all_values)%, 'inner_u', 'main');
        
  % datafile='~/hlibpro-2.6.1/examples/111_21Mai2018_vs_eps_2.txt';
  % my_errorbox_6Mai18_vs_eps_50(datafile, flag);
  

%truth_coeff=truth_sigma./power(truth_ell, 2*truth_sigma);

  
  
%truth=truth_sigma./power(truth_ell, 2*truth_sigma);

  
%legend('2','4', '8', '16', '32', '64', 'truth')
if(flag==6)
  ylabel('$\hat{\nu}$','Interpreter','latex');
%  ylim([0.86 0.92]);
%  xlim([0.9*1e-6 5*1e-3]);
   xlim([0.5*1e-7, 1e-4]);
   %xlim([1e-8, 1e-4]);

  % xticks([10^-8 10^-7 10^-6 10^-5 10^-4])
  % xticklabels({'10^{-7}','10^{-6}','10^{-5}','10^{-4}'})
  save_figure(gcf, '12Sept2018_graphs_nu_32K', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
end
if(flag==7)
  ylabel('$\hat{\ell}$','Interpreter','latex');
  %ylim([0.6 0.9]);
  %xlim([2*1e-6 5*1e-4]);
  xlim([0.5*1e-7, 1e-4]);
 %  xlim([1e-8, 1e-4]);

  % xticks([10^-8 10^-7 10^-6 10^-5 10^-4])
  % xticklabels({'10^{-7}','10^{-6}','10^{-5}','10^{-4}'})
  save_figure(gcf, '12Sept2018_graphs_ell_32K', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
end
if(flag==8)
  ylabel('$\hat{\sigma}^2$','Interpreter','latex');
 % ylim([0.7 1.4]);
 % xlim([0.9*1e-6 5*1e-3]);
   xlim([0.5*1e-7, 1e-4]);
  % xlim([1e-8, 1e-4]);

  % xticks([10^-8 10^-7 10^-6 10^-5 10^-4])
  % xticklabels({'10^{-7}','10^{-6}','10^{-5}','10^{-4}'})
 
  save_figure(gcf, '12Sept2018_graphs_sigma2_32K', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
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

