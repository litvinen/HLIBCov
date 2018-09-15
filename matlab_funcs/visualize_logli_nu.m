clc;
clear;
format long
figure
set(gca,'FontSize',16);


approx2000=load('/home/litvina/111gsl/Matern_cov/D2000/111_8Jan_2000_smallK.txt', '-ascii');
approx4000=load('/home/litvina/111gsl/Matern_cov/D4000/111_8Jan_4000_smallK.txt', '-ascii');
approx8000=load('/home/litvina/111gsl/Matern_cov/D8000/111_8Jan_8000_smallK.txt', '-ascii');
approx16000=load('/home/litvina/111gsl/Matern_cov/D16000/111_8Jan_16000_smallK.txt', '-ascii');
approx32000=load('/home/litvina/111gsl/Matern_cov/D32000/111_9Jan_32000_smallK.txt', '-ascii');

 
ell2=approx2000(:,1);
ell4=approx4000(:,1);
ell8=approx8000(:,1);
ell16=approx16000(:,1);
ell32=approx32000(:,1);
loglike2=approx2000(:,4);
loglike4=approx4000(:,4);
loglike8=approx8000(:,4);
loglike16=approx16000(:,4);
loglike32=approx32000(:,4);


%plot(nu,logdetC,'-r','LineWidth',3);
%hold on
plot(ell2, loglike2, '.', 'LineWidth',3);
hold on;
plot(ell4, loglike4, '+', 'LineWidth',3);
hold on;
plot(ell8, loglike8,'LineWidth',3);
hold on;
plot(ell16, loglike16,'LineWidth',2);
hold on;
plot(ell32, loglike32,'LineWidth',2);
hold on;
%ylabel('\nu');
%ylim([0.01 0.1])
%title('Dependence of logdet(C) on cov. length')
ylabel('loglikelihood')
xlabel('parameter \ell')
legend('2000', '4000', '8000', '16000', '32000')
set(gca,'FontSize',16);
save_figure(gcf, 'logli_ell_N', 'figdir', '.', 'fontsize', 16)

figure
%hold on
%plot(ell2,loglike2,'-b','LineWidth',2);
%hold on

%ylabel('-log-likelihood');
%ylabel('\nu');
%ylim([0.01 0.1])
%title('Dependence of log-likelihood on cov. length')
%xlabel('cov. length')
%set(gca,'FontSize',16);

%save_figure(gcf, 'log_like_length_nu33_k5', 'figdir', '.', 'fontsize', 16)


% 
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
