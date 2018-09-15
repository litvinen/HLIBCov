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

flag_param =0; % \coeff
%flag_param =6; % \nu=0.9
%flag_param=7; % \ell=0.7
%flag_param=8; % \sigma^2=1.0
flag_size = 2; % 1='2000', 2='4000' 3='8000', 4='16000',  5='32000', 6='64000', 
% datafile=('~/hlibpro-2.6.1/examples/results/111_5Mai2018_vs_eps_51.txt');
% my_errorbox_18Aug18_vs_eps_50_final(datafile, flag_param, flag_size);
if(flag_param==6) %\nu
    truth=0.9;
end    
if(flag_param==7) %\ell
    truth=0.7;
end    
if(flag_param==8) %\sigma
    truth=1.0;
end    
if(flag_param==0) %\coeff=sigma2/power(ell,2nu)
    truth=1.0/power(0.7,2*0.9);
end    
hold all;

%data=zeros();
for jj=1:69
    datafile=strcat('~/hlibpro-2.6.1/examples/results/111_5Mai2018_vs_eps_', int2str(jj), '.txt');
   output = my_errorbox_2Sept18_vs_eps_50(datafile, flag_param, flag_size);
   eps = output(:,1)
   %n = size(output(:,1),1)
   %v = repelem(jj, n)';
   jj
   if(size(eps,1)>0)
         eps_r=eps;
   end      
   if(jj==1)
%       all_values = [v output(:,2)]
       all_values = [output(:,2)]'
     
   else    
%       temp = [v output(:,2)]
       %temp = [output(:,2)]
       all_values = [all_values; output(:,2)']
   end

end

factor=5; 
fullout='False'; 
barcol='b'; 
outliercol='r'; 
color='m'; 
prob=0.5; 
show='True';
method='MBD'; 
depth=[]; 
figure
%fbplot(all_values', eps_r )

%figure
%fbplot(all_values')
x=1:1:10

fbplot(all_values', x' , depth,method,show,prob,color,outliercol,barcol,fullout,factor )
%32
%xlabel('q, $\varepsilon=2^{q}\varepsilon_0,\,\varepsilon_0=8\cdot 10^{-8}$','Interpreter','latex');
%8
%xlabel('q, $\varepsilon=2^{q}\varepsilon_0,\,\varepsilon_0=8\cdot 10^{-7}$','Interpreter','latex');
%4
xlabel('q, $\varepsilon=2^{q}\varepsilon_0,\,\varepsilon_0=2\cdot 10^{-6}$','Interpreter','latex');

%eps=output(:,1)
%hold on
%xlabel('replicates','Interpreter','latex');
if(flag_param==6) %\nu
  ylabel('$\hat{\nu}$','Interpreter','latex');
  filename=sprintf('B_fbplot_nu_2Sept2018_%s', '4');
  ylim([0.86, 0.94]);
  xlim([1, 11]);
  t=0:1:11;
  y=truth*ones(size(t));
  hold on
  plot(t,y,':g','LineWidth',3);
  hold on
end    
if(flag_param==7) %\ell
  ylabel('$\hat{\ell}$','Interpreter','latex');
  filename=sprintf('C_fbplot_ell_2Sept2018_%s', '4');
  ylim([0.55, 0.9]);
  xlim([1, 11]);
  t=0:1:11;
  y=truth*ones(size(t));
  hold on
  plot(t,y,':g','LineWidth',3);
  hold on
% 
end    
if(flag_param==8) %\sigma
  ylabel('$\hat{\sigma^2}$','Interpreter','latex');
  filename=sprintf('C_fbplot_sigma_2Sept2018_%s', '4')
  ylim([0.73, 1.37]);
  xlim([1, 11]);
  t=0:1:11;
  y=truth*ones(size(t));
  hold on
  plot(t,y,':g','LineWidth',3);
  hold on
% 
end    
if(flag_param==0) %coeff
  ylabel('$\hat{\sigma}^2/\hat{\ell}^{2\hat{\nu}}$','Interpreter','latex');
  filename=sprintf('C_fbplot_coeff_2Sept2018_%s', '4')
  ylim([1.4, 2.4]);
  xlim([1, 11]);
  t=0:1:11;
  y=truth*ones(size(t));
  hold on
  plot(t,y,':g','LineWidth',3);
  hold on
% 
end    
%xlim([0,0.00045]);
save_figure(gcf, filename, 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figsApril2018/', 'fontsize', 18 )
%save_figure(gcf, filename, 'figdir', '/home/litvina/', 'fontsize', 18 )




%iosr.statistics.functionalBoxPlot(eps, all_values)%, 'inner_u', 'main');
        
  % datafile='~/hlibpro-2.6.1/examples/111_21Mai2018_vs_eps_2.txt';
  % my_errorbox_6Mai18_vs_eps_50(datafile, flag);
  

%truth_coeff=truth_sigma./power(truth_ell, 2*truth_sigma);

  
  
%truth=truth_sigma./power(truth_ell, 2*truth_sigma);

 