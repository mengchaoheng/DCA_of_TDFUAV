global com_t_wls com_t_inv com_t_dca  com_c select_test hf lf %Del

% 频率信号
select_test=0;
com_c=1/(1-exp(-90*0.01));% 90
com_t_wls=1/(1-exp(-11*0.01));%11
com_t_dca=1/(1-exp(-11*0.01));
% lf=1;
% hf=5;
lf=0.5;hf=6;Am=6;
sim('twin');%一、0.1-8HZ，幅值5.二、阶跃6
in_x=input.Data(:,1);
in_y=input.Data(:,2);
in_z=input.Data(:,3);
out_wls_x_off=output_wls_off.Data(:,1);
out_wls_y_off=output_wls_off.Data(:,2);
out_wls_z_off=output_wls_off.Data(:,3);
wls_surfase_in_off=wls_c_in_off.Data;
wls_surfase_out_off=wls_c_out_off.Data;
wls_T_in_off=wls_in_off.Data;
wls_T_out_off=wls_out_off.Data;

out_wls_x=output_wls.Data(:,1);
out_wls_y=output_wls.Data(:,2);
out_wls_z=output_wls.Data(:,3);

wls_surfase_in=wls_c_in.Data;
wls_surfase_out=wls_c_out.Data;
wls_T_in=wls_in.Data;
wls_T_out=wls_out.Data;
out_dca_x=output_dca.Data(:,1);
out_dca_y=output_dca.Data(:,2);
out_dca_z=output_dca.Data(:,3);

dca_surfase_in=dca_c_in.Data;
dca_surfase_out=dca_c_out.Data;
dca_T_in=dca_in.Data;
dca_T_out=dca_out.Data;



time=0:0.01:3;
tt=1:30:301;
figure,%
subplot(3,1,1)
plot(time,dca_surfase_in,'k-','Marker','none','MarkerIndices',tt);hold on;
plot(time,dca_surfase_out,'b--','Marker','o','MarkerIndices',tt);hold on;grid on;
plot(time,wls_surfase_out_off,'r-.','Marker','x','MarkerIndices',tt);hold on;
axis([0 3 -0.3 0.3]);
xlabel('Time (s)','FontSize',8,'FontName','Times New Roman');
ylabel('Deflection (rad)','FontSize',8,'FontName','Times New Roman')
title('Control effector \delta_3','FontSize',8);
% h2=legend('cmd_3^{d}','u_3^{d}','cmd_3^{s}','u_3^{s}');% ,'cmd_1^{i}','u_1^{i}'
h2=legend('cmd','on','off');
set(h2,'FontName','Times New Roman','FontSize',8,'NumColumns',1,'location','southwest');%northwest

% figure,%
subplot(3,1,2)
plot(time,dca_T_in,'k','Marker','none','MarkerIndices',tt);hold on;
plot(time,dca_T_out,'b--','Marker','o','MarkerIndices',tt);hold on;grid on;
plot(time,wls_T_out_off,'r-.','Marker','x','MarkerIndices',tt);hold on;
xlabel('Time (s)','FontSize',8,'FontName','Times New Roman');
ylabel('Speed difference (rad/s)','FontSize',8,'FontName','Times New Roman');
title('Control effector \delta_9','FontSize',8);
% set(gca,'FontName','Times New Roman');
% h3=legend('cmd_9^{d}','u_9^{d}','cmd_9^{s}','u_9^{s}');% ,'cmd_9^{i}','u_9^{i}'
h3=legend('cmd','on','off');
set(h3,'FontName','Times New Roman','FontSize',8,'NumColumns',3,'location','southeast');

% figure,%
subplot(3,1,3)
plot(time,in_x,'k-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dca_x,'Color','b','LineStyle','--','Marker','o','MarkerIndices',tt);hold on;
plot(time,out_wls_x_off,'Color','r','LineStyle','-.','Marker','x','MarkerIndices',tt);hold on;grid on;
axis([0 3 -10 6.6]);
title('Virtual input','FontSize',8);
xlabel('Time (s)','FontSize',8,'FontName','Times New Roman');
ylabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex','FontSize',8)
h1=legend('cmd','on','off');% ,'Location','EastOutside';,'\tau_{i}'
set(h1,'FontName','Times New Roman','FontSize',8,'NumColumns',3,'location','southeast');

% eval(['print ',num2str(fileName),'mean5.eps -depsc2 -r600'])


% sim('compensate');%一、0.1-8HZ，幅值5.二、阶跃6
% tt=1:30:501;
% time=0:0.01:5;
% in=fin.Data;
% out_off=fout_off.Data;
% out=fout.Data;
% figure,%
% plot(time,in,'k-','Marker','none','MarkerIndices',tt);hold on;
% plot(time,out_off,'r-.','Marker','o','MarkerIndices',tt);hold on;
% plot(time,out,'b--','Marker','^','MarkerIndices',tt);grid on
% % axis([0 3 -1.3 1]);
% 
% xlabel('\itt \rm(s)','FontSize',8,'FontName','Times New Roman');
% ylabel('\itu \rm(rad/s)','FontSize',8,'FontName','Times New Roman')
% h2=legend('cmd','compensate off','compensate on');
% % title('伪控制指令响应曲线','FontSize',8);
% set(h2,'FontName','Times New Roman','FontSize',8,'NumColumns',3,'location','best');%northwest

