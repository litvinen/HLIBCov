% Alexander Litvinenko , 19 April  2016
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
S =[ 128000 64000 32000 16000 8000 4000 2000 1000];
%S =[ 32000 16000 8000 4000 2000 1000];

  
for jj=100:200
  indicies = randperm(N, S(1)); % create non-repeating N0 integers from [1..N]
  
    
 for i=1:7
  
  filename=strcat('/home/litvina/111gsl/data_ying/WHOLE_DOMAIN_MESHES2/Nest_whole_moist_', int2str(S(i)),'_');  
  x = moist_data(indicies);
  y = moist_data(indicies+N);
  U = moist_data(indicies+2*N);
  filename=strcat(filename, int2str(jj), '.txt');
  dlmwrite(filename, S(i) , 'precision',12);
 
  flag=zeros(S(i),1);
  index=0:1:(S(i)-1);
  index=index';
  size(index)
  size(x)
  size(y)
  size(flag)
  size(U)
  dlmwrite(filename, [index x y flag U],'delimiter',' ', '-append',  'precision',12)
  indicies_temp = randperm(S(i), S(i+1)); % create non-repeating N0 integers from [1..N]
  indicies = indicies(indicies_temp);
 end 
end
