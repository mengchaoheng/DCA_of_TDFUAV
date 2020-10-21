function [ idx ] = binarysearch( t ,B,umax)
e=0.001;
a=[0;0;0];b=t;
%µü´ú·¨
while(1)
    iup=a+0.618*(b-a);ilow=a+(1-0.618)*(b-a);
    f1=min(abs(abs(pinv(B)*ilow)-umax));
    f2=min(abs(abs(pinv(B)*iup)-umax));
    if( f1<f2 )   
         b = iup;
    else
          a = ilow;
    end
    if f1<e && f2<e
        idx=( iup + ilow ) / 2;
        disp(idx);
        break;
    end
end
end