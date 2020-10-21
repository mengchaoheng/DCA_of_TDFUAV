% clear all;
clc;
close all;
% %----------------------------------·É»úÊý¾Ý-------------------------------------------
% 20ms
T=0.02;
t=0:T:55*T;
% data1=xlsread('1(2019.11.28-10.34.51).xlsx');
% data2=xlsread('2(2019.11.28-10.34.51).xlsx');
% data1=data1./100;
% data1(101:239,3)=360+data1(101:239,3);
% data2=data2./100;
% load('data1.mat');
load('pi_ma_pr_realdata.mat');% Î±Äædata1ºÍ¶àÊ¸Á¿·ÖÅädata2

time1=56:111;
time2=102:157;
phi_d=zeros(length(time1),1);
theta_d=zeros(length(time1),1);
phi_d(12:56)=ones(45,1)*20;
theta_d(12:56)=ones(45,1)*20;
figure,
subplot(3,1,1)
% plot(data1(time1,4),'k-');hold on;
plot(t,phi_d,'r-');hold on;
plot(t,-data1(time1,1),'g-');hold on;
plot(t,-data2(time2,1),'b-.');hold on;
axis([0 1.1 -1 31]);
grid on;
title('¹ö×ª½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('\bf{\phi_d}','\bf{\phi_1}','\bf{\phi_2}');

% figure,
subplot(3,1,2)
% plot(data1(time1,5),'k-');hold on;
plot(t,theta_d,'r-');hold on;
plot(t,-data1(time1,2),'g-');hold on;
plot(t,-data2(time2,2),'b-.');hold on;
axis([0 1.1 -13 25]);
grid on;
title('¸©Ñö½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
legend('\bf{\theta_d}','\bf{\theta_1}','\bf{\theta_2}');

% figure,
subplot(3,1,3)
% plot(data1(time1,6),'k-');hold on;
plot(t,data2(time2,6),'r-');hold on;
plot(t,data1(time1,3),'g-');hold on;
plot(t,data2(time2,3),'b-.');hold on;
axis([0 1.1 -200 200]);
grid on;
title('Æ«º½½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
legend('\bf{\psi_d}','\bf{\psi_1}','\bf{\psi_2}');
%----------------------·ÂÕæ------------------------------------
% roll_1=roll.Data;% Î±Äæ
% pitch_1=pitch.Data;
% yaw_1=yaw.Data;
% roll_1d=roll_d.Data;
% pitch_1d=pitch_d.Data;
% yaw_1d=yaw_d.Data;

% roll_2=roll.Data;% ¶àÊ¸Á¿·ÖÅä
% pitch_2=pitch.Data;
% yaw_2=yaw.Data;
% roll_2d=roll_d.Data;
% pitch_2d=pitch_d.Data;
% yaw_2d=yaw_d.Data;
load('pi_ma_pr.mat');% -5¶ÈºÍ-0.088»¡¶È
T=0.01;
t=0:T:120*T;
R2D=180/pi;
figure,
subplot(3,1,1)
% plot(data1(time1,4),'k-');hold on;
plot(t,roll_1d(1180:1300)*R2D,'r-');hold on;
plot(t,roll_1(1180:1300)*R2D,'g-');hold on;
plot(t,roll_2(1180:1300)*R2D,'b-.');hold on;
axis([0 1.2 -50 22]);
grid on;
title('¹ö×ª½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('\bf{\phi_d}','\bf{\phi_1}','\bf{\phi_2}');

% figure,
subplot(3,1,2)
% plot(data1(time1,5),'k-');hold on;
plot(t,pitch_1d(1180:1300)*R2D,'r-');hold on;
plot(t,pitch_1(1180:1300)*R2D,'g-');hold on;
plot(t,pitch_2(1180:1300)*R2D,'b-.');hold on;
% axis([0 1.2 -1 35]);
grid on;
title('¸©Ñö½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
legend('\bf{\theta_d}','\bf{\theta_1}','\bf{\theta_2}');

% figure,
subplot(3,1,3)
% plot(data1(time1,6),'k-');hold on;
plot(t,yaw_1d(1180:1300)*R2D,'r-');hold on;
plot(t,-yaw_1(1180:1300)*R2D,'g-');hold on;
plot(t,yaw_2(1180:1300)*R2D,'b-.');hold on;
axis([0 1.2 -200 200]);
grid on;
title('Æ«º½½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
legend('\bf{\psi_d}','\bf{\psi_1}','\bf{\psi_2}');