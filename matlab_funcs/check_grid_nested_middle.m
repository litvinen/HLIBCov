clc;
clear;
format long
set(gca,'FontSize',18);
%approx3=load('/home/litvina/Dropbox/111Hcov_paper/results/7Feb/case3/111theta_case3_rank3.txt', '-ascii');
%d2000=load('../C2000/111_3Jan_2000.txt', '-ascii');
%d4000=load('../C4000/111_3Jan_4000.txt', '-ascii');
%d8000=load('../C8000/111_3Jan_8000.txt', '-ascii');
%d16000=load('../C16000/111_3Jan_16000.txt', '-ascii');
%d32000=load('../C32000/111_3Jan_32000.txt', '-ascii');
d2000=load('../11Nested_middle_sub_moisture/Sub_middle_Nest_moist_2000_1_copy.txt', '-ascii');
d4000=load('../11Nested_middle_sub_moisture/Sub_middle_Nest_moist_4000_1_copy.txt', '-ascii');
plot(d2000(:,3),d2000(:,2),'+', d4000(:,3),d4000(:,2),'.')
%hold all
%plot(d4000(:,2),d4000(:,3),'.')
legend('2000', '4000')
save_figure(gcf, 'moisture_points_2K_4K', 'figdir', '.', 'fontsize', 16)
%figure