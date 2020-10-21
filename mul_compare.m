% --------------------------Ð¡ÈÅ¶¯Ê±--------------------------
% % Î±Äæ
% Roll_d_1=roll_d.Data;
% Yaw_d_1=yaw_d.Data;
% Pitch_d_1=pitch_d.Data;
% Roll_1=roll.Data;
% Yaw_1=yaw.Data;
% Pitch_1=pitch.Data;
% % dir
% Roll_d_2=roll_d.Data;
% Yaw_d_2=yaw_d.Data;
% Pitch_d_2=pitch_d.Data;
% Roll_2=roll.Data;
% Yaw_2=yaw.Data;
% Pitch_2=pitch.Data;
% % wls
% Roll_d_3=roll_d.Data;
% Yaw_d_3=yaw_d.Data;
% Pitch_d_3=pitch_d.Data;
% Roll_3=roll.Data;
% Yaw_3=yaw.Data;
% Pitch_3=pitch.Data;
% % maË³Ðò
% Roll_d_4=roll_d.Data;
% Yaw_d_4=yaw_d.Data;
% Pitch_d_4=pitch_d.Data;
% Roll_4=roll.Data;
% Yaw_4=yaw.Data;
% Pitch_4=pitch.Data;
% % --------------------´óÈÅ¶¯Ê±------------------------
% % Î±Äæ
% roll_d_1=roll_d.Data;
% yaw_d_1=yaw_d.Data;
% pitch_d_1=pitch_d.Data;
% roll_1=roll.Data;
% yaw_1=yaw.Data;
% pitch_1=pitch.Data;
% % dir
% roll_d_2=roll_d.Data;
% yaw_d_2=yaw_d.Data;
% pitch_d_2=pitch_d.Data;
% roll_2=roll.Data;
% yaw_2=yaw.Data;
% pitch_2=pitch.Data;
% % wls
% roll_d_3=roll_d.Data;
% yaw_d_3=yaw_d.Data;
% pitch_d_3=pitch_d.Data;
% roll_3=roll.Data;
% yaw_3=yaw.Data;
% pitch_3=pitch.Data;
% % maË³Ðò
% roll_d_4=roll_d.Data;
% yaw_d_4=yaw_d.Data;
% pitch_d_4=pitch_d.Data;
% roll_4=roll.Data;
% yaw_4=yaw.Data;
% pitch_4=pitch.Data;
%----------------------·ÂÕæ------------------------------------
clc;
% close all;
load('mul_compare_stable.mat');% Ð¡ÈÅ¶¯0.07
load('mul_compare_unstable.mat');% ÈÅ¶¯½Ï´ó7¶È
T=0.01;
t=0:T:400*T;
time1=56:111;
t1=0:T:196*T;
t2=0:T:250*T;
R2D=180/pi;
%==============================================================================================
figure,
subplot(3,1,1)
% plot(data1(time1,4),'k-');hold on;
plot(t,Roll_d_1(1100:1500)*R2D,'r-');hold on;
plot(t,Roll_1(1100:1500)*R2D,'b-.');hold on;% inv
plot(t,Roll_2(1100:1500)*R2D,'g--');hold on;% dir
plot(t,Roll_3(1100:1500)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;% w
plot(t,Roll_4(1100:1500)*R2D,'k-.');hold on;% m

% axis([0 1.2 -50 22]);
grid on;
title('¹ö×ª½ÇÏìÓ¦','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\phi (\circ)','FontSize',14);% ,'FontWeight','bold'
h1=legend('\phi_r','\phi_i','\phi_d','\phi_w','\phi_s');
set(h1,'FontName','Times New Roman','FontSize',12);
% figure,
subplot(3,1,2)
plot(t,Pitch_d_1(1100:1500)*R2D,'r-');hold on;
plot(t,Pitch_1(1100:1500)*R2D,'b-.');hold on;
plot(t,Pitch_2(1100:1500)*R2D,'g--');hold on;
plot(t,Pitch_3(1100:1500)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;
plot(t,Pitch_4(1100:1500)*R2D,'k-.');hold on;
% axis([0 1.2 -1 35]);
grid on;
title('¸©Ñö½ÇÏìÓ¦','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\theta (\circ)','FontSize',14)
h2=legend('\theta_r','\theta_i','\theta_d','\theta_w','\theta_s');
set(h2,'FontName','Times New Roman','FontSize',12);
% figure,
subplot(3,1,3)
plot(t,Yaw_d_1(1100:1500)*R2D,'r-');hold on;
plot(t,Yaw_1(1100:1500)*R2D,'b-.');hold on;
plot(t,Yaw_2(1100:1500)*R2D,'g--');hold on;
plot(t,Yaw_3(1100:1500)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;
plot(t,Yaw_4(1100:1500)*R2D,'k-.');hold on;
% axis([0 1.2 -200 200]);
grid on;
title('Æ«º½½ÇÏìÓ¦','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\psi (\circ)','FontSize',14);
h3=legend('\psi_r','\psi_i','\psi_d','\psi_w','\psi_s');
set(h3,'FontName','Times New Roman','FontSize',12);
% %==========================================================================================
figure,
subplot(3,1,1)
% plot(data1(time1,4),'k-');hold on;
plot(t2,roll_d_2(1100:1350)*R2D,'r-');hold on;

plot(t2,roll_1(1100:1350)*R2D,'b-.');hold on;
plot(t2,roll_2(1100:1350)*R2D,'g--');hold on;
plot(t2,roll_3(1100:1350)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;
plot(t2,roll_4(1100:1350)*R2D,'k-.');hold on;

% axis([0 1.2 -50 22]);
grid on;
title('¹ö×ª½ÇÏìÓ¦','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\phi (\circ)','FontSize',14);% ,'FontWeight','bold'
h4=legend('\phi_r','\phi_i','\phi_d','\phi_w','\phi_s');
set(h4,'FontName','Times New Roman','FontSize',12);
% figure,
subplot(3,1,2)
plot(t2,pitch_d_2(1100:1350)*R2D,'r-');hold on;

plot(t2,pitch_1(1100:1350)*R2D,'b-.');hold on;
plot(t2,pitch_2(1100:1350)*R2D,'g--');hold on;
plot(t2,pitch_3(1100:1350)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;
plot(t2,Pitch_4(1100:1350)*R2D,'k-.');hold on;
% axis([0 1.2 -1 35]);
grid on;
title('¸©Ñö½ÇÏìÓ¦','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\theta (\circ)','FontSize',14)
h5=legend('\theta_r','\theta_i','\theta_d','\theta_w','\theta_s');
set(h5,'FontName','Times New Roman','FontSize',12);
% figure,
subplot(3,1,3)
plot(t2,yaw_d_2(1100:1350)*R2D,'r-');hold on;

plot(t2,yaw_1(1100:1350)*R2D,'b-.');hold on;
plot(t2,yaw_2(1100:1350)*R2D,'g--');hold on;
plot(t2,yaw_3(1100:1350)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;
plot(t2,yaw_4(1100:1350)*R2D,'k-.');hold on;
% axis([0 1.2 -200 200]);
grid on;
title('Æ«º½½ÇÏìÓ¦','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\psi (\circ)','FontSize',14);
h6=legend('\psi_r','\psi_i','\psi_d','\psi_w','\psi_s');
set(h6,'FontName','Times New Roman','FontSize',12);