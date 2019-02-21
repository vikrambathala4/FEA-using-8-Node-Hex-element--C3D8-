function[UVW,U,V,W]=Nodal_response(d,TNum_Nodes,Nodal_fixity,Dof,Nodal_fixity_status)
UVW=zeros(Dof*TNum_Nodes,1);
U=zeros(TNum_Nodes,1);
V=zeros(TNum_Nodes,1);
W=zeros(TNum_Nodes,1);
A=size(Nodal_fixity);
A=A(1);
X=[];
Add=zeros(Dof*TNum_Nodes,1);
for n=1:A
    if strcmp(Nodal_fixity_status(n,1),'known')
        X=[X,((2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-2))];
     if Nodal_fixity(n,2)~=0
         Add(((2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-2)),1)=Nodal_fixity(n,2);
     end
    end
    if strcmp(Nodal_fixity_status(n,2),'known')
        X=[X,((2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-1))];
       if Nodal_fixity(n,3)~=0
           Add(((2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-1)),1)=Nodal_fixity(n,3);
       end
    end
    if strcmp(Nodal_fixity_status(n,3),'known')
        X=[X,((2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)))];
       if Nodal_fixity(n,4)~=0
           Add(((2*Nodal_fixity(n,1))+(Nodal_fixity(n,1))),1)=Nodal_fixity(n,4);
       end
    end
           
end
 r=size(X,2);
 j=0;
 v=0;
X=sort(X,'ascend');
 for i=1:Dof*TNum_Nodes
         m=0;
     for k=1:r
         if X(k)==i
             UVW(i)=0;
             m=1;
             v=0;
           break
         else 
             v=1;
         end
     end
     j=j+v;
     if m==0
      UVW(i)=d(j);
     end
 end
 UVW=UVW+Add;
% calculating seperate vectors for U an V
z=0;
for k=1:3:Dof*TNum_Nodes
    z=z+1;
    U(z)=UVW(k);
    V(z)=UVW(k+1);
    W(z)=UVW(k+2);
end

end