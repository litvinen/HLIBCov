% Alexander Litvinenko , May 2, 2017
% create triangulation for Ying Sun moisture data
clc;
clear;
format long;


%line 1:                                 the number of points, N
%line 2 to N+1:                     latitude of each point
%line N+2 to 2N+1:              modified longitude of each point(in order to make the actual spherical distance consistent with latitude)
%line 2N+2 to 3N+1:            modified soil moisture(now it approximately follows Gaussian process)

moist_data=load('/home/litvina/111gsl/data_ying/train');
N=moist_data(1)
No=size(moist_data,1)
moist_data=moist_data(2:No);
S =[16000];

  
for jj=51:100
  
    
 for i=1:1
  
  indicies = randperm(N, S(i)); % create non-repeating N0 integers from [1..N]
  filename=strcat('/home/litvina/111gsl/data_ying/nonnested_moist_whole/moist_', int2str(S(i)),'_');  
  x = moist_data(indicies);
  y = moist_data(indicies+N);
  U = moist_data(indicies+2*N);
  filename=strcat(filename, int2str(jj), '.txt');
  dlmwrite(filename, S(i) , 'precision',12);
 
  flag=zeros(S(i),1);
  index=0:1:(S(i)-1);
  index=index';
  dlmwrite(filename, [x y U],'delimiter',' ', '-append',  'precision',12)
%  dlmwrite(filename, [index x y flag U],'delimiter',' ', '-append',  'precision',12)
 end 
end
