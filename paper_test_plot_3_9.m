clear all;
clc;
close all;
load('paper_test_data_3_9.mat');% Î±Äædata1ºÍ¶àÊ¸Á¿·ÖÅädata2£¬·ÉÐÐ
% load('pi_ma_pr_realdata.mat');% Î±Äædata1ºÍ¶àÊ¸Á¿·ÖÅädata2£¬·ÉÐÐ
% load('pi_ma_pr.mat');% -5¶ÈºÍ-0.088»¡¶È,·ÂÕæ
R2D=180/pi;
% %----------------------------------·É»úÊý¾Ý-------------------------------------------
% 20ms
T=0.02;
T1=0.01;
t=0:T:60*T;
t1=0:T1:120*T1;
tt=1:10:60;
tt1=1:20:120;

% time1=56:116;
% time2=102:162;
% phi_r=zeros(length(time1),1);
% theta_r=zeros(length(time1),1);
% phi_r(12:61)=ones(50,1)*20;
% theta_r(12:61)=ones(50,1)*20;
% 
% psi_r=data2(time2,6)

% phi_i=roll_1(1180:1300)*R2D
% phi_d=-data1(time1,1)
% phi_p=-data2(time2,1)

% theta_i=pitch_1(1180:1300)*R2D
% theta_d=-data1(time1,2)
% theta_p=-data2(time2,2)

% psi_i=rot
% psi_d=data1(time1,3)
% psi_p=data2(time2,3)
figure,
subplot(3,1,1)
% plot(data1(time1,4),'k-');hold on;
plot(t,phi_r,'r-');hold on;
plot(t1,phi_i,'g--','Marker','o','MarkerIndices',tt1);hold on;% pplan_D
plot(t,phi_d,'b-.','Marker','^','MarkerIndices',tt);hold on;
plot(t,phi_p,'k-','Marker','x','MarkerIndices',tt);hold on;
axis([0 1.2 -50 33]);
grid on;
title('¹ö×ª½Ç','FontSize',12);xlabel('\itt \rm(s)','FontSize',12);ylabel('\it\phi \rm(\circ)','FontSize',12,'FontWeight','bold')
h1=legend('\it\bf{\phi_r}','\it\bf{\phi_i}','\it\bf{\phi_d}','\it\bf{\phi_p}');
set(h1,'FontName','Times New Roman','FontSize',12,'location','southwest','NumColumns',4);
% figure,
subplot(3,1,2)
% plot(data1(time1,5),'k-');hold on;
plot(t,theta_r,'r-');hold on;
plot(t1,theta_i,'g--','Marker','o','MarkerIndices',tt1);hold on;% plan_D
plot(t,theta_d,'b-.','Marker','^','MarkerIndices',tt);hold on;
plot(t,theta_p,'k-','Marker','x','MarkerIndices',tt);hold on;
axis([0 1.2 -15 30]);
grid on;
title('¸©Ñö½Ç','FontSize',12);xlabel('\itt \rm(s)','FontSize',12);ylabel('\it\theta \rm(\circ)','FontSize',12,'FontWeight','bold')
h2=legend('\it\bf{\theta_r}','\it\bf{\theta_i}','\it\bf{\theta_d}','\it\bf{\theta_p}');
set(h2,'FontName','Times New Roman','FontSize',12,'location','southwest','NumColumns',4);
% figure,
subplot(3,1,3)
% plot(data1(time1,6),'k-');hold on;
plot(t,psi_r,'r-');hold on;
% rot=-yaw_1(1180:1300)*R2D+100;
% for i=1:121 
%     if rot(i)>180
%         rot(i)=rot(i)-360;
%     elseif rot(i)<-180
%         rot(i)=rot(i)+360;
%     end
% end    
plot(t1,psi_i,'g--','Marker','o','MarkerIndices',tt1);hold on;% plan_D
plot(t,psi_d,'b-.','Marker','^','MarkerIndices',tt);hold on;
plot(t,psi_p,'k-','Marker','x','MarkerIndices',tt);hold on;
axis([0 1.2 -200 200]);
grid on;%'FontWeight','bold'
title('Æ«º½½Ç','FontSize',12);xlabel('\itt \rm(s)','FontSize',12);ylabel('\it\psi \rm(\circ)','FontSize',12,'FontWeight','bold')
h3=legend('\it\bf{\psi_r}','\it\bf{\psi_i}','\it\bf{\psi_d}','\it\bf{\psi_p}');
set(h3,'FontName','Times New Roman','FontSize',12,'location','southwest','NumColumns',2);
% figure,
% subplot(3,1,1)
% % plot(data1(time1,4),'k-');hold on;
% plot(t,phi_r,'r-');hold on;
% plot(t1,roll_1(1180:1300)*R2D,'g--','Marker','o','MarkerIndices',tt);hold on;% pplan_D
% plot(t,-data1(time1,1),'b-.','Marker','^','MarkerIndices',tt);hold on;
% plot(t,-data2(time2,1),'k-','Marker','x','MarkerIndices',tt);hold on;
% axis([0 1.2 -50 33]);
% grid on;
% title('¹ö×ª½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% legend('\bf{\phi_r}','\bf{\phi_i}','\bf{\phi_d}','\bf{\phi_p}');
% 
% % figure,
% subplot(3,1,2)
% % plot(data1(time1,5),'k-');hold on;
% plot(t,theta_r,'r-');hold on;
% plot(t1,pitch_1(1180:1300)*R2D,'g--','Marker','o','MarkerIndices',tt);hold on;% plan_D
% plot(t,-data1(time1,2),'b-.','Marker','^','MarkerIndices',tt);hold on;
% plot(t,-data2(time2,2),'k-','Marker','x','MarkerIndices',tt);hold on;
% axis([0 1.2 -15 30]);
% grid on;
% title('¸©Ñö½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
% legend('\bf{\theta_r}','\bf{\theta_i}','\bf{\theta_d}','\bf{\theta_p}');
% 
% % figure,
% subplot(3,1,3)
% % plot(data1(time1,6),'k-');hold on;
% plot(t,data2(time2,6),'r-');hold on;
% rot=-yaw_1(1180:1300)*R2D+100;
% for i=1:121 
%     if rot(i)>180
%         rot(i)=rot(i)-360;
%     elseif rot(i)<-180
%         rot(i)=rot(i)+360;
%     end
% end    
% plot(t1,rot,'g--','Marker','o','MarkerIndices',tt);hold on;% plan_D
% plot(t,data1(time1,3),'b-.','Marker','^','MarkerIndices',tt);hold on;
% plot(t,data2(time2,3),'k-','Marker','x','MarkerIndices',tt);hold on;
% axis([0 1.2 -200 200]);
% grid on;
% title('Æ«º½½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
% legend('\bf{\psi_r}','\bf{\psi_i}','\bf{\psi_d}','\bf{\psi_p}');
