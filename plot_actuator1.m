clc;
% clear all;
% close all;
% load('Actuator.mat');
in_x=input.Data(:,1);
in_y=input.Data(:,2);
in_z=input.Data(:,3);
out_inv_x=output_inv.Data(:,1);
out_inv_y=output_inv.Data(:,2);
out_inv_z=output_inv.Data(:,3);
out_dir_x=output_dir.Data(:,1);
out_dir_y=output_dir.Data(:,2);
out_dir_z=output_dir.Data(:,3);
out_wls_x=output_wls.Data(:,1);
out_wls_y=output_wls.Data(:,2);
out_wls_z=output_wls.Data(:,3);
out_prio1_x=output_prio1.Data(:,1);
out_prio1_y=output_prio1.Data(:,2);
out_prio1_z=output_prio1.Data(:,3);
% out_mc_x=output_mc.Data(:,1);
% out_mc_y=output_mc.Data(:,2);
% out_mc_z=output_mc.Data(:,3);
figure,%
time=0:0.01:5;
tt=1:20:501;
subplot(3,1,1)
% plot(time,0.1*cos(pi*time),'k-','Marker','*','MarkerIndices',tt);hold on;
plot(time,in_x,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_x,'Color','b','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
plot(time,out_dir_x,'Color','g','LineStyle','--','Marker','o','MarkerIndices',tt);hold on;
% plot(time,out_wls_x,'Color','[0.8549 0.64706 0]','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
plot(time,out_prio1_x,'Color','k','LineStyle','-.','Marker','x','MarkerIndices',tt);hold on;grid on;
% axis([0 3 -0.36 0.45]);% [0.8549 0.64706 0]
title('ÐéÄâ¿ØÖÆÖ¸ÁîÏìÓ¦ÇúÏß','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('L (rad)','FontSize',14)
% h1=legend('\bf{\tau_{1}}','\bf{\tau_{p1}}','\bf{\tau_{d1}}','\bf{\tau_{w1}}','\bf{\tau_{m1}}','FontWeight','bold');
h1=legend('\tau','\tau_{i}','\tau_{d}','\tau_{w}','\tau_{s}');% ,'Location','EastOutside'
set(h1,'FontName','Times New Roman','FontSize',12);
subplot(3,1,2)
plot(time,in_y,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_y,'Color','b','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
plot(time,out_dir_y,'Color','g','LineStyle','--','Marker','o','MarkerIndices',tt);hold on;
% plot(time,out_wls_y,'Color','[0.8549 0.64706 0]','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
plot(time,out_prio1_y,'Color','k','LineStyle','-.','Marker','x','MarkerIndices',tt);hold on;grid on;
% axis([0 3 -0.36 0.36]);
xlabel('t (s)','FontSize',14);ylabel('M (rad)','FontSize',14)
% h2=legend('\bf{\tau_{y}}','\bf{\tau_{py}}','\bf{\tau_{dy}}','\bf{\tau_{wy}}','\bf{\tau_{my}}','FontWeight','bold');
% set(h2,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
subplot(3,1,3)
plot(time,in_z,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_inv_z,'Color','b','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
plot(time,out_dir_z,'Color','g','LineStyle','--','Marker','o','MarkerIndices',tt);hold on;
% plot(time,out_wls_z,'Color','[0.8549 0.64706 0]','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
plot(time,out_prio1_z,'Color','k','LineStyle','-.','Marker','x','MarkerIndices',tt);hold on;grid on;
% axis([0 3 0 0.27]);
xlabel('t (s)','FontSize',14);ylabel('N (rad)','FontSize',14)
% h3=legend('\bf{\tau_{z}}','\bf{\tau_{pz}}','\bf{\tau_{dz}}','\bf{\tau_{wz}}','\bf{\tau_{mz}}','FontWeight','bold');
% set(h3,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');% ,'Location','EastOutside'

% axis([0 2 -0.35 0.35]);
% title('ÐéÄâ¿ØÖÆÁ¿ÏìÓ¦ÇúÏß','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('ÐéÄâ¿ØÖÆÁ¿ £¨rad£©','FontWeight','bold')
% legend('\bf{\tau_{Cx}}','\bf{\tau_{Px}}','\bf{\tau_{Ax}}','\bf{\tau_{Cy}}','\bf{\tau_{Py}}','\bf{\tau_{Ay}}','\bf{\tau_{Cz}}','\bf{\tau_{Pz}}','\bf{\tau_{Az}}','FontWeight','bold');
%------------------------------------------------------------------------------------------------------------------------
% figure,%
% subplot(3,1,1)
% % plot(time,0.1*cos(pi*time),'k-','Marker','*','MarkerIndices',tt);hold on;
% % plot(time,in_x,'r-','Marker','none','MarkerIndices',tt);hold on;
% plot(time,in_x-out_inv_x,'Color','m','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
% plot(time,in_x-out_dir_x,'LineStyle','--','Color','b','Marker','o','MarkerIndices',tt);hold on;
% plot(time,in_x-out_wls_x,'Color','g','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
% plot(time,in_x-out_mc_x,'LineStyle','-.','Color','k','Marker','x','MarkerIndices',tt);hold on;grid on;
% % axis([0 2.5 -0.12 0.12]);
% title('ÐéÄâ¿ØÖÆÖ¸Áî¸ú×ÙÎó²î','FontSize',14);xlabel('t (s)','FontSize',14);ylabel('\Delta_{1}(rad)','FontSize',14)% ,'FontWeight','bold'
% % h4=legend('\bf{\Delta_{px}}','\bf{\Delta_{dx}}','\bf{\Delta_{wx}}','\bf{\Delta_{mx}}','FontWeight','bold');
% h4=legend('\Delta_{i}','\Delta_{d}','\Delta_{w}','\Delta_{s}');% ,'Location','EastOutside'
% set(h4,'FontName','Times New Roman','FontSize',13);
% subplot(3,1,2)
% % plot(time,in_y,'r-','Marker','none','MarkerIndices',tt);hold on;
% plot(time,in_y-out_inv_y,'Color','m','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
% plot(time,in_y-out_dir_y,'LineStyle','--','Color','b','Marker','o','MarkerIndices',tt);hold on;
% plot(time,in_y-out_wls_y,'Color','g','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
% plot(time,in_y-out_mc_y,'LineStyle','-.','Color','k','Marker','x','MarkerIndices',tt);hold on;grid on;
% % axis([0 2.5 -0.15 0.4]);
% xlabel('t (s)','FontSize',14);ylabel('\Delta_{2}(rad)','FontSize',14)
% % h5=legend('\bf{\Delta_{py}}','\bf{\Delta_{dy}}','\bf{\Delta_{wy}}','\bf{\Delta_{my}}','FontWeight','bold');
% % set(h5,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
% subplot(3,1,3)
% % plot(time,in_z,'r-','Marker','none','MarkerIndices',tt);hold on;
% plot(time,in_z-out_inv_z,'Color','m','LineStyle','-.','Marker','^','MarkerIndices',tt);hold on;
% plot(time,in_z-out_dir_z,'LineStyle','--','Color','b','Marker','o','MarkerIndices',tt);hold on;
% plot(time,in_z-out_wls_z,'Color','g','LineStyle','--','Marker','s','MarkerIndices',tt);hold on;
% plot(time,in_z-out_mc_z,'LineStyle','-.','Color','k','Marker','x','MarkerIndices',tt);hold on;grid on;
% axis([0 3 -0.02 0.26]);
% xlabel('t (s)','FontSize',14);ylabel('\Delta_{3}(rad)','FontSize',14)
% % h6=legend('\bf{\Delta_{pz}}','\bf{\Delta_{dz}}','\bf{\Delta_{wz}}','\bf{\Delta_{mz}}','FontWeight','bold');
% % set(h6,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');% ,'Location','EastOutside'