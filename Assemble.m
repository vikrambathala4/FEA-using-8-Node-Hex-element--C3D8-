% Assembly of stifness matrix
%E_nodes=Nodes of the particular element;
%TNum_Nodes=9
function[GK]=Assemble(TNum_Nodes,Dof,Num_elements,EK,Num_Nodes,Element_data)
GK=zeros(Dof*TNum_Nodes);% GK= global stifness matrix after assembly
E_Nodes=Element_Nodes(Num_elements,Num_Nodes,Element_data);
for e=1:Num_elements
IE_Nodes=E_Nodes(e,:);% Independent element nodes
dummy1=[];
AK=zeros(Dof*TNum_Nodes);% Stifness Matrix ready for assemble
for i=IE_Nodes(1:Num_Nodes)
    dummy=[(2*i)+(i-2),(2*i)+(i-1),(2*i+i)];
    dummy1=[dummy1,dummy];
end
l=0;
for j=dummy1(1:Dof*Num_Nodes)
            l=l+1;
            m=0;
 for k=dummy1(1:Dof*Num_Nodes)
                m=m+1;
                 AK(j,k)=EK{e}(l,m);
 end
end
GK=GK+AK;
end

end