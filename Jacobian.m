function [J]=Jacobian(Nod_Co,N)
j=N*Nod_Co;% Detivative of x W.R.T Shape functions.
J(1,1)=j(1);
J(2,1)=j(2);
J(3,1)=j(3);
J(1,2)=j(4);
J(2,2)=j(5);
J(3,2)=j(6);
J(1,3)=j(7);
J(2,3)=j(8);
J(3,3)=j(9);
end