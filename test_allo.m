



clc;
% clear all;
close all;
% function callqpact
%===============================================================
B=[-0.5   0       0.5   0;
     0  -0.5    0       0.5;
    0.25   0.25   0.25   0.25];
umin=[1;1;1;1]*(-20)*pi/180;
umax=[1;1;1;1]*20*pi/180;
%===================================幅值测试==================================================
N=20;
[XX,YY,ZZ] = sphere(N);
%==================================速度约束测试==================================+pi/2
t=0:0.01:3;
X1=0.15*t.*sin(pi*t);Y1=0.15*t.*cos(pi*t);Z1=zeros(1,301);
X1=0.4*sin(pi*t+pi/2);Y1=0.4*sin(pi*t);Z1=zeros(1,301);
X2=zeros(1,301);Y2=zeros(1,301);Z2=0.1*t;%ones(1,301)
Z2=0.25*ones(1,301);
% for i=1:1:101
% Z2(i)=0.25*(i-1)/100;
% end
% X1=0.0;Y1=0.0;Z1=0.3;
% X2=0.1;Y2=0.3;Z2=0;
X=X1+X2;Y=Y1+Y2;Z=Z1+Z2;
x=zeros(4,(N+1)^2);
xx=zeros(4,(N+1)^2);
x1=zeros(4,(N+1)^2);
x2=zeros(4,(N+1)^2);
x3=zeros(4,(N+1)^2);
x4=zeros(4,(N+1)^2);
iter=zeros((N+1)^2,1);
fval=zeros((N+1)^2,1);
t=zeros(3,(N+1)^2);
u=[0;0;0;0];
uu=[0;0;0;0];
u1=[0;0;0;0];
last_u=[0;0;0;0];
u2=[0;0;0;0];
u3=[0;0;0;0];%two_dir_alloc_mch([X2(1);Y2(1);Z2(1)], [X1(1);Y1(1);Z1(1)],u, 20,0);
u4=[0;0;0;0];
v_1=[0;0;0];
v_2=[0;0;0];
p_limits=20;
for i=1:(N+1)^2%
vv=1*[XX(i);YY(i);ZZ(i)];
% uu = wls_alloc_mch(vv,uu);
% xx(:,i)=uu;
% umin=max([1;1;1;1]*(-20)*pi/180,-0.01*400*pi/180+uu);
% umax=min([1;1;1;1]*20*pi/180,0.01*400*pi/180+uu);
% uu = dir_alloc_mch(vv, umin,umax);
uu = wls_alloc_mch(vv, uu, 20,0,0);
% uu = wls_alloc_mch(vv, uu, umin, umax,[0;0;0;0],1e6);
xx(:,i)=uu;
end
for i=1:length(X1)  %(N+1)^2%
v1=1*[X1(i);Y1(i);Z1(i)]; % 虚拟指令
v2=1*[X2(i);Y2(i);Z2(i)];
v=1*[X(i);Y(i);Z(i)];
% last_u1=u1;
% [u1] = prio_alloc(B,v2,v1,last_u1, 20, 0);
v1_last=v_1;
v2_last=v_2;
last_u1=u1;
[u1,v_1,v_2] = prio_alloc_incre(B,v2,v1,v1_last,v2_last,last_u1, 20, 1);
x1(:,i)=u1;

% % %==================有效集=====================
% u = dir_alloc_mch(v, umin,umax);   % wls_alloc_mch(v,u);% ,W,
% u =wls_alloc_mch(v, u, umin, umax,[0;0;0;0],1e6);
% u =wls_alloc_mch(v, u, 20, 0);
% x(:,i)=u;

% last_u1=u1;
% [u1,~] = dir_alloc(B,v,last_u1, 20, 1,1);
% x1(:,i)=u1;
% last_u1=u1;

% last_u2=u2;
% [u2,~] = dir_alloc(B,v,last_u2, 20, 1,1);
% x2(:,i)=u2;
% last_u2=u2;

% u1 =wls_alloc_mch(v, u1, 20, 1,1);
% x1(:,i)=u1;
% u2 =wls_alloc_mch(v, u2, 20, 1,0);
% x2(:,i)=u2;
% 改进
% if i==26
%     j=i;
% end
% u3=two_dir_alloc_mch(v2, v1,u3, p_limits,1);
% x3(:,i)=u3;
% u4=wls_alloc_mch(v, u4, 20, 1);
% x4(:,i)=u4;
end


UU=B*xx;
U=B*x;
U1=B*x1;
% U1=B*u1;
U2=B*x2;
U3=B*x3;
U4=B*x4;
% figure,
plot3(UU(1,:),UU(2,:),UU(3,:),'k.');grid on;
hold on;
plot3(X,Y,Z,'y>');
hold on;
% plot3(U(1,:),U(2,:),U(3,:),'g>');grid on;
hold on;
plot3(U1(1,:),U1(2,:),U1(3,:),'r*');grid on;
% legend('边界','给定','原','改进')
hold on;
plot3(U2(1,:),U2(2,:),U2(3,:),'b<');grid on;
hold on;
% plot3(U3(1,:),U3(2,:),U3(3,:),'g*');grid on;
% plot3(U4(1,:),U4(2,:),U4(3,:),'r+');grid on;
hold on;
legend('边界','给定','原','扰动','动态','改进','二次')