function [CTBL,beta] = TBL(ytot,Ctot,Cdelta05,delta,ytwostate)   
   
    delta=round(delta,2);  
      
    fo = fitoptions('Method', 'NonlinearLeastSquares', ...
                     'Lower',[Cdelta05 delta 0], 'Upper',[Cdelta05 delta 5],'StartPoint',[Cdelta05 delta 0.2]);                  
    %here, Cdelta05 [C(delta/2)] and delta are regarded as fixed parameters from measurements
   
    myfittype  = fittype('Cdelta05*(y/(delta-y))^(beta)','dependent',{'C'},'independent',{'y'},...
    'coefficients',{'Cdelta05','delta','beta'},'options',fo);                  
    myfit=fit(ytot,Ctot,myfittype);
    beta=myfit.beta; %determine free parameter beta        
     
    ybelow=ytwostate(ytwostate<=0.5*delta); %Eq. (2.1) for y<=delta/2
    for i=1:1:length(ybelow)
        Cbelow(i)= Cdelta05*(ybelow(i)/(delta-ybelow(i)))^(beta);
    end  
        
    Cdelta05calc=Cbelow(length(ybelow)); %evaluate Cdelta05 to avoid inconsistencies
    
    yabove=ytwostate(ytwostate>0.5*delta); %Eq. (2.1) for y>delta/2
    for i=1:length(yabove)
        Cabove(i)=Cdelta05calc*exp((4*beta)/delta*(yabove(i)-(delta/2)));      
    end    
       
    CTBL=[Cbelow'; Cabove']; %compile final vector  
    
end
