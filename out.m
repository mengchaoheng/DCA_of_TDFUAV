function [flag]=out(x,x_min,x_max) % гаЭт
    [m,~]=size(x);
    flag=0;
    for i=1:m
        if x(i)>x_max(i) || x(i)<x_min(i)
            flag=1;
            break; 
        end
    end
end