%%
% clear all;
close all;
% clear all;
set(groot,'defaultLineLineWidth',0.8);% 默认线宽（可选，后文已设置）
Width  =7.15;    % 保存后的图片宽度
Height =12;    % 保存后的图片高度
%% ----------------------------1--------------------------------------------------------------------------------------------
% 阶跃信号
load('ICGNC2020step.mat');
fig1=figure;%
subplot(3,1,1)
plot(time,dca_surfase_out,'b-','Marker','none','MarkerIndices',tt);hold on;
plot(time,wls_surfase_out,'r--','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 0.5 -0.15 0.45]);
% axis([0 3 -0.52 0.35]);
xlabel({'Time (s)'});
ylabel('\delta_3 (rad)')
title('Deflection angle');
h=legend('DCA','SCA');legend('boxoff');
set(h,'NumColumns',1,'location','northwest');%northwest
set(fig1.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
fig1.CurrentAxes.YAxis.Exponent = -1;
subplot(3,1,2)
plot(time,dca_T_out,'b-','Marker','none','MarkerIndices',tt);hold on;
plot(time,wls_T_out,'r--','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 0.5 -10 90]);
xlabel({'Time (s)'});
ylabel('\delta_9 (rad/s)');
title('Speed difference');
h=legend('DCA','SCA');legend('boxoff');
set(h,'NumColumns',1,'location','northwest');%northwest
set(fig1.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
fig1.CurrentAxes.YAxis.Exponent = 1;
subplot(3,1,3)
plot(time,in_x,'k-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dca_x,'Color','b','LineStyle','-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;
plot(time,out_wls_x,'Color','r','LineStyle','--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;grid on;
axis([0 0.5 -1 7]);
xlabel({'Time (s)'});
ylabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex')
title('Virtual control response');
h=legend('cmd','DCA','SCA');legend('boxoff');
set(h,'NumColumns',1,'location','northwest');%northwest
set(fig1.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
PlotToFileColorEPS(fig1,'Fig6.eps',Width,Height);
%% ----------------------------2--------------------------------------------------------------------------------------------
load('ICGNC2020freq.mat');
fig2=figure;%
subplot(3,1,1)
plot(time,dca_surfase_out,'b-','Marker','none','MarkerIndices',tt);hold on;
plot(time,wls_surfase_out,'r--','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 3 -0.45 0.35]);
xlabel({'Time (s)'});
ylabel('\delta_3 (rad)')
title('Deflection angle');
h=legend('DCA','SCA');legend('boxoff');
set(h,'NumColumns',2,'Position',[0.220538940753751 0.727258333477532 0.827918039777914 0.0396874990800603]);%northwest,,,'LineWidth',2,,'Position',[0.75  0.75 0 0],,, 'FontSize', 9
set(fig2.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
fig2.CurrentAxes.YAxis.Exponent = -1;fig2.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];
subplot(3,1,2)
plot(time,dca_T_out,'b-','Marker','none','MarkerIndices',tt);hold on;
plot(time,wls_T_out,'r--','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 3 -95 85]);
xlabel({'Time (s)'});
ylabel('\delta_9 (rad/s)');
title('Speed difference');
h=legend('DCA','SCA');legend('boxoff');
set(h,'NumColumns',2,'Position',[0.220538940753751 0.421011397203022 0.827918039777914 0.0396874990800603]);
set(fig2.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)%
fig2.CurrentAxes.YAxis.Exponent = 1;fig2.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];
subplot(3,1,3)
plot(time,in_x,'k-','Marker','none','MarkerIndices',tt,'MarkerSize',5);hold on;
plot(time,out_dca_x,'Color','b','LineStyle','-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;
plot(time,out_wls_x,'Color','r','LineStyle','--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;grid on;
axis([0 3 -10 6.6]);
xlabel({'Time (s)'});
ylabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex')
title('Virtual control response');
h=legend('cmd','DCA','SCA');legend('boxoff');
set(h,'NumColumns',3,'Position',[0.133998846069293 0.126172035192599 0.769696962969738 0.0330396468550099]);
set(fig2.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
fig2.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];
PlotToFileColorEPS(fig2,'Fig7.eps',Width,Height);

%% ----------------------3-------------------------------------
load('ICGNC2020actuator.mat');
fig3=figure;%
subplot(2,2,1)
p1=plot(time,dca_surfase_in,'k-','Marker','none','MarkerIndices',tt,'MarkerSize',5);hold on;
plot(time,dca_surfase_out,'b--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;grid on;
plot(time,wls_surfase_out_off,'r-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;
% axis([0 3 -0.45 0.35]);
xlabel({'Time (s)'});
ylabel('\delta_3 (rad)')
title('Deflection angle');
% h1=legend(p1,'CMD');legend('boxoff');
% set(h1,'NumColumns',1);%northwest  
set(fig3.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
fig3.CurrentAxes.YAxis.Exponent = -1;fig3.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];fig3.CurrentAxes.YTick = [-0.3 -0.2 -0.1 0 0.1 0.2 0.3];
subplot(2,2,2)
plot(time,dca_T_in,'k','Marker','none','MarkerIndices',tt,'MarkerSize',5);hold on;
p2=plot(time,dca_T_out,'b--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;grid on;
plot(time,wls_T_out_off,'r-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;
% axis([0 3 -100 85]);
xlabel({'Time (s)'});
ylabel('\delta_9 (rad/s)');
title('Speed difference');
% h2=legend(p2,'with compensation');legend('boxoff');
% set(h2,'NumColumns',1);
set(fig3.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)%
fig3.CurrentAxes.YAxis.Exponent = 1;fig3.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];fig3.CurrentAxes.YTick = [-120 -80 -40 0 40 80 120];
subplot(2,2,3)
plot(time,in_x,'k-','Marker','none','MarkerIndices',tt,'MarkerSize',5);hold on;
plot(time,out_dca_x,'Color','b','LineStyle','--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;
p3=plot(time,out_wls_x_off,'Color','r','LineStyle','-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;grid on;
% axis([0 3 -10 6.6]);
xlabel({'Time (s)'});
ylabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex')
title('Virtual control response');
h3=legend('cmd','with compensation','without compensation');legend('boxoff');
set(h3,'NumColumns',1,'Position',[0.584157042920502 0.214246708761181 0.321570506330389 0.177648804792691]);
set(fig3.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
fig3.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];fig3.CurrentAxes.YTick = [-6 -4 -2 0 2 4 6];
PlotToFileColorEPS(fig3,'Fig8.eps',14,7);
