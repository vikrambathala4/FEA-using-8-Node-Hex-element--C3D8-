% calculats the X and Y vectors of co codinates for nodes in the given
% element
%E_Nod_Co= Nodal Coordinates for individual element
function[X,Y,Z]=E_Nod_Co(E_Nodes,Num_elements,Num_Nodes,Nodes_data)
X=zeros(Num_elements,Num_Nodes);
Y=zeros(Num_elements,Num_Nodes);
Z=zeros(Num_elements,Num_Nodes);
for i=1:Num_elements
    for j=1:Num_Nodes
    X(i,j)=Nodes_data(E_Nodes(i,j),2);
    Y(i,j)=Nodes_data(E_Nodes(i,j),3);
    Z(i,j)=Nodes_data(E_Nodes(i,j),4);
    end
end