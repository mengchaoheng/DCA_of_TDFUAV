N=20;
xx=zeros(4,(N+1)^2);
x1=zeros(4,(N+1)^2);
[XX,YY,ZZ] = sphere(N);
t=0:0.01:3;
X1=0.34*sin(pi*t);Y1=0.34*sin(pi*t+pi/2);Z1=zeros(1,301);
B=[-0.5   0       0.5   0;
     0  -0.5    0       0.5;
    0.25   0.25   0.25   0.25];
umin=[1;1;1;1]*(-20)*pi/180;
umax=[1;1;1;1]*20*pi/180;
% v_C =[
% 
%     0.2121;
%     0.2121;
%          0];
umax1 =[

    0.007680919785430;
         0
    0.062132191909614
    0.069813170079773];
umin1 =[

   -0.131945420374117
   -0.139626340159546
   -0.007680978170159
         0];
for i=1:(N+1)^2%
vv=1*[XX(i);YY(i);ZZ(i)];
% uu = dir_alloc_mch(vv, umin1,umax1);
[uu,a] = dir_alloc(B,vv,umin1,umax1);
xx(:,i)=uu;
end 
for i=1:length(X1)%
v1=1*[X1(i);Y1(i);Z1(i)];
% uu = wls_alloc_mch(vv,uu);
% xx(:,i)=uu;
if(i==length(X1))
    ddd=1;
end
% u1 = dir_alloc_mch(v1, umin1,umax1);
[u1,a] = dir_alloc(B,v1,umin1,umax1);
x1(:,i)=u1;
end 
UU=B*xx;plot3(UU(1,:),UU(2,:),UU(3,:),'k.');grid on;hold on;
U1=B*x1;plot3(U1(1,:),U1(2,:),U1(3,:),'r*');grid on;hold on;