function [deq,Cmean] = Deq(C,y,y90)
   
    y=y(y<y90);
    C=C(y<y90);
    C(length(y)+1)=0.9;
    y(length(y)+1)=y90;
    
    Cmean = trapz(y,C)/y90;
    deq=(1-Cmean)*y90;    
   
end
