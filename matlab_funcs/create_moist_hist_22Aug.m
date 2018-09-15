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
%moist_data2=load('/home/litvina/111gsl/data_ying/Synthetic/mydata.mat');
%1=moist_data(1)
No=size(moist_data,1)
n=2000000;
moist_data3=[moist_data(2:n+1) moist_data(n+2:2*n+1) moist_data(2*n+2:3*n+1)];
plot(moist_data3(:,1), moist_data3(:,2),'.' )
moist_data=moist_data(2:No);
minx=min(moist_data3(:,1)); %32.37
maxx=max(moist_data3(:,1)); %43.3
miny=min(moist_data3(:,2)); %-84.9
maxy=max(moist_data3(:,2)); %-72.9
hold all
%indices=((moist_data3(:,1)>33)&(moist_data3(:,1)<43))&((moist_data3(:,2)>-84)&(moist_data3(:,2)<-73.4));
indices=2:20000:n;
size(indices)
N=sum(indices)
%mo=moist_data3(indices);
plot(moist_data3(indices,1),moist_data3(indices,2),'.');
a=1
figure
%hist(moist_data3(indices,3), 1000)
histogram(moist_data3(indices,3), 'BinMethod', 'scott')
title('scott')
figure
histogram(moist_data3(indices,3), 'BinMethod', 'sturges')
title('sturges')
figure
histogram(moist_data3(indices,3), 'BinMethod', 'fd')
title('fd')

% histogram(...,'BinMethod',BM), uses the specified automatic binning 
%     algorithm to determine the number and width of the bins. BM can be:
%                     'auto'   The default 'auto' algorithm chooses a bin 
%                              width to cover the data range and reveal the 
%                              shape of the underlying distribution.
%                    'scott'   Scott's rule is optimal if the data is close  
%                              to being normally distributed, but is also 
%                              appropriate for most other distributions. It 
%                              uses a bin width of 
%                              3.5*STD(X(:))*NUMEL(X)^(-1/3).
%                       'fd'   The Freedman-Diaconis rule is less sensitive  
%                              to outliers in the data, and may be more 
%                              suitable for data with heavy-tailed 
%                              distributions. It uses a bin width of 
%                              2*IQR(X(:))*NUMEL(X)^(-1/3), where IQR is the 
%                              interquartile range.
%                 'integers'   The integer rule is useful with integer data, 
%                              as it creates a bin for each integer. It uses 
%                              a bin width of 1 and places bin edges halfway 
%                              between integers. To prevent from accidentally 
%                              creating too many bins, a limit of 65536 bins 
%                              can be created with this rule. If the data 
%                              range is greater than 65536, then wider bins
%                              are used instead.
%                  'sturges'   Sturges' rule is a simple rule that is popular
%                              due to its simplicity. It chooses the number 
%                              of bins to be CEIL(1 + LOG2(NUMEL(X))).
%                     'sqrt'   The Square Root rule is another simple rule 
%                              widely used in other software packages. It 
%                              chooses the number of bins to be
%                              CEIL(SQRT(NUMEL(X))).


%x = moist_data(indicies);
%y = moist_data(indicies+N);
%U = moist_data(indicies+2*N);
%ind = x