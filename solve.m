function[d]=solve(GK,F,Nodal_fixity,Nodal_fixity_status)
A=size(Nodal_fixity);
A=A(1);
X=[];
All_F=F;
for n=1:A
    if strcmp(Nodal_fixity_status(n,1),'known')
    if Nodal_fixity(n,2)==0
         X=[X,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-2)];
    else
        X=[X,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-2)];
        mu=Nodal_fixity(n,2);
        mu=double(mu);
        All_F=(All_F)-(GK(:,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-2)).*mu);
    end
    end
    if strcmp(Nodal_fixity_status(n,2),'known')
       if Nodal_fixity(n,3)==0
           X=[X,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-1)];
       else
           X=[X,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-1)];
           nu=Nodal_fixity(n,3);
           nu=double(nu);
          All_F=(All_F)-(GK(:,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1)-1)).*nu); 
       end
    end
    if strcmp(Nodal_fixity_status(n,3),'known')
       if Nodal_fixity(n,4)==0
           X=[X,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1))];
       else
           X=[X,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1))];
           rho=Nodal_fixity(n,4);
           rho=double(rho);
          All_F=(All_F)-(GK(:,(2*Nodal_fixity(n,1))+(Nodal_fixity(n,1))).*rho); 
       end
    end
end
GK(X,:)=[];% deteling rows
GK(:,X)=[];% deleting columns
All_F(X)=[];% deleting rows  
%d=GK\All_F;
[L,U,P] = lu(GK);
y = L\(P*All_F);
d = U\y;
 %[~,~,~,d]=SymmetricBandedCholesky(GK,All_F);
end