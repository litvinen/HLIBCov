clc;
clear;
c_1=rand(1,20);
 c_2=rand(1,100);
 C = [c_1 c_2];
 grp = [3*ones(1,20),7*ones(1,100)];
 boxplot(C,grp)