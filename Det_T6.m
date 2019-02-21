function[D]=Det_T6(X1,X2,X3,X4,X5,X6,Y1,Y2,Y3,Y4,Y5,Y6,Xi,Eta)
J=zeros(2);
J(1,1)=(4*Xi*(X1+X2-2*X4))+(4*Eta*(X1-X4+X5-X6))-3*X1-X2+4*X4;
J(1,2)=(4*Xi*(Y1+Y2-2*Y4))+(4*Eta*(Y1-Y4+Y5-Y6))-3*Y1-Y2+4*Y4;
J(2,1)=(4*Xi*(X1-X4+X5-X6))+(4*Eta*(X1+X3-2*X6))-3*X1-X3+4*X6;
J(2,2)=(4*Xi*(Y1-Y4+Y5-Y6))+(4*Eta*(Y1+Y3-2*Y6))-3*Y1-Y3+4*Y6;
D=det(J)