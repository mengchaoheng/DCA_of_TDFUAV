close all;

a=0.3491;b=a;c=0.1642;
A1=1/(a*a/(a-c));B1=1/(a*a/(a-c));C1=1/a;D1=-1;% 法向量就是（A1，B1，C1）


A2=1;B2=0;C2=0;D2=-a;
A3=0;B3=1;C3=0;D3=-a;
a1=[0;0;a];b1=[a;0;c];c1=[a;a;0];d1=[0;a;c];
a2=[a;0;0];b2=[a;0;c];c2=[a;a;0];%
a3=[0;a;0];b3=[0;a;c];c3=[a;a;0];
a4=a1;b4=[a;0;a];c4=[a;a;a];d4=[0;a;a];
e4=[a;0;0];f4=[a;a;0];g4=[0;a;0];

V=[0.5;0.3;0.4];
V1(1)=Constrain(V(1),0,a);
V1(2)=Constrain(V(2),0,a);
V1(3)=Constrain(V(3),0,a);

X1 = [a1(1); b1(1); c1(1); d1(1)];
Y1 = [a1(2); b1(2); c1(2); d1(2)];
Z1 = [a1(3); b1(3); c1(3); d1(3)];
Color1=sqrt(X1.*X1+Y1.*Y1+Z1.*Z1);
figure,
h1=fill3(X1,Y1,Z1,[.5 .5 .5]);
set(h1,'FaceAlpha',0.5);
hold on
X2 = [a2(1); b2(1); c2(1)];
Y2 = [a2(2); b2(2); c2(2)];
Z2 = [a2(3); b2(3); c2(3)];
Color2=sqrt(X2.*X2+Y2.*Y2+Z2.*Z2);
h2=fill3(X2,Y2,Z2,[.5 .5 .5]);
set(h2,'FaceAlpha',0.5);
hold on
X3 = [a3(1); b3(1); c3(1)];
Y3 = [a3(2); b3(2); c3(2)];
Z3 = [a3(3); b3(3); c3(3)];
Color3=sqrt(X3.*X3+Y3.*Y3+Z3.*Z3);
h3=fill3(X3,Y3,Z3,[.5 .5 .5]);
set(h3,'FaceAlpha',0.5);
% cc=colorbar;
% cc.Label.String = '最大力矩幅值（N*m）';
% hold on
% X4 = [a4(1); b4(1); c4(1);d4(1)];
% Y4 = [a4(2); b4(2); c4(2);d4(2)];
% Z4 = [a4(3); b4(3); c4(3);d4(3)];
% h4=fill3(X4,Y4,Z4,[.5 .5 .5]);
% set(h4,'FaceAlpha',0.1);
% hold on
% X5 = [ b4(1); e4(1);f4(1);c4(1)];
% Y5 = [ b4(2); e4(2);f4(2);c4(2)];
% Z5 = [ b4(3); e4(3);f4(3);c4(3)];
% h5=fill3(X5,Y5,Z5,[.5 .5 .5]);
% set(h5,'FaceAlpha',0.1);
% hold on
% X6 = [ c4(1);d4(1);g4(1);f4(1)];
% Y6 = [c4(2);d4(2);g4(2);f4(2)];
% Z6 = [c4(3);d4(3);g4(3);f4(3)];
% h6=fill3(X6,Y6,Z6,[.5 .5 .5]);
% set(h6,'FaceAlpha',0.1);
hold on
tau=[0.308;0.308;0.09];
h7=quiver3(0,0,0,0,0,tau(3),1,'--g');% tau在Z上投影
set(h7,'maxheadsize',0.3);hold on;
h8=quiver3(0,0,0,tau(1),tau(2),0,1,'--b');% % tau在X-Y上投影
set(h8,'maxheadsize',0.3);hold on;
umin=[1;1;1;1]*(-20)*pi/180;
umax=[1;1;1;1]*20*pi/180;
% uv = dir_alloc_mch([0.3491;0.3491;0.3],umin,umax);
B=[-0.5   0       0.5   0;
     0  -0.5    0       0.5;
    0.25   0.25   0.25   0.25];
uv =pinv(B)*tau;
uv(1)=Constrain(uv(1),-0.3491,0.3491);
uv(2)=Constrain(uv(2),-0.3491,0.3491);
uv(3)=Constrain(uv(3),-0.3491,0.3491);
uv(4)=Constrain(uv(4),-0.3491,0.3491);
M=B*uv;

h9=quiver3(0,0,0,tau(1),tau(2),tau(3),1,'--k');% tau
set(h9,'maxheadsize',0.3);hold on;
h10=quiver3(0,0,0,M(1),M(2),M(3),1,'k','LineWidth',1);% 由tau实际得到的 tau_real
set(h10,'maxheadsize',0.5);hold on;

h11=quiver3(0,0,0,M(1),M(2),0,1,'r','LineWidth',1);% tau_real在X-Y上投影
set(h11,'maxheadsize',0.5);hold on;
h12=quiver3(0,0,0,0,0,M(3),1,'m','LineWidth',1);% tau_real在Z上投影
set(h12,'maxheadsize',0.5);hold on;
h13=plot3(M(1),M(2),M(3),'k.','MarkerSize',12);
h14=plot3(M(1),M(2),0,'r.','MarkerSize',12);
h15=plot3(0,0,M(3),'m.','MarkerSize',12);
title('伪逆法');   
axis([-0.01 0.35 -0.01 0.35 -0.01 0.35]);grid on;
legend([h1 h7 h8 h9 h10 h11 h12],'可达集边界','\bf{\tau_d}','\bf{\tau_C}','\bf{\tau}','\bf{\tau_{P}}','\bf{\tau_{P\_xy}}' ,'\bf{\tau_{P\_z}}');
xlabel('X_B (rad)');        
ylabel('Y_B (rad)');        
zlabel('Z_B (rad)');  

figure,
h1=fill3(X1,Y1,Z1,[.5 .5 .5]);
set(h1,'FaceAlpha',0.5);
hold on
X2 = [a2(1); b2(1); c2(1)];
Y2 = [a2(2); b2(2); c2(2)];
Z2 = [a2(3); b2(3); c2(3)];
Color2=sqrt(X2.*X2+Y2.*Y2+Z2.*Z2);
h2=fill3(X2,Y2,Z2,[.5 .5 .5]);
set(h2,'FaceAlpha',0.5);
hold on
X3 = [a3(1); b3(1); c3(1)];
Y3 = [a3(2); b3(2); c3(2)];
Z3 = [a3(3); b3(3); c3(3)];
Color3=sqrt(X3.*X3+Y3.*Y3+Z3.*Z3);
h3=fill3(X3,Y3,Z3,[.5 .5 .5]);
set(h3,'FaceAlpha',0.5);
hold on
h7=quiver3(0,0,0,0,0,tau(3),1,'--g');% 
set(h7,'maxheadsize',0.4);hold on;
h8=quiver3(0,0,0,tau(1),tau(2),0,1,'--b');% 
set(h8,'maxheadsize',0.3);hold on;
umin=[1;1;1;1]*(-20)*pi/180;
umax=[1;1;1;1]*20*pi/180;
uv = two_dir_alloc_mch([0;0;tau(3)],[tau(1);tau(2);0],[0;0;0;0],20,0);
B=[-0.5   0       0.5   0;
     0  -0.5    0       0.5;
    0.25   0.25   0.25   0.25];
M=B*uv;
h9=quiver3(0,0,0,tau(1),tau(2),tau(3),1,'--k');
set(h9,'maxheadsize',0.3);hold on;
h10=quiver3(0,0,0,M(1),M(2),M(3),1,'k','LineWidth',1);
set(h10,'maxheadsize',0.3);hold on;

h11=quiver3(0,0,0,M(1),M(2),0,1,'r','LineWidth',1);
set(h11,'maxheadsize',3);hold on;
h12=quiver3(0,0,0,0,0,M(3),1,'m','LineWidth',1);
set(h12,'maxheadsize',0.3);hold on;
h13=plot3(M(1),M(2),M(3),'k.','MarkerSize',12);
h14=plot3(M(1),M(2),0,'r.','MarkerSize',12);
h15=plot3(0,0,M(3),'m.','MarkerSize',12);
title('多矢量分配法');  
axis([-0.01 0.35 -0.01 0.35 -0.01 0.35]);grid on;
legend([h1 h7 h8 h9 h10 h11 h12],'可达集边界','\bf{\tau_d}','\bf{\tau_C}','\bf{\tau}','\bf{\tau_{M}}','\bf{\tau_{M\_xy}}' ,'\bf{\tau_{M\_z}}');
xlabel('X_B (rad)');        
ylabel('Y_B (rad)');        
zlabel('Z_B (rad)');  

% figure,
% h1=fill3(X1,Y1,Z1,[.5 .5 .5]);
% set(h1,'FaceAlpha',0.5);
% hold on
% X2 = [a2(1); b2(1); c2(1)];
% Y2 = [a2(2); b2(2); c2(2)];
% Z2 = [a2(3); b2(3); c2(3)];
% Color2=sqrt(X2.*X2+Y2.*Y2+Z2.*Z2);
% h2=fill3(X2,Y2,Z2,[.5 .5 .5]);
% set(h2,'FaceAlpha',0.5);
% hold on
% X3 = [a3(1); b3(1); c3(1)];
% Y3 = [a3(2); b3(2); c3(2)];
% Z3 = [a3(3); b3(3); c3(3)];
% Color3=sqrt(X3.*X3+Y3.*Y3+Z3.*Z3);
% h3=fill3(X3,Y3,Z3,[.5 .5 .5]);
% set(h3,'FaceAlpha',0.5);
% hold on
% h7=quiver3(0,0,0,0,0,tau(3),1,'--g');% 
% set(h7,'maxheadsize',0.4);hold on;
% h8=quiver3(0,0,0,tau(1),tau(2),0,1,'--b');% 
% set(h8,'maxheadsize',0.3);hold on;
% umin=[1;1;1;1]*(-20)*pi/180;
% umax=[1;1;1;1]*20*pi/180;
% uv = dir_alloc_mch(tau,umin,umax);
% B=[-0.5   0       0.5   0;
%      0  -0.5    0       0.5;
%     0.25   0.25   0.25   0.25];
% M=B*uv;
% h9=quiver3(0,0,0,tau(1),tau(2),tau(3),1,'--k');
% set(h9,'maxheadsize',0.3);hold on;
% h10=quiver3(0,0,0,M(1),M(2),M(3),1,'k','LineWidth',1);
% set(h10,'maxheadsize',0.3);hold on;
% 
% h11=quiver3(0,0,0,M(1),M(2),0,1,'r','LineWidth',1);
% set(h11,'maxheadsize',0.4);hold on;
% h12=quiver3(0,0,0,0,0,M(3),1,'m','LineWidth',1);
% set(h12,'maxheadsize',0.3);hold on;
% h13=plot3(M(1),M(2),M(3),'k.','MarkerSize',12);
% h14=plot3(M(1),M(2),0,'r.','MarkerSize',12);
% h15=plot3(0,0,M(3),'m.','MarkerSize',12);
% title('直接分配法');   
% axis([-0.01 0.35 -0.01 0.35 -0.01 0.35]);grid on;
% legend([h1 h7 h8 h9 h10 h11 h12],'可达集边界','\bf{\tau_d}','\bf{\tau_C}','\bf{\tau}','\bf{\tau_{dir}}','\bf{\tau_{dir\_xy}}' ,'\bf{\tau_{dir\_z}}');
% xlabel('X_B (rad)');        
% ylabel('Y_B (rad)');        
% zlabel('Z_B (rad)');  
