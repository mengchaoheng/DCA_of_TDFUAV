P = [3 1; 1 4]; 
r = 5;
[V, D] = eig(P);     % 求特征值，将椭圆化为标准方程
a = sqrt(r/D(1));    % 椭圆长半轴
b = sqrt(r/D(4));    % 椭圆短半轴
t = linspace(0, 2*pi, 60);    % 等间隔产生一个从0到2pi的包含60个元素的向量
xy = V*[a*cos(t); b*sin(t)];  % 根据椭圆的极坐标方程计算椭圆上点的坐标
plot(xy(1,:),xy(2,:), 'k', 'linewidth', 3);    % 绘制椭圆曲线，线宽为3，颜色为黑色

% 在当前图形窗口加入带箭头的文本标注框
h = annotation('textarrow',[0.5 0.7],[0.5 0.7]);
% 设置文本标注框中显示的字符串，并设字号为15
set(h, 'string','d1' , 'fontsize', 15);
annotation('doublearrow',[0.2 0.8],[0.85 0.85],...
'LineStyle','-','color',[1 0 0],'HeadStyle','cback3');