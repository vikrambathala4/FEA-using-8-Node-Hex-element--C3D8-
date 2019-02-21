% function to build detivatives of shape functions W.R.T Zeta and Eta.

function [N]=N_Matrix(Zeta,Eta,Gamma)
%Zeta, Eta, Gamma -Natural Coordinates

% Der_SF Column of derivateive of shape functions
Der_SF=zeros(24,1);


% w.r.t to zeta
Der_SF(1)=-(1-Eta)*(1+Gamma)/8;
Der_SF(2)=-(1-Eta)*(1-Gamma)/8;
Der_SF(3)=-(1+Eta)*(1-Gamma)/8;
Der_SF(4)=-(1+Eta)*(1+Gamma)/8;
Der_SF(5)=(1-Eta)*(1+Gamma)/8;
Der_SF(6)=(1-Eta)*(1-Gamma)/8;
Der_SF(7)=(1+Eta)*(1-Gamma)/8;
Der_SF(8)=(1+Eta)*(1+Gamma)/8;
% w.r.t to Eta
Der_SF(9)=-(1-Zeta)*(1+Gamma)/8;
Der_SF(10)=-(1-Zeta)*(1-Gamma)/8;
Der_SF(11)=(1-Zeta)*(1-Gamma)/8;
Der_SF(12)=(1-Zeta)*(1+Gamma)/8;
Der_SF(13)=-(1+Zeta)*(1+Gamma)/8;
Der_SF(14)=-(1+Zeta)*(1-Gamma)/8;
Der_SF(15)=(1+Zeta)*(1-Gamma)/8;
Der_SF(16)=(1+Zeta)*(1+Gamma)/8;
% w.r.t to gamma
Der_SF(17)=(1-Zeta)*(1-Eta)/8;
Der_SF(18)=-(1-Zeta)*(1-Eta)/8;
Der_SF(19)=-(1-Zeta)*(1+Eta)/8;
Der_SF(20)=(1-Zeta)*(1+Eta)/8;
Der_SF(21)=(1+Zeta)*(1-Eta)/8;
Der_SF(22)=-(1+Zeta)*(1-Eta)/8;
Der_SF(23)=-(1+Zeta)*(1+Eta)/8;
Der_SF(24)=(1+Zeta)*(1+Eta)/8;

% Construction of N Matrix
N=zeros(9,24);
k=1;
for i=1:3
 j=1;
 while(j<=24)
   N(i,j)=Der_SF(k);
   k=k+1;
   j=j+3;
 end
end
 
k=1;
for i=4:6
 j=2;
 while(j<=24)
   N(i,j)=Der_SF(k);
   k=k+1;
   j=j+3;
 end
end
 
k=1;
for i=7:9
 j=3;
 while(j<=24)
   N(i,j)=Der_SF(k);
   k=k+1;
   j=j+3;
 end
 end
 
     
end