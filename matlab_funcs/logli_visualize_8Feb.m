clc;
clear;
format long
figure
set(gca,'FontSize',16);


approx2000=load('/home/litvina/111gsl/Matern_cov/C2000/111_8Jan_2000.txt', '-ascii');
approx4000=load('/home/litvina/111gsl/Matern_cov/C4000/111_8Jan_4000.txt', '-ascii');
approx8000=load('/home/litvina/111gsl/Matern_cov/C8000/111_8Jan_8000.txt', '-ascii');
approx16000=load('/home/litvina/111gsl/Matern_cov/C16000/111_8Jan_16000.txt', '-ascii');
approx32000=load('/home/litvina/111gsl/Matern_cov/C32000/111_8Jan_32000.txt', '-ascii');

 
ell2=approx2000(1:101,3);
ell4=approx4000(1:101,3);
ell8=approx8000(1:101,3);
ell16=approx16000(1:21,3);
ell32=approx32000(1:11,3);
loglike2=approx2000(1:101,5);
loglike4=approx4000(1:101,5);
loglike8=approx8000(1:101,5);
loglike16=approx16000(1:21,5);
loglike32=approx32000(1:11,5);


%plot(nu,logdetC,'-r','LineWidth',3);
%hold on
semilogy(ell2, loglike2,'LineWidth',3);
hold on;
semilogy(ell4, loglike4,'LineWidth',3);
hold on;
semilogy(ell8, loglike8,'LineWidth',3);
hold on;
semilogy(ell16, loglike16,'LineWidth',2);
hold on;
semilogy(ell32, loglike32,'LineWidth',2);
hold on;
%ylabel('\nu');
%ylim([0.01 0.1])
%title('Dependence of logdet(C) on cov. length')
ylabel('$-\mathcal{L}$','Interpreter','latex');
xlabel('$\nu$','Interpreter','latex');

legend('2000', '4000', '8000', '16000', '32000')
set(gca,'FontSize',16);
save_figure(gcf, 'logli_nu_N_8Feb', 'figdir', '.', 'fontsize', 18)

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
