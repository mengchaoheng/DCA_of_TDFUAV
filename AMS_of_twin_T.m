close all;
load('AMS_T_data.mat');

% 电机
a=6.523+15.68;a1=15.68;b=20.89;c=10.45;d=5.953;e=16.76;f=21.62;g=10.81;h=15.67;
A(1,:)=[a b 0];A(2,:)=[a c g];A(3,:)=[a 0 h];A(4,:)=[a -c g];A(5,:)=[a -b 0];
A(6,:)=[a1 b d];A(7,:)=[a1 c e];A(8,:)=[a1 0 f];A(9,:)=[a1 -c e];A(10,:)=[a1 -b d];
% y对称
A(11,:)=[-a1 b d];A(12,:)=[-a1 c e];A(13,:)=[-a1 0 f];A(14,:)=[-a1 -c e];A(15,:)=[-a1 -b d];
A(16,:)=[-a b 0];A(17,:)=[-a c g];A(18,:)=[-a 0 h];A(19,:)=[-a -c g];A(20,:)=[-a -b 0];
% z对称
A(36,:)=[a c -g];A(35,:)=[a 0 -h];A(34,:)=[a -c -g];
A(33,:)=[a1 b -d];A(32,:)=[a1 c -e];A(31,:)=[a1 0 -f];A(30,:)=[a1 -c -e];A(29,:)=[a1 -b -d];
% y对称
A(28,:)=[-a1 b -d];A(27,:)=[-a1 c -e];A(26,:)=[-a1 0 -f];A(25,:)=[-a1 -c -e];A(24,:)=[-a1 -b -d];
A(23,:)=[-a c -g];A(22,:)=[-a 0 -h];A(21,:)=[-a -c -g];


C(1,:)=[8.175 b 0];C(2,:)=[-8.175 b 0];C(3,:)=[-8.175 -b 0];C(4,:)=[8.175 -b 0];
C(5,:)=[5.895 0 14.63];C(6,:)=[-5.895 0 14.63];
C(7,:)=[-5.895 0 -14.63];C(8,:)=[5.895 0 -14.63];

fig=figure;
[~, V]= convhull(A(:,1),A(:,2),A(:,3),'simplify',true)
defaultFaceColor  =[0.86275 0.86275 0.86275];
% subplot(1,2,1)

trimesh(K_of_twin_T,A(:,1),A(:,2),A(:,3),'FaceColor','[0.86275 0.86275 0.86275]','FaceAlpha',0.4,'EdgeColor','k')
axis equal;

hold on;

% figure,
[~, VV]= convhull(C(:,1),C(:,2),C(:,3),'simplify',true)
% subplot(1,2,1)
trimesh(KK_of_inv,C(:,1),C(:,2),C(:,3),'FaceColor','r','FaceAlpha',1,'EdgeColor','g')
axis equal;
hold on;
% K_of_twin_T1
trimesh(K_of_twin_T1,A(:,1),A(:,2),A(:,3),'FaceColor','[0.86275 0.86275 0.86275]','FaceAlpha',0.4,'EdgeColor','k')
axis equal;
hold on;
% K_of_twin_T1
trimesh(K_of_twin_T2,A(:,1),A(:,2),A(:,3),'FaceColor','[0.86275 0.86275 0.86275]','FaceAlpha',0.4,'EdgeColor','k')
axis equal;
% title('\rmAMS and \Pi ');  
xlabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex','position',[10 -28 -30] );      % 
ylabel('$\dot q\ \rm(rad/s^2)$','interpreter','latex','position',[-32 10 -30]);        
zlabel('$\dot r\ \rm(rad/s^2)$','interpreter','latex'); 
view(3);axis equal;axis vis3d;grid on;
leg=legend({'AMS','\Pi'});%legend('boxoff');
set(leg,'NumColumns',2,'location','northwest');
set(fig.CurrentAxes, 'FontSize', 9,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
fig.CurrentAxes.XTick = [-30 -20 -10 0 10 20 30];fig.CurrentAxes.YTick = [-30 -20 -10 0 10 20 30];fig.CurrentAxes.ZTick = [-30 -20 -10 0 10 20 30];
view(-36,31);
Width  =7.15;    % 保存后的图片宽度
Height =12;

% PlotToFileColorEPS(fig,'Fig3.eps',6.1,6.1);
PlotToFileColorPDF(fig,'Fig3.pdf',6,6);
% print(filename,'-dpdf','-r600')
% set(gcf,'PaperUnits','centimeters')
% set(gcf,'PaperSize',[Width,Height])
% set(gcf,'PaperPositionMode','manual')
% set(gcf,'PaperPosition',[0,0,Width,Height]);
% set(gcf, 'renderer', 'painters');
% export_fig( gcf , '-png' , '-r600' , '-painters' , './Fig3.png');


