for i=1:Num_elements
    for j=1:GQ_pint
        X(j)=stress{i,j}(1)
        Y(j)=stress{i,j}(2)
        XY(j)=stress{i,j}(3)
    end
    Max_X(i)=max(X);
    Max_Y(i)=max(Y);
    Max_XY(i)=max(XY);
end
% XSMa= Maximum stress in X direction, XEMa-element at which stress it is maximum
% XSMi=Minimum stress in Y direction,XEMi-element at which it is maximum
[X_SMa,X_EMa]=max(Max_X);
[X_SMi,X_NMi]=min(Max_X);
% For stress in Y direction
[Y_SMa,Y_EMa]=max(Max_Y);
[Y_SMi,Y_NMi]=min(Max_Y);
% For stress in XYdirection
[XY_SMa,XY_EMa]=max(Max_X);
[XY_SMi,XY_NMi]=min(Max_X);
Stress_Max_min=[X_EMa X_SMa X_NMi X_SMi;....
                Y_EMa Y_SMa Y_NMi Y_SMi;....
                XY_EMa XY_SMa XY_NMi XY_SMi];
    