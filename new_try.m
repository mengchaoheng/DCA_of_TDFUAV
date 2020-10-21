B=[-0.5393   0       0.5393   0;
     0  -0.5393    0       0.5393;
    0.2099   0.2099   0.2099   0.2099];
umin=[1;1;1;1]*(-20)*pi/180;
umax=[1;1;1;1]*20*pi/180;
N=100;
[XX,YY,ZZ] = sphere(N);
xx=zeros(4,(N+1)^2);
y=zeros(4,(N+1)^2);
P=zeros(3,(N+1)^2);
uu=[0;0;0;0];
for i=1:(N+1)^2%
vv=1*[XX(i);YY(i);ZZ(i)];
% umin=max([1;1;1;1]*(-20)*pi/180,-0.01*400*pi/180+uu);
% umax=min([1;1;1;1]*20*pi/180,0.01*400*pi/180+uu);
% uu = dir_alloc_mch(vv,umin,umax);
uu = wls_alloc_mch(vv, uu, 20,0);
xx(:,i)=uu;
end

UU=B*xx;
[~,k]=size(UU);
% for i=1:k%
% % u1=pinv(B)*UU(:,i);
% P(:,i) = binarysearch( UU(:,i) )  
% % [ye,flag]=chosen(u1,umin,umax)
% % y(:,i)=Constrain(u1,umin,umax);
% end
% Uy=B*P;
% figure,
% [K2, V2]= convhull(UU(1,:),UU(2,:),UU(3,:),'simplify',true);
% defaultFaceColor  = [1 0.41176 0.70588];
% % subplot(1,2,2)
% trisurf(K2,UU(1,:),UU(2,:),UU(3,:),'FaceColor','[1 0.41176 0.70588]','FaceAlpha',1,'EdgeColor','r')
% axis equal
figure,

plot3(UU(1,:),UU(2,:),UU(3,:),'k.');grid on;
% hold on;
% subplot(1,2,1)
% load('ma_of_inv.mat');
% plot3(P(1,:),P(2,:),P(3,:),'r>');grid on;

% hold on;
% X1=0.0;Y1=0.0;Z1=0.3;
% X2=0.1;Y2=0.3;Z2=0;
% X=X1+X2;Y=Y1+Y2;Z=Z1+Z2;
% v1=1*[X1;Y1;Z1]; % ÐéÄâÖ¸Áî
% v2=1*[X2;Y2;Z2];
% v=1*[X;Y;Z];
% u = wls_alloc_mch(v, u, 20,0);
% u1 = dir_alloc_mch(v1, umin,umax);
% u2 = dir_alloc_mch(v2, umin,umax);
% u3=two_dir_alloc_mch(v2, v1,u3, p_limits,0)
% % [u_l,u_h,a1,a2] = new_try_p(v1, v2,umin,umax)
% U=B*u;
% U1=B*u1;
% U2=B*u2;
% U3=B*u3;
% % U1=B*u_l;
% % U2=B*u_h;
% % U3=B*(u_l+u_h);
% 
% plot3(X,Y,Z,'b>');
% hold on;
% plot3(U(1,:),U(2,:),U(3,:),'y>');grid on;
% hold on;
% plot3(U1(1,:),U1(2,:),U1(3,:),'g*');grid on;
% hold on;
% plot3(U2(1,:),U2(2,:),U2(3,:),'g+');grid on;
% hold on;
% plot3(U3(1,:),U3(2,:),U3(3,:),'r*');grid on;
% hold on;