% Alexander Litvinenko , March 2016
% create triangulation for Ying Sun moisture data
clc;
clear;
format long;


%line 1:                                 the number of points, N
%line 2 to N+1:                     latitude of each point
%line N+2 to 2N+1:              modified longitude of each point(in order to make the actual spherical distance consistent with latitude)
%line 2N+2 to 3N+1:            modified soil moisture(now it approximately follows Gaussian process)

moist_data=load('/home/litvina/Dropbox/111Hcov_paper/data_ying/train');
M=size(moist_data)
%moist_data=load('/home/litvina/Dropbox/111Hcov_paper/data_ying/test');
N=moist_data(1)
moist_data=reshape(moist_data(2:M), 2000000,3);
xmin = min(moist_data(:,1))
xmax = max(moist_data(:,1))
ymin = min(moist_data(:,2))
ymax = max(moist_data(:,2))

dx=xmax-xmin
dy=ymax-ymin
a=xmin+dx/4
b=ymin+dy/4
ind1 = find((moist_data(:,1)<a) & (moist_data(:,2)<b));
moist_data_sub=moist_data(ind1,:);
Ns= size(moist_data_sub,1)

  
filename='moist_data_sub.txt'
dlmwrite(filename, Ns);
dt = delaunayTriangulation(moist_data_sub(:,1), moist_data_sub(:,2));
k = convexHull(dt);

xHull = dt.Points(k,1);
yHull = dt.Points(k,2);
plot(xHull,yHull,'r','LineWidth',2);
%hold off
 
flag=zeros(Ns,1);
index=0:1:(Ns-1);
index=index';
size(index)
dlmwrite(filename, [index moist_data_sub(:,1), moist_data_sub(:,2) flag moist_data_sub(:,1), moist_data_sub(:,3)],'delimiter',' ', '-append')
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
