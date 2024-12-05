clear all
clc

col0=[240 240 21]/255;   % co16
col1=[249, 179, 29]/255; % co10
col2=[238, 81, 1]/255;   % co5
col3=[152 0 0]/255;      % co2


co2=load('./results_save_fig4/err_co2.mat');
co5=load('./results_save_fig4/err_co5.mat');
co10=load('./results_save_fig4/err_co10.mat');
co16=load('./results_save_fig4/err_co16.mat');



fz=12;

figure
subplot(2,2,1)
histogram(co2.sum_err)
h = histogram(co2.sum_err, 'FaceColor', col3, 'EdgeColor', 'k','FaceAlpha',1); 
ax = gca;
ax.XAxis.Exponent = 0;
xlabel('RMSE of SOH [-]')
ylabel('Count [-]')
set(gca,'linewidth',1,'fontsize',fz,'fontname','Arial');


subplot(2,2,2)
histogram(co5.sum_err)
h = histogram(co5.sum_err, 'FaceColor', col2, 'EdgeColor', 'k'); 
ax = gca;
ax.XAxis.Exponent = 0;
xlabel('RMSE of SOH [-]')
ylabel('Count [-]')
set(gca,'linewidth',1,'fontsize',fz,'fontname','Arial');


subplot(2,2,3)
histogram(co10.sum_err)
h = histogram(co10.sum_err, 'FaceColor', col1, 'EdgeColor', 'k'); 
ax = gca;
ax.XAxis.Exponent = 0;
xlabel('RMSE of SOH [-]')
ylabel('Count [-]')
set(gca,'linewidth',1,'fontsize',fz,'fontname','Arial');



subplot(2,2,4)
histogram(co16.sum_err)
h = histogram(co16.sum_err, 'FaceColor', col0, 'EdgeColor', 'k'); 
ax = gca;
ax.XAxis.Exponent = 0;
xlabel('RMSE of SOH [-]')
ylabel('Count [-]')
set(gca,'linewidth',1,'fontsize',fz,'fontname','Arial');
set(gcf,'unit','centimeters','position',[5 5 14 8])

