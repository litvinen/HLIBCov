% Alexander Litvinenko , March 2016
% create triangulation for Ying Sun moisture data
clc;
clear;
format long;


%line 1:                                 the number of points, N
%line 2 to N+1:                     latitude of each point
%line N+2 to 2N+1:              modified longitude of each point(in order to make the actual spherical distance consistent with latitude)
%line 2N+2 to 3N+1:            modified soil moisture(now it approximately follows Gaussian process)

moist_data=load('moist_data_sub.txt');
N=moist_data(1)
No=size(moist_data,1)
moist_data=moist_data(2:No);
S =[ 1200 320 160 80 40 20 10];

  
for jj=1:50
  indicies = randperm(N, S(1)); % create non-repeating N0 integers from [1..N]
  
    
 for i=1:5
  i , jj
  
  filename=strcat('Sub_middle_Nest_moist_', int2str(S(i)),'_');  
  x = moist_data(indicies);
  y = moist_data(indicies+N);
  U = moist_data(indicies+2*N);
  filename=strcat(filename, int2str(jj), '.txt');
  dlmwrite(filename, S(i) , 'precision',12);
  dt = delaunayTriangulation(x,y);
  k = convexHull(dt);
  triplot(dt)
  save_figure(gcf, 'triplot2000', 'figdir', '.', 'fontsize', 16)

  xHull = dt.Points(k,1);
  yHull = dt.Points(k,2);
  %plot(xHull,yHull,'r','LineWidth',2);
  %hold off
 
  flag=zeros(S(i),1);
  index=0:1:(S(i)-1);
  index=index';
  size(index)
  size(x)
  size(y)
  size(flag)
  size(U)
  dlmwrite(filename, [index x y flag U],'delimiter',' ', '-append',  'precision',12)
  Ntri=size(dt.ConnectivityList, 1);
  dlmwrite(filename, Ntri, '-append', 'precision',12)
  A=dt.ConnectivityList;
%save('newstruct.mat','-struct','s1');
%save('moist_tri.txt', 'A','-ascii')
%type('moist_tri.txt')
  A = A -1 ;
  index = 0:1:size(A,1)-1;
  index=index';
  dlmwrite(filename, [index A], 'delimiter',' ','-append', 'precision',12); 
  indicies_temp = randperm(S(i), S(i+1)); % create non-repeating N0 integers from [1..N]
  indicies = indicies(indicies_temp);
  %save moist_tri.txt dt(:,1) dt(:,2) -ascii;
  %triplot(dt);
%
% Display the Vertex and Triangle labels on the plot
  %hold on
 end 
end
%vxlabels = arrayfun(@(n) {sprintf('P%d', n)}, (1:10)');
%Hpl = text(x10, y10, vxlabels, 'FontWeight', 'bold', 'HorizontalAlignment',...
%   'center', 'BackgroundColor', 'none');
%ic = incenter(dt);
%numtri = size(dt,1);
%trilabels = arrayfun(@(x) {sprintf('T%d', x)}, (1:numtri)');
%Htl = text(ic(:,1), ic(:,2), trilabels, 'FontWeight', 'bold', ...
%   'HorizontalAlignment', 'center', 'Color', 'blue');
%hold off
