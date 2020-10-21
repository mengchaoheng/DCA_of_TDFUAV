clc;
% clear all;
% close all;
addpath C:\Users\mengc\Desktop\DDF\code\qcat1_2_1\QCAT\qcat
% function callqpact
global B plim S

% % compensation=1;
% p_limits=[20 200/60];%
% v_limits=[400 800];

% %===============================================================
% k_TS=9.9796018325697625989171178675552e-6;
% speed=1225;
% kc=3.157;
% l_1=0.17078793-0.09;% roll,pitch
% l_2=0.175;% T
% l_3=0.06647954;% yaw1 yaw3
% l_4=0.06647954+0.175;% yaw4
% l_5=0.175-0.06647954;% yaw2
% I_x=0.054593;
% I_y=0.017045;
% I_z=0.049226;
% I=[I_x 0 0;0 I_y 0;0 0 I_z];
% % =========================10 sureface=================================
% L=[-l_1 0 l_1 0 -l_1 0 l_1 0 l_2;
%     0 -l_1 0 l_1 0 -l_1 0 l_1 0;
%     l_3 -l_5 l_3 l_4 l_3 l_4 l_3 -l_5 0];
% F=diag([kc kc kc kc kc kc kc kc 2*k_TS*speed*60],0);%
% B=I\L*F;
% umin=[[1;1;1;1;1;1;1;1]*(-p_limits(1))*pi/180;-p_limits(2)];
% umax=[[1;1;1;1;1;1;1;1]*p_limits(1)*pi/180;p_limits(2)];
% vmin=[[1;1;1;1;1;1;1;1]*(-v_limits(1))*pi/180;-v_limits(2)];
% vmax=[[1;1;1;1;1;1;1;1]*v_limits(1)*pi/180;v_limits(2)];
% plim=[umin umax];
% rlim=[vmin vmax];% [vmin vmax];

[m,k] = size(B);
%===================================·ùÖµ²âÊÔ==================================================
% N=100;
% [XX,YY,ZZ] = sphere(N);
% x=zeros(k,(N+1)^2);
% u=zeros(k,1);
% for i=1:(N+1)^2%
% v=50*[XX(i);YY(i);ZZ(i)];

ratio = vview( B, plim, pinv(B) )
% [u,~,~,~] = alloc_sim('dir',B,v,plim,rlim,0.01,'ui',u);
% x(:,i)=u;
% end
% load('1w_U_T.mat');
% U=B*x;
% [~,n]=size(U);
% P=zeros(m,n);
% for i=1:n%
% [P(:,i), ~] = HuangJinFenGeFa(0.1*U(:,i),U(:,i),0.0001,B,umin,umax);
% end
% figure,
% plot3(P(1,:),P(2,:),P(3,:),'r.');grid on;hold on;
% plot3(U(1,:),U(2,:),U(3,:),'k.');grid on;hold on;
% xlabel('x','FontSize',14);        
% ylabel('y','FontSize',14);        
% zlabel('z','FontSize',14); 
% % figure,
% % iter=P(1,:)==0;%6.523061252377863
% % U0=P(:,iter);
% % plot(U0(2,:),U0(3,:),'r.');grid on;
% % iter=U0(3,:)>0;%6.523061252377863
% % U1=U0(:,iter);
% % iter=U1(1,:)>-4;%6.523061252377863
% % U2=U1(:,iter);
% % iter=U2(1,:)<4;%6.523061252377863
% % U3=U2(:,iter);
% figure,
% [KU, VU]= convhull(U(1,:),U(2,:),U(3,:),'simplify',true);
% defaultFaceColor  =[0.86275 0.86275 0.86275];
% trimesh(KU,U(1,:),U(2,:),U(3,:),'FaceColor','[0.86275 0.86275 0.86275]','FaceAlpha',0.4,'EdgeColor','k')
% axis equal