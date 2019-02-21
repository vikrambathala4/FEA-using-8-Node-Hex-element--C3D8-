% for creating the Single vector with Co_ordinates 
%Nod_Co is a vector with x and y values alternately in a single vector
function[Nod_Co]=vectorize(X,Y,Z,Num_Nodes)
Nod_Co=[];
for i=1:Num_Nodes
    Nod_Co=[Nod_Co;X(i);Y(i);Z(i)];
end
end
    
