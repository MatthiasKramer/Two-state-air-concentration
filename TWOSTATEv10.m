%%Two-state air concentration  
%Version 1.0 (June 2023)
%developed by M. Kramer
%works with MATLAB 2017a 
%contact: 
%m.kramer@adfa.edu.au


%when using this code, please cite/refer to the following reference:
%--------------------------------------------------------------------------%
%M. Kramer and D. Valero (2023)
%Linking turbulent waves and bubble diffusion in self-aerated open-channel flows:
%two-state air concentration
%Journal of Fluid Mechanics, vol. 966, A37
%--------------------------------------------------------------------------%

%% Data reading 
clear all
close all
SIZE=15;

%corresponds to data of Fig. 3 in Kramer and Valero (2023)
file = dir('*.mat');  
nfile = size(file,1);

Cmeanlim=0.2; %only use two-state convolution for Cmean> (0.2 to 0.25)

%% Loop over measurements
for k=1:1:nfile
    
    load(file(k).name); %load each measurements, includes Ctot = total conveyed air concentration and ytot = corresponding elevation
       
    %air water flow key parameters
    y90tot(k)=Yxx(Ctot,ytot,90); %characteristic flow depth y90
    [~,Cmeantot(k)]=Deq(Ctot,ytot,y90tot(k)); %Cmean
    ymax=2*y90tot(k); yplot=0:0.5:ymax; %define y-values for plotting    
        
       
    if Cmeantot(k)>Cmeanlim %two-state convolution                  
            
        %interface position      
        cstar(k)=1.3716*Cmeantot(k)-0.1414; %compare Fig. 4d; interface position/transition point may NOT work for other profiles, please adjust
        indstar(k)=find((Ctot-cstar(k))<0,1,'last'); %find corresponding index to mean interface position
        ystar(k)=ytot(indstar(k)); %compute absolute ystar from index
   
        
        %boundary layer thickness
        delta(k)=1.75*ystar(k); %if no velocity measuremnents given, assume delta = (1.1 to 1.75)*ystar
        delta05(k)=delta(k)/2; %find delta/2 for TBL
        inddelta05(k)=find((ytot-delta05(k))<0,1,'last'); %corresponding index for delta/2
        Cdelta05(k)=Ctot(inddelta05(k)); %C(delta/2)
        
        
        %two-state convolution              
        overlap=3; %parameter used to determine number of points away from delta05 and ystar for fitting
        %TBL air concentration [Eq. (2.1)]
        [CTBL{k},beta(k)]=TBL(ytot(1:inddelta05(k)+overlap),Ctot(1:inddelta05(k)+overlap),Ctot(inddelta05(k)),delta(k),yplot);     
        
        %TWL air concentration [Eq. (2.2)]
        [CTWL{k},H(k),y50TWL(k)]=TWL(ytot(indstar(k)-overlap:end),Ctot(indstar(k)-overlap:end),Cmeantot(k),y90tot(k),yplot);                         
        
        sigmastar(k)=0.15*delta(k); %use sigmastar = (0.1 to 0.2)*delta, compare Table 1      
        Gamma=normcdf(yplot,ystar(k),sigmastar(k)); %compute Gamma [Eq. (2.9)]       
              
        %evaluate air concentration
        for i=1:1:length(yplot)
            Ctwostate{k}(i)= CTBL{k}(i)*(1-Gamma(i)) + CTWL{k}(i)*Gamma(i); %Eq. (2.8)
        end             
        
        
        %plot                          
        fig=figure(k);
        scatter(Ctot,ytot./y90tot(k),'MarkerFaceColor','k','MarkerEdgeColor','none','linewidth',1); hold on
        scatter(Ctot(indstar(k)),ytot(indstar(k))./y90tot(k),'MarkerFaceColor','r','MarkerEdgeColor','black','linewidth',1); hold on 
        plot(CTBL{k},yplot./y90tot(k),'-','Color',[0 1 1 0.5],'linewidth',1.5); hold on
        plot(CTWL{k},yplot./y90tot(k),'-','Color',[0.2 0.5 0.9 0.5],'linewidth',1.5); hold on
        plot(Ctwostate{k},yplot./y90tot(k),'-r','linewidth',2); hold on           
        box on
        grid on;
        xlabel('$\overline{c}$','Interpreter', 'latex','FontSize',SIZE)
        ylabel('$y/y_{90}$','Interpreter', 'latex','FontSize',SIZE)
        xlim([0 1]);
        ylim([0 2]);                      
    
        clear Ctot ytot Gamma ytwostate 
    
    else %use TWL only         
                     
        %TWL air concentration [Eq. (2.2)]
        [CTWL{k},H(k),y50TWL(k)]=TWL(ytot,Ctot,Cmeantot(k),y90tot(k),yplot); 
        
        %plot                          
        fig=figure(k);
        scatter(Ctot,ytot./y90tot(k),'MarkerFaceColor','k','MarkerEdgeColor','none','linewidth',1); hold on
        scatter(0.5,y50TWL(k)./y90tot(k),'MarkerFaceColor','r','MarkerEdgeColor','black','linewidth',1); hold on 
        plot(CTWL{k},yplot./y90tot(k),'-b','linewidth',2); hold on
        box on
        grid on;
        xlabel('$\overline{c}$','Interpreter', 'latex','FontSize',SIZE)
        ylabel('$y/y_{90}$','Interpreter', 'latex','FontSize',SIZE)
        xlim([0 1]);
        ylim([0 2]);    
        
        clear Ctot ytot ytwostate 
    end
end


