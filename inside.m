function [flag]=inside(x,x_min,x_max) % È«Àï
    [m,~]=size(x);
    flag=1;
    for i=1:m
        if x(i)>=x_max(i) || x(i)<=x_min(i)
            flag=0;
            break; 
        end
    end
end