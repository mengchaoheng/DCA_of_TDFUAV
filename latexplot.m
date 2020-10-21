
%% INITIALIZATION
clear all;
close all;
clc
% set(0, 'defaulttextinterpreter','latex')    % 将图片的字体等等格式设置成latex样式，方便输入公式
% set(0, 'defaultAxesTickLabelInterpreter','latex'); 
% set(0, 'defaultLegendInterpreter','latex');
% set(groot,'defaultLineLineWidth',1.5); % 顺便改个默认线宽(? ?_?)?

%% INPUT
filename{1} = 'example.pdf'; % pdf的文件名
filename{2} = 'example.eps'; % eps的文件名
Width  = 5;    % 保存后的图片宽度
Height = 5;    % 保存后的图片高度

%% PLOT
f=figure(1);
% subplot(3,1,1);
plot(randn(100,2));
xlabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex');      % 
ylabel('$\dot q\ \rm(rad/s^2)$','interpreter','latex');   
% subplot(3,1,2);
% plot(randn(100,2),'linewidth',0.5);
% xlabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex');      % 
% ylabel('$\dot q\ \rm(rad/s^2)$','interpreter','latex');   
% subplot(3,1,3);
% plot(randn(100,2),'linewidth',0.5);
% xlabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex');      % 
% ylabel('$\dot q\ \rm(rad/s^2)$','interpreter','latex'); 

%% SAVE TO PDF OR EPS
% PlotToFileColorPDF(f,filename{1},Width,Height);   % 保存为pdf
%  PlotToFileColorEPS(f,filename{2},Width,Height);   % 保存为eps

function PlotToFileColorPDF(gcf,filename,x,y)
%
% Print the current plot at size (x,y) to an eps file
%
set(gcf,'PaperUnits','centimeters')
set(gcf,'PaperSize',[x,y])
set(gcf,'PaperPositionMode','manual')
set(gcf,'PaperPosition',[0,0,x,y]);
set(gcf, 'renderer', 'painters');
print(filename,'-dpdf','-r600')
end
function PlotToFileColorEPS(gcf,filename,x,y)
%
% Print the current plot at size (x,y) to an eps file
%
ax = gcf.CurrentAxes;
% ax.XTickMode = 'manual';
% ax.YTickMode = 'manual';
% ax.XLimMode = 'manual';
% ax.YLimMode = 'manual';
% outerpos = ax.OuterPosition;
% ti = ax.TightInset;
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];
% fig = gcf;
% fig.PaperPositionMode = 'manual'
% fig_pos = fig.PaperPosition;
% fig.PaperSize = [fig_pos(3) fig_pos(4)];

set(gcf,'PaperUnits','centimeters')
set(gcf,'PaperSize',[x,y])
set(gcf,'PaperPositionMode','manual')
set(gcf,'PaperPosition',[0,0,x,y]);
set(gcf, 'renderer', 'painters');
print(filename,'-depsc','-r600')
% print(gcf,[filename,'tif'],'-r600','-dtiff');
end
