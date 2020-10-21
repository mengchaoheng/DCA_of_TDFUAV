function [HJFGF_x, HJFGF_n] = HuangJinFenGeFa(a,b,w,B,umin,umax)
    k=0.618;      %(5^(1/2)-1)/2约等于0.618
    c = a + (1-k) * (b-a);
    d = a + k * (b-a);
    n = 0;        %迭代次数统计
    %缩小区间到精度要求
    while norm(a-b) > w
        n = n + 1;
        if out(pinv(B)*c,umin,umax) % 有外
            a = a;
            b = d;
            d = c;
            c = a + (1-k) * (b-a);
        elseif inside(pinv(B)*d,umin,umax) % d全里
            a = c;
            c = d;
            b = b;
            d = a + k * (b-a); 
        else
            a = c;
            b = d;
            c = a + (1-k) * (b-a);
            d = a + k * (b-a);      
        end
    end
    %比较区间端点值大小
%     f1=min(abs(abs(pinv(B)*a)-umax));
%     f2=min(abs(abs(pinv(B)*b)-umax));
%     if f1 < f2    
%         HJFGF_x = a;        
%     else
%         HJFGF_x = b;
%     end
HJFGF_x=(a+b)/2;
    HJFGF_n = n;