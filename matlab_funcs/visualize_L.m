clc;
clear;
set(gca,'FontSize',20);
myf=load('/home/litvina/111gsl/Matern_cov/HLIBCov/1L.txt', '-ascii');

Hrank=myf(:,1);
%x(find(diff(x)))
Hrank=unique(Hrank);
R=size(Hrank, 1);
theta=myf(:, 2);
logL=myf(:, 3);
k=0;
for i=1:R
    tempt = theta(myf(:,1)==Hrank(i),:);
    tempL = logL(myf(:,1)==Hrank(i),:);
   % plot(tempt, tempL, '-rs','LineWidth',3 , 'MarkerSize', 12 );
    plot(tempt, tempL, 'LineWidth',3+k );
    k=k+1;
    hold all;


end    

%plot(myf(:,2), myf(:, 3), '-rs','LineWidth',3 , 'MarkerSize', 12 );
xlabel('\theta');
ylabel('-loglikelihood');

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

