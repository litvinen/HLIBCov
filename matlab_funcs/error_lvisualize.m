clc;
clear;
format long
set(gca,'FontSize',18);
myf=load('/home/litvina/111gsl/Matern_cov/HLIBCov_nu_l/111covlength.txt', '-ascii');
% n, nu, l,sigma2 ,|S|_F ,|S|_2,|C|_F ,|C|_2,|S-C|_2 ,|S-C|_2/|S|_2,rank
nu=myf(:,3);

n=myf(:,1);
%x(find(diff(x)))
n=unique(n);
R=size(n, 1);
rel_error = myf(:, 10);
abs_error = myf(:, 9);
k=0;
R=2;
for i=2:R
    temp_nu = nu(myf(:,1)==n(i),:);
    temp_re = rel_error(myf(:,1)==n(i),:);
    temp_ae = abs_error(myf(:,1)==nu(i),:);

    semilogy(temp_nu, temp_re, '-bs','LineWidth',3 , 'MarkerSize', 12 );
    %plot(temp_nu, temp_re, '-rs','LineWidth',3 , 'MarkerSize', 12 );
%   
%    plot(tempt, tempL, 'LineWidth',3+k );
    k=k+1;
    hold all;


end    

%plot(myf(:,2), myf(:, 3), '-rs','LineWidth',3 , 'MarkerSize', 12 );
xlabel('covariance length');
ylabel('relative error');
title('H-matrix approximation of covariance matrix')
hold on;

%save_figure(gcf, 'convergence_nu15_weak', 'figdir', '.', 'fontsize', 12)
%           b     blue          .     point              -     solid
%            g     green         o     circle             :     dotted
%            r     red           x     x-mark             -.    dashdot 
%            c     cyan          +     plus               --    dashed   
%            m     magenta       *     star             (none)  no line
%            y     yellow        s     square
%            k     black         d     diamond
%            w     white         v     triangle (down)
%                                ^     triangle (up)
%                                <     triangle (left)
%                                >     triangle (right)
%                                p     pentagram
%                                h     hexagram
%                           

