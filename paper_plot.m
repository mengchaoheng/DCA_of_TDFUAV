clc;
% close all;
load('mul_compare_tub.mat');% 有扰动
% load('mul_compare.mat');% 无扰动
T=0.01;
t=0:T:400*T;
R2D=180/pi;
%==============================================================================================
figure,
subplot(3,2,1)
% plot(data1(time1,4),'k-');hold on;
plot(t,Roll_d_1(1100:1500)*R2D,'r-');hold on;
plot(t,Roll_1(1100:1500)*R2D,'b-.');hold on;% inv
plot(t,Roll_2(1100:1500)*R2D,'g--');hold on;% dir
plot(t,Roll_3(1100:1500)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;% w
plot(t,Roll_4(1100:1500)*R2D,'k-.');hold on;% m

% axis([0 1.2 -50 22]);
grid on;
title('滚转角响应','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\phi (\circ)','FontSize',14);% ,'FontWeight','bold'
h1=legend('\phi_r','\phi_i','\phi_d','\phi_w','\phi_m');
set(h1,'FontName','Times New Roman','FontSize',12);
% figure,
subplot(3,2,3)
plot(t,Pitch_d_1(1100:1500)*R2D,'r-');hold on;
plot(t,Pitch_1(1100:1500)*R2D,'b-.');hold on;
plot(t,Pitch_2(1100:1500)*R2D,'g--');hold on;
plot(t,Pitch_3(1100:1500)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;
plot(t,Pitch_4(1100:1500)*R2D,'k-.');hold on;
% axis([0 1.2 -1 35]);
grid on;
title('俯仰角响应','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\theta (\circ)','FontSize',14)
h2=legend('\theta_r','\theta_i','\theta_d','\theta_w','\theta_m');
set(h2,'FontName','Times New Roman','FontSize',12);
% figure,
subplot(3,2,5)
plot(t,Yaw_d_1(1100:1500)*R2D,'r-');hold on;
plot(t,Yaw_1(1100:1500)*R2D,'b-.');hold on;
plot(t,Yaw_2(1100:1500)*R2D,'g--');hold on;
plot(t,Yaw_3(1100:1500)*R2D,'Color','[0.8549 0.64706 0]','LineStyle','--');hold on;
plot(t,Yaw_4(1100:1500)*R2D,'k-.');hold on;
% axis([0 1.2 -200 200]);
grid on;
title('偏航角响应','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\psi (\circ)','FontSize',14);
h3=legend('\psi_r','\psi_i','\psi_d','\psi_w','\psi_m');
set(h3,'FontName','Times New Roman','FontSize',12);

load('Actuator.mat');
time=0:0.01:3;
tt=1:25:301;
subplot(3,2,2)
% plot(time,0.1*cos(pi*time),'k-','Marker','*','MarkerIndices',tt);hold on;
plot(time,in_x,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_x,'Color','b','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
plot(time,out_dir_x,'Color','g','LineStyle','--','Marker','o','MarkerIndices',tt);hold on;
plot(time,out_wls_x,'Color','[0.8549 0.64706 0]','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
plot(time,out_mc_x,'Color','k','LineStyle','-.','Marker','x','MarkerIndices',tt);hold on;grid on;
axis([0 3 -0.36 0.45]);
title('虚拟控制指令响应曲线','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\tau_{1}(rad)','FontSize',14)
% h1=legend('\bf{\tau_{1}}','\bf{\tau_{p1}}','\bf{\tau_{d1}}','\bf{\tau_{w1}}','\bf{\tau_{m1}}','FontWeight','bold');
h1=legend('\tau','\tau_{i}','\tau_{d}','\tau_{w}','\tau_{m}');% ,'Location','EastOutside'
set(h1,'FontName','Times New Roman','FontSize',12);
subplot(3,2,4)
plot(time,in_y,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_y,'Color','b','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
plot(time,out_dir_y,'Color','g','LineStyle','--','Marker','o','MarkerIndices',tt);hold on;
plot(time,out_wls_y,'Color','[0.8549 0.64706 0]','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
plot(time,out_mc_y,'Color','k','LineStyle','-.','Marker','x','MarkerIndices',tt);hold on;grid on;
% axis([0 3 -0.36 0.36]);
xlabel('t (s)','FontSize',14);ylabel('\tau_{2}(rad)','FontSize',14)
% h2=legend('\bf{\tau_{y}}','\bf{\tau_{py}}','\bf{\tau_{dy}}','\bf{\tau_{wy}}','\bf{\tau_{my}}','FontWeight','bold');
% set(h2,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
subplot(3,2,6)
plot(time,in_z,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_z,'Color','b','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
plot(time,out_dir_z,'Color','g','LineStyle','--','Marker','o','MarkerIndices',tt);hold on;
plot(time,out_wls_z,'Color','[0.8549 0.64706 0]','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
plot(time,out_mc_z,'Color','k','LineStyle','-.','Marker','x','MarkerIndices',tt);hold on;grid on;
axis([0 3 0 0.27]);
xlabel('t (s)','FontSize',14);ylabel('\tau_{3}(rad)','FontSize',14)
% h3=legend('\bf{\tau_{z}}','\bf{\tau_{pz}}','\bf{\tau_{dz}}','\bf{\tau_{wz}}','\bf{\tau_{mz}}','FontWeight','bold');
% set(h3,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');% ,'Location','EastOutside'

% axis([0 2 -0.35 0.35]);
% title('虚拟控制量响应曲线','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('虚拟控制量 （rad）','FontWeight','bold')
% legend('\bf{\tau_{Cx}}','\bf{\tau_{Px}}','\bf{\tau_{Ax}}','\bf{\tau_{Cy}}','\bf{\tau_{Py}}','\bf{\tau_{Ay}}','\bf{\tau_{Cz}}','\bf{\tau_{Pz}}','\bf{\tau_{Az}}','FontWeight','bold');
