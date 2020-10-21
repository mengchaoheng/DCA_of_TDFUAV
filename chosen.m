function [y,flag]=chosen(x,x_min,x_max)
    [m,~]=size(x);
    flag=1;
    y=zeros(m,1);
    for i=1:m
        if x(i)>x_max(i)
            flag=0;
            break;        
        elseif x(i)<x_min(i)
            flag=0;
            break;        
        else
            y(i)=x(i);
        end
    end
end