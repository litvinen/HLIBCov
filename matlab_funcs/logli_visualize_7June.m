clc;
clear;
format long
figure
set(gca,'FontSize',16);


mydata=load('/home/litvina/hlibpro-2.6/examples/111logli_ell_7June2017.txt', '-ascii');

ind= mydata(:,1)==2000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/2000;
loglog((ell), logli,'LineWidth',3);
hold on;
ind= mydata(:,1)==4000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/4000;
loglog((ell), logli, '-s','LineWidth',3);
hold on;
ind= mydata(:,1)==8000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/8000;
loglog(ell, logli, '-d' ,'LineWidth',3);
hold on;
ind= mydata(:,1)==16000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/16000;
loglog(ell, logli, '-+', 'LineWidth',3);
hold on;
ind= mydata(:,1)==32000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/32000;
loglog(ell, logli, '-*','LineWidth',3);
hold on;
ind= mydata(:,1)==64000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/64000;
loglog(ell, logli, '->', 'LineWidth',3);
hold on;
ind= mydata(:,1)==128000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/128000;
loglog(ell, logli, '-<' ,'LineWidth',3);
xlim([0.05 0.2]);
hold on;
ylabel('$-\mathcal{L}/N$','Interpreter','latex');
xlabel('$\ell$','Interpreter','latex');
legend('2000', '4000', '8000', '16000', '32000', '64000', '128000')
set(gca,'FontSize',16);
save_figure(gcf, 'logli_ell_7June2017_loglog', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figs/', 'fontsize', 18)

figure
ind= mydata(:,1)==2000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/2000;
plot((ell), logli, 'LineWidth',3);
hold on;
ind= mydata(:,1)==4000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/4000;
plot((ell), logli, '-s', 'LineWidth',3);
hold on;
ind= mydata(:,1)==8000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/8000;
plot(ell, logli, '-d', 'LineWidth',3);
hold on;
ind= mydata(:,1)==16000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/16000;
plot(ell, logli, '-+', 'LineWidth',3);
hold on;
ind= mydata(:,1)==32000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/32000;
plot(ell, logli, '-*','LineWidth',3);
hold on;
ind= mydata(:,1)==64000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/64000;
plot(ell, logli, '-<','LineWidth',3);
hold on;
ind= mydata(:,1)==128000;
ell = mydata(ind,2);
logli = (mydata(ind,7))/128000;
plot(ell, logli, '->','LineWidth',3);
xlim([0.05 0.2]);
hold on;
ylabel('$-\mathcal{L}/N$','Interpreter','latex');
xlabel('$\ell$','Interpreter','latex');
legend('2000', '4000', '8000', '16000', '32000', '64000', '128000')
set(gca,'FontSize',16);
save_figure(gcf, 'logli_ell_7June2017_plot', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figs/', 'fontsize', 18)



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
