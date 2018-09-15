% Alexander Litvinenko , March 2016
% create triangulation for Ying Sun moisture data
clc;
clear;
format long;


%line 1:                                 the number of points, N
%line 2 to N+1:                     latitude of each point
%line N+2 to 2N+1:              modified longitude of each point(in order to make the actual spherical distance consistent with latitude)
%line 2N+2 to 3N+1:            modified soil moisture(now it approximately follows Gaussian process)

moist_data=load('test');
N=moist_data(1)
N0=32000;
%x = moist_data(2:N+1);
%y = moist_data(N+2:2*N+1);
%U = moist_data(2*N+2:3*N+1);

  
for jj=1:1
    
  filename=strcat('Bmoist_tri', int2str(N0),'_');  
  indicies = randperm(N, N0); % create non-repeating N0 integers from [1..N]
  indicies = indicies +1;

  x = moist_data(indicies);
  indicies=indicies+N;
  y = moist_data(indicies);
  indicies=indicies+N;
  
    
  U = moist_data(indicies);

  

%pv=[-0.4 -0.5;0.4 -0.7;0.4 -0.2;1.5 -0.4;0.9 0.1;
%           1.6 0.8;0.5 0.5;0.2 1;0.1 0.4;-0.7 0.7;-0.4 -0.5];
%       [p,t]=distmesh2d(@dpoly,@huniform,0.1,[-1,-1; 1,1],pv,pv);
  
  
  filename=strcat(filename, int2str(jj), '.txt');
  dlmwrite(filename, N0);
  %  pv=[-0.4 -0.5;0.4 -0.2;0.4 -0.7;1.5 -0.4;0.9 0.1;
  %      1.6 0.8;0.5 0.5;0.2 1;0.1 0.4;-0.7 0.7;-0.4 -0.5];
  %  [p,t]=distmesh2d(@dpoly,@huniform,0.1,[-1,-1; 2,1],pv,pv);
  
  dt = delaunayTriangulation(x,y);
  k = convexHull(dt);
  triplot(dt)

  xHull = dt.Points(k,1);
  yHull = dt.Points(k,2);
  %plot(xHull,yHull,'r','LineWidth',2);
  %hold off
 
  flag=zeros(N0,1);
  index=0:1:N0-1;
  index=index';
  dlmwrite(filename, [index x y flag U],'delimiter',' ', '-append')
  Ntri=size(dt.ConnectivityList, 1);
  dlmwrite(filename, Ntri, '-append')
  A=dt.ConnectivityList;
%save('newstruct.mat','-struct','s1');
%save('moist_tri.txt', 'A','-ascii')
%type('moist_tri.txt')
  A = A -1 ;
  index = 0:1:size(A,1)-1;
  index=index';
  dlmwrite(filename, [index A], 'delimiter',' ','-append'); 

%save moist_tri.txt dt(:,1) dt(:,2) -ascii;
  %triplot(dt);
%
% Display the Vertex and Triangle labels on the plot
  %hold on
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
