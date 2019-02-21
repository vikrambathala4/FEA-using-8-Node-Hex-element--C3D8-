%%K=B'*D*B*det(J)
%%B=[1 0 0 0;0 0 0 1;0 1 1 0]*inv([J(1,1) J(1,2) 0 0;J(2,1) J(2,2) 0 0;0 0 J(1,1) J(1,2);0 0 J(2,1) J(2,2)])*Der_SF
% considering D*detJ=T
% GQ_pints=Number of gauss quadrature points used for integration.
function[EK]=Element_Stifness(Num_elements,Num_Nodes,Element_data,....
                            Nodes_data,Dof,GQ_Order,E,Niu)
EK=cell(1,Num_elements);
E_Nodes=Element_Nodes(Num_elements,Num_Nodes,Element_data);
[X,Y,Z]=E_Nod_Co(E_Nodes,Num_elements,Num_Nodes,Nodes_data);
for e=1:Num_elements
Nod_Co=vectorize(X(e,:)',Y(e,:)',Z(e,:)',Num_Nodes);
K=zeros(Dof*Num_Nodes);
[Num_GQ_Points,W,Zeta,Eta,Gamma]=GQ_integration(GQ_Order);
D=D_matrix(E(e,1),Niu(e,1));
for i=1:Num_GQ_Points
 N=N_Matrix(Zeta(i),Eta(i),Gamma(i));
 J=Jacobian(Nod_Co,N);
 IJ=inv(J);
 % Construct O Matirx
 O=zeros(6,9);
 O(1,1)=IJ(1,1); O(1,2)=IJ(1,2); O(1,3)=IJ(1,3);%First Row
 O(2,4)=IJ(2,1); O(2,5)=IJ(2,2); O(2,6)=IJ(2,3);%Second Row
 O(3,7)=IJ(3,1); O(3,8)=IJ(3,2); O(3,9)=IJ(3,3);%Third Row
 %Fourth Row
 O(4,1)=IJ(2,1); O(4,2)=IJ(2,2); O(4,3)=IJ(2,3);
 O(4,4)=IJ(1,1); O(4,5)=IJ(1,2); O(4,6)=IJ(1,3);
 %Fifith Row
 O(5,4)=IJ(3,1); O(5,5)=IJ(3,2); O(5,6)=IJ(3,3);
 O(5,7)=IJ(2,1); O(5,8)=IJ(2,2); O(5,9)=IJ(2,3);
 %Sixth Row
 O(6,1)=IJ(3,1); O(6,2)=IJ(3,2); O(6,3)=IJ(3,3);
 O(6,7)=IJ(1,1); O(6,8)=IJ(1,2); O(6,9)=IJ(1,3);

B=O*N;
T=D*det(J)*W(i);
K=K+(B'*T*B);
end
EK{e}=K;% EK=Final stifness matrix
end
end
        