
function [DPHI]=Der_TSF(Xi,S) %derivative shape functions for tracion load
DPHI=zeros(4,12);
if S==1
% First Row
DPHI(1,1)=2*Xi-1;
DPHI(1,3)=2*Xi+1;
DPHI(1,7)=-(4*Xi);
%Second row
%all zeros
% Third row
DPHI(3,2)=2*Xi-1;
DPHI(3,4)=2*Xi+1;
DPHI(3,8)=-(4*Xi);
% Fourth Row
%all zeros
elseif S==2
% First Row;
DPHI(1,3)=2*Xi-1;
DPHI(1,5)=2*Xi+1;
DPHI(1,9)=-(4*Xi);
% Fourth Row
DPHI(3,4)=2*Xi-1;
DPHI(3,6)=2*Xi+1;
DPHI(3,10)=-4*Xi;
else
%Third Row;
DPHI(2,1)=2*Xi+1;
DPHI(2,5)=2*Xi-1;
DPHI(2,11)=-4*Xi;
%Fourth row
DPHI(4,2)=2*Xi+1;
DPHI(4,6)=2*Xi-1;
DPHI(4,12)=-4*Xi;
end  
end