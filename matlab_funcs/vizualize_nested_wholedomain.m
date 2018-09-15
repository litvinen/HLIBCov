% Alexander Litvinenko , 19 April  2016
clc;
clear;
format long;


%line 1:                                 the number of points, N
%line 2 to N+1:                     latitude of each point
%line N+2 to 2N+1:              modified longitude of each point(in order to make the actual spherical distance consistent with latitude)
%line 2N+2 to 3N+1:            modified soil moisture(now it approximately follows Gaussian process)

moist_data1=load('/home/litvina/111gsl/data_ying/WHOLE_DOMAIN_MESHES/Nest_whole_moist_2000_1c.txt');
moist_data2=load('/home/litvina/111gsl/data_ying/WHOLE_DOMAIN_MESHES/Nest_whole_moist_16000_40c.txt');

plot(moist_data1(:,2), moist_data1(:,3), '.')
hold all
plot(moist_data2(:,2), moist_data2(:,3), '.')

