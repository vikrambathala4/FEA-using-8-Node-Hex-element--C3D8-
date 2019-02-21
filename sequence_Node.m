function[Ordered_nodes]=sequence_Node(X,TNum_Nodes)
N=size(X);
x=zeros(N);
if N(1)>1% The number of rows to sequence should be more than one , If there is only one row only then the 'sequence_Node' will return the same row as output.
z=0;
 for i=1:TNum_Nodes
    for j=1:N(1)
     if X(j,1)==i
         z=z+1;
         x(z,:)=X(j,:);
     end
    end   
end
Ordered_nodes=x;
else
    Ordered_nodes=X;
end
    
end