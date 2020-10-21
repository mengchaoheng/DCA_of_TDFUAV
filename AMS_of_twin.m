
load('AMS_data.mat');

% ¶æ
a=6.523;b=20.89;c=10.45;d=5.953;e=16.76;f=21.62;g=10.81;h=15.67;
A(1,:)=[a b 0];A(2,:)=[a c g];A(3,:)=[a 0 h];A(4,:)=[a -c g];A(5,:)=[a -b 0];
A(6,:)=[0 b d];A(7,:)=[0 c e];A(8,:)=[0 0 f];A(9,:)=[0 -c e];A(10,:)=[0 -b d];
% y¶Ô³Æ
A(11,:)=[-a b 0];A(12,:)=[-a c g];A(13,:)=[-a 0 h];A(14,:)=[-a -c g];A(15,:)=[-a -b 0];
% z¶Ô³Æ
A(24,:)=[a c -g];A(25,:)=[a 0 -h];A(26,:)=[a -c -g];
A(19,:)=[0 b -d];A(20,:)=[0 c -e];A(21,:)=[0 0 -f];A(22,:)=[0 -c -e];A(23,:)=[0 -b -d];
A(16,:)=[-a c -g];A(17,:)=[-a 0 -h];A(18,:)=[-a -c -g];
C(1,:)=[a b 0];C(2,:)=[-a b 0];C(3,:)=[-a -b 0];C(4,:)=[a -b 0];
C(5,:)=[4.72 0 14.63];C(6,:)=[-4.72 0 14.63];
C(7,:)=[-4.72 0 -14.63];C(8,:)=[4.72 0 -14.63];


figure,
[~, V]= convhull(A(:,1),A(:,2),A(:,3),'simplify',true)
defaultFaceColor  =[0.86275 0.86275 0.86275];
% subplot(1,2,1)

trimesh(K_of_twin,A(:,1),A(:,2),A(:,3),'FaceColor','[0.86275 0.86275 0.86275]','FaceAlpha',0.4,'EdgeColor','k')
axis equal
hold on;
trimesh(K_of_twin1,A(:,1),A(:,2),A(:,3),'FaceColor','[0.86275 0.86275 0.86275]','FaceAlpha',0.4,'EdgeColor','none')
axis equal
hold on;
% figure,
[~, VV]= convhull(C(:,1),C(:,2),C(:,3),'simplify',true);
% subplot(1,2,1)
trimesh(KK_of_inv,C(:,1),C(:,2),C(:,3),'FaceColor','r','FaceAlpha',0.7,'EdgeColor','g')
axis equal

title('\it\Pi \rmand AMS','FontSize',14);  
axis([-10 10 -22 22 -22 22])
% pos=axis;
xlabel('$\dot p\ \rm(ras/s^2)$','interpreter','latex','FontSize',14);      %'position',[0 -35 -30]  
ylabel('$\dot q\ \rm(ras/s^2)$','interpreter','latex','FontSize',14);        
zlabel('$\dot r\ \rm(ras/s^2)$','interpreter','latex','FontSize',14); 
% view(-45,45);
% set(get(gca, 'YLabel'), 'Rotation', 0);
legend({'\it\Pi','AMS'});
