close all;
x = 15;
y = 10;
hFig1 = figure('Name','Fig1.Position:[0 0 15cm 10cm]','Menubar','none');
plot([0 1 nan 0 1], [0 1 nan 1 0]), axis tight
set(gca, 'XTickLabel',[], 'YTickLabel',[], ...
 'Units','normalized', 'Position',[0 0 1 1])
set(hFig1, 'Units','centimeters', 'Position',[0 0 x y])


hFig2 = figure('Name','Fig2.OuterPosition:[0 0 15cm 10cm]','Menubar','none');
plot([0 1 nan 0 1], [0 1 nan 1 0]), axis tight
set(hFig2, 'Units','centimeters', 'OuterPosition',[0 0 x y])
set(gca,'Units','centimeters', 'OuterPosition',hFig2.Position)
set(gca,'LooseInset',get(gca,'TightInset')) % —È÷§TightInsetŒª÷√
ax2 = gca;

hFig3 = figure('Name','Fig3.OuterPosition=Fig2.axes.OuterPosition','Menubar','none');
plot([0 1 nan 0 1], [0 1 nan 1 0]), axis tight
set(hFig3, 'Units','centimeters', 'OuterPosition',ax2.OuterPosition)
set(gca,'Units','centimeters', 'OuterPosition',hFig3.Position)
ax3 = gca;


hFig4 = figure('Name','Fig4.OuterPosition=Fig3.axes.Position','Menubar','none');
plot([0 1 nan 0 1], [0 1 nan 1 0]), axis tight
set(hFig4, 'Units','centimeters', 'OuterPosition',ax3.Position)
set(gca, 'XTickLabel',[], 'YTickLabel',[], ...
'Units','normalized', 'Position',[0 0 1 1])

