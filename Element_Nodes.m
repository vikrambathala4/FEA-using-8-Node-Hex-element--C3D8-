function[E_Nodes]=Element_Nodes(Num_elements,Num_Nodes,Element_data)
 E_Nodes=zeros(Num_elements,Num_Nodes);
for i=1:Num_elements
    E_Nodes(i,1:Num_Nodes)=Element_data(i,2:9);
end