clear all;

% %%default values

factor=1.5; 
fullout='False'; 
barcol='b'; 
outliercol='r'; 
color='m'; 
prob=0.5; 
show='True';
method='MBD'; 
depth=[]; 
	ncasem = 39;
	ncasef = 54;
	nage   = 31;

	fid = fopen('/home/litvina/FDAfuncs/examples/growth/hgtm.dat','rt');
	hgtmmat = reshape(fscanf(fid,'%f'),[nage,ncasem]);

	fid = fopen('/home/litvina/FDAfuncs/examples/growth/hgtf.dat','rt');
	hgtfmat = reshape(fscanf(fid,'%f'),[nage,ncasef]);

	age = [ 1:0.25:2, 3:8, 8.5:0.5:18 ]';

%fbplot of boys' height
	fbplot(hgtmmat,age,depth,method,show,prob,color,outliercol,barcol,fullout,factor)
	xlim([0.5,18.5])
	ylim([60,200])
	xlabel('Age (Years)')
	ylabel('Height (cm)')
	title('Boys')