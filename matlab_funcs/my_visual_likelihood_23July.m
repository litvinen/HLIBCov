%24 Feb.
%Data 23Feb_logli_ell.txt, 32000
%Data 23Feb_logli_nu.txt, 32000
%Data 23Feb_logli_sigma2.txt, 32000

clc;
clear
set(gca,'FontSize',20)
%mydata=load('/home/litvina/111gsl/Matern_cov/L.txt');


% Take L=L(\ell) or L(\nu)
%X=load('/home/litvina/NEWMIMCLIB/mimclib_ver7/tests/CEM/111goals_23Feb.txt', '-ascii');
mydata=load('/home/litvina/111gsl/Matern_cov/E32000/23Feb_logli.txt', '-ascii');

%1=global_k
%2=theta, 
%3=nu, 
%4=sigma2, 
%5=1st term logli L->cols*(log(2.0*PI))/2,
%6=2nd term 0.5*r2, 
%7=log det term r1, 
%8=Logli=-r;




plot(mydata(:,3), mydata(:,7),'-.b','LineWidth',3,                'MarkerSize',10)
hold all
plot(mydata(:,3), mydata(:,6),'--r','LineWidth',3,                'MarkerSize',10)
hold all
plot(mydata(:,3), mydata(:,8),'-k','LineWidth',3,                'MarkerSize',10)
hold all
y = -1.5:0.1:5.5;
y=y*1e+5;
x = 0.325*ones(1,size(y,2));
%plot(x,y,'.g','LineWidth',3);
xlabel('$\nu$, $\ell=0.62$, $\sigma^2=0.98$','Interpreter','latex');
h=legend('$\log(|\tilde{\mathbf{C}}|)$', '$\mathbf{z}^T\tilde{\mathbf{C}}^{-1}\mathbf{z}$', '$-\tilde{\mathcal{L}}$');
set(h,'Interpreter','latex')
hold all
save_figure(gcf, 'all_shapes_nu_23July', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figs/', 'fontsize', 18)

mydata=load('/home/litvina/111gsl/Matern_cov/F32000/23Feb_logli.txt', '-ascii');
figure
plot(mydata(:,4), mydata(:,7),'-.b','LineWidth',3,                'MarkerSize',10)
hold all
plot(mydata(:,4), mydata(:,6),'--r','LineWidth',3,                'MarkerSize',10)
hold all
plot(mydata(:,4), mydata(:,8),'-k','LineWidth',3,                'MarkerSize',10)
hold all
xlabel('$\sigma^2$, $\ell=0.62$, $\nu=0.325$','Interpreter','latex');
h=legend('$\log(|\tilde{\mathbf{C}}|)$', '$\mathbf{z}^T\tilde{\mathbf{C}}^{-1}\mathbf{z}$', '$-\tilde{\mathcal{L}}$');
set(h,'Interpreter','latex')
y = -1:0.1:2;
y=y*1e+5;
x = 0.98*ones(1,size(y,2));
%plot(x,y,'.g','LineWidth',3);

hold all
save_figure(gcf, 'all_shapes_sigma2_23July', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figs/', 'fontsize', 18)

figure
mydata=load('/home/litvina/111gsl/Matern_cov/D32000/23Feb_logli.txt', '-ascii');

plot(mydata(:,2), mydata(:,7),'-.b','LineWidth',3,                'MarkerSize',10)
hold all
plot(mydata(:,2), mydata(:,6),'--r','LineWidth',3,                'MarkerSize',10)
hold all
plot(mydata(:,2), mydata(:,8),'-k','LineWidth',3,                'MarkerSize',10)
hold all
xlabel('$\ell$, $\nu=0.325$, $\sigma^2=0.98$','Interpreter','latex');
h=legend('$\log(|\tilde{\mathbf{C}}|)$', '$\mathbf{z}^T\tilde{\mathbf{C}}^{-1}\mathbf{z}$', '$-\tilde{\mathcal{L}}$');
set(h,'Interpreter','latex')
hold all
y = -5:0.1:2;
y=y*1e+4;
x = 0.62*ones(1,size(y,2));
%plot(x,y,'.g','LineWidth',3);

save_figure(gcf, 'all_shapes_ell_23July', 'figdir', '/home/litvina/Dropbox/111Hcov_paper/figs/', 'fontsize', 18)





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

% 