clear all
clc
all_index=1:1:96;

co16_index=[57,58,63,64];
co10_index=[55, 56, 3, 4, 5, 6, 7, 8, 25, 26, 27, 28, 29, 30, 31, 32, 49, 50, 59, 60, 71, 72, 65, 66, 73, 74, 81, 82, 79, 80, 91, 92, 95, 96];
co5_index=[9, 10, 11, 12, 13, 14, 15, 16, 33, 34, 35, 36, 37, 38, 39, 40, 51, 52, 61, 62, 67, 68, 75, 76, 83, 84, 87, 88];
co2_index=[17, 18, 19, 20, 21, 22, 23, 24, 41, 42, 43, 44, 46, 47, 48, 53, 54, 69, 70, 77, 78, 85, 86];


col0=[240 240 21]/255;   % co16
col1=[249, 179, 29]/255; % co10
col2=[238, 81, 1]/255;   % co5
col3=[152 0 0]/255;      % co2

soh90=readmatrix('../data/soh90.csv', 'NumHeaderLines', 1);
soh90 = soh90(:,2:end);
soh90=[zeros(2,11);soh90(1:15,:);zeros(1,11);soh90(16:79,:);zeros(1,11);soh90(80:end,:)];

feature=csvread('../data/protocol_features.csv',1);
feature=[zeros(2,8);feature(1:15,:);zeros(1,8);feature(16:79,:);zeros(1,8);feature(80:end,:)];

figure
scatter(feature(co16_index,5),soh90(co16_index,3),'MarkerEdgeColor', col0, 'MarkerFaceColor', col0,'LineWidth', 2)
hold on
scatter(feature(co10_index,5),soh90(co10_index,3),'MarkerEdgeColor', col1, 'MarkerFaceColor', col1,'LineWidth', 2)
hold on
scatter(feature(co5_index,5),soh90(co5_index,3),'MarkerEdgeColor', col2, 'MarkerFaceColor', col2,'LineWidth', 2)
hold on
scatter(feature(co2_index,5),soh90(co2_index,3),'MarkerEdgeColor', col3, 'MarkerFaceColor', col3,'LineWidth', 2)

xlim([0.05,1])
xlabel('Rest fraction at above 60% SOC')
ylabel('Q_{pe}')
box on
set(gca,'linewidth',1,'fontsize',14,'fontname','Arial');
legend('C/16','C/10','C/5','C/2')
set(gcf,'unit','centimeters','position',[5 5 12 7])
