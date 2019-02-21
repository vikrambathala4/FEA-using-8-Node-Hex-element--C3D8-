function[F]=construct_F(Nodal_loads,TNum_Nodes,Dof)
A=size(Nodal_loads);
A=A(1);
F=zeros(Dof*TNum_Nodes,1);
Temp=zeros(TNum_Nodes,1);
%Delta_T=zeros(Num_elements,GQ_pints);
for i=1:A
    F((2*Nodal_loads(i,1))+(Nodal_loads(i,1)-2),1)=Nodal_loads(i,2);
    F((2*Nodal_loads(i,1))+(Nodal_loads(i,1)-1),1)=Nodal_loads(i,3);
    F((2*Nodal_loads(i,1))+(Nodal_loads(i,1)),1)=Nodal_loads(i,4);
    Temp(Nodal_loads(i,1))=Nodal_loads(i,5);
end
% for i=1:Num_elements
%     for n=1:GQ_pints
%         [W,x,y]=GQ_integration(GQ_pints);
%         Delta_T(i,n)=   (Temp(Element_data(i,2))*(1-x(n)-y(n))*(1-2*x(n)-2*y(n))+.....
%                    Temp(Element_data(i,3))*x(n)*(2*x(n)-1)+........
%                    Temp(Element_data(i,4))*y(n)*(2*y(n)-1)+.......
%                    Temp(Element_data(i,5))*4*x(n)*(1-x(n)-y(n))+.......
%                    Temp(Element_data(i,6))*4*x(n)*y(n)+.......
%                    Temp(Element_data(i,7))*4*y(n)*(1-x(n)-y(n)));
%     end
% end
end
