function[A_error,R_error,position,Rx,Ry,Rz,fixity_size]=Err(F,GK,UVW,Nodal_fixity,Nodal_fixity_status)
All_F=F;
Residual=(GK*UVW)-All_F;
A=size(Nodal_fixity);
A=A(1);
fixity_size=A;
position=zeros(A,1);
X=[];
c=1;
d=1;
e=1;
for n=1:A
    if strcmp(Nodal_fixity_status(n,1),'known')
            Rx(c,1)= Residual((3*Nodal_fixity(n,1))-2,1);
            Residual((3*Nodal_fixity(n,1))-2,1)=0;
            c=c+1;
    else
        Rx(c)=0;
        c=c+1;
    end
    if strcmp(Nodal_fixity_status(n,2),'known')
           Ry(d,1)= Residual((3*Nodal_fixity(n,1))-1,1);
           Residual((3*Nodal_fixity(n,1))-1,1)=0;
           d=d+1;
    else
        Ry(d)=0;
        d=d+1;
    end
    if strcmp(Nodal_fixity_status(n,3),'known')
           Rz(d,1)= Residual((3*Nodal_fixity(n,1)),1);
           Residual((3*Nodal_fixity(n,1)),1)=0;
           e=e+1;
    else
        Rz(d)=0;
        e=e+1;
    end
     position(n,1)=Nodal_fixity(n,1);
end
A_error=norm(Residual);
if(norm(All_F)~=0)
R_error=norm(Residual)/norm(All_F);
else
   R_error=0;
end
end