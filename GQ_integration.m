function[Num_GQ_Points,W,Zeta,Eta,Gamma]=GQ_integration(GQ_Order)
if GQ_Order==1
    W(1)=2;
    Zeta(1)=0;
    Eta(1)=0;
    Gamma(1)=0;
    Num_GQ_Points=1;
elseif GQ_Order==2
    W=ones(8,1);
    Zeta=zeros(8,1);
    Eta=zeros(8,1);
    Gamma=zeros(8,1);
    G=(1/sqrt(3));
    Zeta(1)=-G; Eta(1)=-G; Gamma(1)=-G; 
    Zeta(2)=G;  Eta(2)=-G; Gamma(2)=-G;
    Zeta(3)=G;  Eta(3)=G;  Gamma(3)=-G;
    Zeta(4)=-G; Eta(4)=G;  Gamma(4)=-G;
    Zeta(5)=-G; Eta(5)=-G; Gamma(5)=G;
    Zeta(6)=G;  Eta(6)=-G; Gamma(6)=G;
    Zeta(7)=G;  Eta(7)=G;  Gamma(7)=G;
    Zeta(8)=-G; Eta(8)=G;  Gamma(8)=G;
    Num_GQ_Points=8;

else
    disp('Gauss Order out of range')
end
    
    