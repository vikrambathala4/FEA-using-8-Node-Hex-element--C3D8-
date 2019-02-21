%%K=B'*D*B*det(J)
%%B=[1 0 0 0;0 0 0 1;0 1 1 0]*inv([J(1,1) J(1,2) 0 0;J(2,1) J(2,2) 0 0;0 0 J(1,1) J(1,2);0 0 J(2,1) J(2,2)])*Der_SF
% considering D*detJ=T
% GQ_pints=Number of gauss quadrature points used for integration.
function[Total_Thermal_F]=ThermalF(Num_elements,Num_Nodes,TNum_Nodes,Element_data,....
                            Nodes_data,Dof,problem_state,GQ_pints,E,Niu,t,Alp,Delta_T)
E_Nodes=Element_Nodes(Num_elements,Num_Nodes,Element_data);
[X,Y]=E_Nod_Co(E_Nodes,Num_elements,Num_Nodes,Nodes_data);
Thermal_F=cell(1,Num_elements);
for e=1:Num_elements
TF=0;
Nod_Co=vectorize(X(e,:)',Y(e,:)',Num_Nodes);
[W,Xi,Eta]=GQ_integration(GQ_pints);
D=D_matrix(E(e,1),Niu(e,1),problem_state);
for i=1:GQ_pints
 J=Jacobian(Nod_Co,Xi(i),Eta(i));
 GJ=[J(1,1) J(1,2) 0 0;J(2,1) J(2,2) 0 0;0 0 J(1,1) J(1,2);0 0 J(2,1) J(2,2)];   
 B=[1 0 0 0;0 0 0 1;0 1 1 0]*(GJ\Der_SF(Xi(i),Eta(i)));
 epsi=Alp(1)*Delta_T(e,i)*[1;1;0];
 T_F=W(i)*B'*D*epsi*det(Jacobian(Nod_Co,Xi(i),Eta(i)))*t(e,1);
 TF=TF+T_F;
end
Thermal_F{e}=TF/2;
end
Total_Thermal_F=zeros(Dof*TNum_Nodes,1);
for e=1:Num_elements
    m=1;
    Ter_F=zeros(Dof*TNum_Nodes,1);
    for n=1:2:Dof*Num_Nodes
        Ter_F(2*E_Nodes(e,m)-1,1)=Thermal_F{e}(n);
        Ter_F(2*E_Nodes(e,m),1)=Thermal_F{e}(n+1);
        m=m+1;
    end
    G_thermal_F{1,e}=Ter_F;
    Total_Thermal_F=Total_Thermal_F+Ter_F;
end

end
        