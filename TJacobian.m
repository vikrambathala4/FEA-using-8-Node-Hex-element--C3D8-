function [TJ]=TJacobian(Nod_Co,Xi,S)
j=Der_TSF(Xi,S)*Nod_Co;% Detivative of x W.R.T Shape functions.
TJ(1,1)=j(1);
TJ(1,2)=j(3);
TJ(2,1)=j(2);
TJ(2,2)=j(4);
end