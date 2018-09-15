% Alexander Litvinenko , March 2016
% create triangulation for Ying Sun moisture data
clc;
clear;
format long;


%line 1:                                 the number of points, N
%line 2 to N+1:                     latitude of each point
%line N+2 to 2N+1:              modified longitude of each point(in order to make the actual spherical distance consistent with latitude)
%line 2N+2 to 3N+1:            modified soil moisture(now it approximately follows Gaussian process)

moist_data=load('/home/litvina/111gsl/data_ying/train');
M=size(moist_data)
%moist_data=load('/home/litvina/Dropbox/111Hcov_paper/data_ying/test');
N=moist_data(1)
moist_data=reshape(moist_data(2:M), 2000000,3);
xmin = min(moist_data(:,1))
xmax = max(moist_data(:,1))
ymin = min(moist_data(:,2))
ymax = max(moist_data(:,2))
%plot(moist_data(:,1),moist_data(:,2),'.')
dx=xmax-xmin
dy=ymax-ymin
a1=xmin+dx/4
b1=ymin+dy/4
a2=xmin+dx/2
b2=ymin+dy/2
ind1 = find((a1<moist_data(:,1))& (moist_data(:,1)<a2) & (b1<moist_data(:,2)) & (moist_data(:,2)<b2));
moist_data_sub=moist_data(ind1,:);
Ns= size(moist_data_sub,1)
%hold all;
%plot(moist_data_sub(:,1),moist_data_sub(:,2),'*r')

  
filename='moist_data_sub.txt'
dlmwrite(filename, Ns, 'precision',12);
dlmwrite(filename, moist_data_sub(:,1),'delimiter',' ', '-append', 'precision',12)
dlmwrite(filename, moist_data_sub(:,2),'delimiter',' ', '-append', 'precision',12)
dlmwrite(filename, moist_data_sub(:,3),'delimiter',' ', '-append', 'precision',12)
