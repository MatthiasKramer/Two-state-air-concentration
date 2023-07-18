function [yxx] = Yxx(C,y,X)

    ind1=find(C<(X/100),1,'last');
    ind2=find(C>(X/100),1);
    yinterp=[y(ind1) y(ind2)];
    Cinterp=[C(ind1) C(ind2)];      
    yxx=interp1(Cinterp,yinterp,(X/100));  
end
