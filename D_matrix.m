function [D]=D_matrix(E,Niu)
D=((E/((1-2*Niu)*(1+Niu)))*[(1-Niu) Niu   Niu   0       0       0;......
                          Niu   (1-Niu) Niu   0       0       0;.......
                          Niu   Niu   (1-Niu) 0       0       0;......
                          0     0     0     0.5-Niu 0       0;.....
                          0     0     0     0       0.5-Niu 0;.....
                          0     0     0     0       0       0.5-Niu]);
end