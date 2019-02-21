function [strain,stress]=element_response(Num_elements,.....
                                Num_Nodes,UVW,Element_data,E,Niu,Dof,......
                                       Nodes_data,GQ_Order)
strain=cell(Num_elements,8);
stress=cell(Num_elements,8);
E_Nodes=Element_Nodes(Num_elements,Num_Nodes,Element_data);
[X,Y,Z]=E_Nod_Co(E_Nodes,Num_elements,Num_Nodes,Nodes_data);
for e=1:Num_elements
Nod_Co=vectorize(X(e,:)',Y(e,:)',Z(e,:)',Num_Nodes);
n=0;
for j=1:3:Dof*Num_Nodes
    n=n+1;
    E_UVW(j,1)=UVW(3*E_Nodes(e,n)-2);
    E_UVW(j+1,1)=UVW(3*E_Nodes(e,n)-1);
    E_UVW(j+2,1)=UVW(3*E_Nodes(e,n));
end
%K=zeros(Dof*Num_Nodes);
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
 strain{e,i}=B*E_UVW;
 stress{e,i}=D*strain{e,i}; 
 end
end    
end