function [CTWL,H,y50TWL] = TWL(ytot,Ctot,Cmean,y90tot,ytwostate)
   
    fo = fitoptions('Method', 'NonlinearLeastSquares', ...
                     'Lower',[-inf -inf], 'Upper',[inf inf],'StartPoint',[0.7*Cmean*y90tot (1-0.9*Cmean)*y90tot]);
    %here, H and y50 are both regarded as free parameters; 
    %use start points from correlation in Fig. 5 (Kramer and Valero, 2023)
                 
    myfittype  = fittype('0.5*(1+erf((y-y50TWL)/(H*sqrt(2))))','dependent',{'C'},'independent',{'y'},...
    'coefficients',{'H','y50TWL'},'options',fo);                  
    myfit = fit(ytot,Ctot,myfittype);
    H=myfit.H; %determine free parameter H
    y50TWL=myfit.y50TWL; %determine free parameter y50
    
    
    for i=1:1:length(ytwostate)
        CTWL(i)=0.5*(1+erf((ytwostate(i)-y50TWL)/((H*sqrt(2))))); %Eq. (2.2)
    end    
    
end
