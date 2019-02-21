function [PHI]=TSF(Xi,S) % shape functions for tracion load
PHI=zeros(6,1);
% PHI(1,1)=(1/2)*(1-Xi);
% PHI(2,1)=(1/2)*(1+Xi);
if S==1
PHI(1,1)=(-Xi/2)*(1-Xi);
PHI(2,1)=(Xi/2)*(1+Xi);
PHI(4,1)=(1+Xi)*(1-Xi);
elseif S==2
PHI(2,1)=(-Xi/2)*(1-Xi);
PHI(3,1)=(Xi/2)*(Xi+1);
PHI(5,1)=(Xi+1)*(1-Xi);
else
PHI(1,1)=(Xi/2)*(1+Xi);
PHI(3,1)=(-Xi/2)*(1-Xi);
PHI(6,1)=(1+Xi)*(1-Xi);
end  
end