function[GTF]=Traction_load(t,Element_loads,Num_elements,Num_Nodes,Element_data,Nodes_data,TNum_Nodes,Dof)
a=size(Element_loads{1,1});
a=a(1,1);
for e=1:a;
    S=Element_loads{1,2}(e);
    ti=t(Element_loads{1,1}(e));
    T_load=Element_loads{1,3}(e);
    ele=Element_loads{1,1}(e);
 E_Nodes=Element_Nodes(Num_elements,Num_Nodes,Element_data);
[X,Y]=E_Nod_Co(E_Nodes,Num_elements,Num_Nodes,Nodes_data);
Nod_Co=vectorize(X(ele,:)',Y(ele,:)',Num_Nodes);
for n=1:Num_Nodes
[W,Xi]=GQ_integration1(2);
TFX=0;
TFY=0;
 for i=1:2
 TJ=TJacobian(Nod_Co,Xi(i),S);
 [TPHI]=TSF(Xi(i),S);
 FX=W(i)*TPHI(n)*(TJ(1,2)+TJ(2,2));
 FY=W(i)*TPHI(n)*(TJ(1,1)+TJ(2,1));
 TFX=TFX+FX;
 TFY=TFY+FY;
 end
 GFX(n,1)=(1/2)*TFX*ti*T_load;
 GFY(n,1)=(-1/2)*TFY*ti*T_load;
end
Trac_F{e,1}=GFX;
Trac_F{e,2}=GFY;
end
%Global Traction force
GTF=zeros(Dof*TNum_Nodes,1);
for e=1:a
    TF=zeros(Dof*TNum_Nodes,1);
    ele=Element_loads{1,1}(e);
    for n=1:Num_Nodes
        TF(2*E_Nodes(ele,n)-1)=Trac_F{e,1}(n);
        TF(2*E_Nodes(ele,n))=Trac_F{e,2}(n);
    end
    GTF=GTF+TF;
end 
end