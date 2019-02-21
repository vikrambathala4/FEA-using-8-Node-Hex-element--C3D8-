function[w]=LinearBrickElementStiffness(E,NU,x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,.....
                                       x5,y5,z5,x6,y6,z6,x7,y7,z7,x8,y8,z8)
% LinearBrickElementStiffness This function returns the element
% stiffness matrix for a linear brick
% element with modulus of elasticity
% E, Poisson’s ratio NU, coordinates of
% node 1 (x1,y1,z1), coordinates
% of node 2 (x2,y2,z2), coordinates of
% node 3 (x3,y3,z3), coordinates of
% node 4 (x4,y4,z4), coordinates of
% node 5 (x5,y5,z5), coordinates of
% node 6 (x6,y6,z6), coordinates of
% node 7 (x7,y7,z7), and coordinates
% of node 8 (x8,y8,z8).
% The size of the element
% stiffness matrix is 24 x 24.
syms s t u;
N1 = (1-s)*(1-t)*(1+u)/8;
N2 = (1-s)*(1-t)*(1-u)/8;
N3 = (1-s)*(1+t)*(1-u)/8;
N4 = (1-s)*(1+t)*(1+u)/8;
N5 = (1+s)*(1-t)*(1+u)/8;
N6 = (1+s)*(1-t)*(1-u)/8;
N7 = (1+s)*(1+t)*(1-u)/8;
N8 = (1+s)*(1+t)*(1+u)/8;
x = N1*x1 + N2*x2 + N3*x3 + N4*x4 + N5*x5 + N6*x6 + N7*x7 + N8*x8;
y = N1*y1 + N2*y2 + N3*y3 + N4*y4 + N5*y5 + N6*y6 + N7*y7 + N8*y8;
z = N1*z1 + N2*z2 + N3*z3 + N4*z4 + N5*z5 + N6*z6 + N7*z7 + N8*z8;
xs = diff(x,s);
xt = diff(x,t);
xu = diff(x,u);
ys = diff(y,s);
yt = diff(y,t);
yu = diff(y,u);
zs = diff(z,s);
zt = diff(z,t);
zu = diff(z,u);
J = xs*(yt*zu - zt*yu) - ys*(xt*zu - zt*xu) + zs*(xt*yu - yt*xu);
N1s = diff(N1,s);
N2s = diff(N2,s);
N3s = diff(N3,s);
N4s = diff(N4,s);
N5s = diff(N5,s);
N6s = diff(N6,s);
N7s = diff(N7,s);
N8s = diff(N8,s);
N1t = diff(N1,t);
N2t = diff(N2,t);
N3t = diff(N3,t);
N4t = diff(N4,t);
N5t = diff(N5,t);
N6t = diff(N6,t);
N7t = diff(N7,t);
N8t = diff(N8,t);
N1u = diff(N1,u);
N2u = diff(N2,u);
N3u = diff(N3,u);
N4u = diff(N4,u);
N5u = diff(N5,u);
N6u = diff(N6,u);
N7u = diff(N7,u);
N8u = diff(N8,u);
% The expressions below are not divided by J - they are adjusted for
% in the calculation of BD matrix below.
N1x = N1s*(yt*zu - zt*yu) - ys*(N1t*zu - zt*N1u) + zs*(N1t*yu - yt*N1u);
N2x = N2s*(yt*zu - zt*yu) - ys*(N2t*zu - zt*N2u) + zs*(N2t*yu - yt*N2u);
N3x = N3s*(yt*zu - zt*yu) - ys*(N3t*zu - zt*N3u) + zs*(N3t*yu - yt*N3u);
N4x = N4s*(yt*zu - zt*yu) - ys*(N4t*zu - zt*N4u) + zs*(N4t*yu - yt*N4u);
N5x = N5s*(yt*zu - zt*yu) - ys*(N5t*zu - zt*N5u) + zs*(N5t*yu - yt*N5u);
N6x = N6s*(yt*zu - zt*yu) - ys*(N6t*zu - zt*N6u) + zs*(N6t*yu - yt*N6u);
N7x = N7s*(yt*zu - zt*yu) - ys*(N7t*zu - zt*N7u) + zs*(N7t*yu - yt*N7u);
N8x = N8s*(yt*zu - zt*yu) - ys*(N8t*zu - zt*N8u) + zs*(N8t*yu - yt*N8u);
N1y = xs*(N1t*zu - zt*N1u) - N1s*(xt*zu - zt*xu) + zs*(xt*N1u - N1t*xu);
N2y = xs*(N2t*zu - zt*N2u) - N2s*(xt*zu - zt*xu) + zs*(xt*N2u - N2t*xu);
N3y = xs*(N3t*zu - zt*N3u) - N3s*(xt*zu - zt*xu) + zs*(xt*N3u - N3t*xu);
N4y = xs*(N4t*zu - zt*N4u) - N4s*(xt*zu - zt*xu) + zs*(xt*N4u - N4t*xu);
N5y = xs*(N5t*zu - zt*N5u) - N5s*(xt*zu - zt*xu) + zs*(xt*N5u - N5t*xu);
N6y = xs*(N6t*zu - zt*N6u) - N6s*(xt*zu - zt*xu) + zs*(xt*N6u - N6t*xu);
N7y = xs*(N7t*zu - zt*N7u) - N7s*(xt*zu - zt*xu) + zs*(xt*N7u - N7t*xu);
N8y = xs*(N8t*zu - zt*N8u) - N8s*(xt*zu - zt*xu) + zs*(xt*N8u - N8t*xu);
N1z = xs*(yt*N1u - N1t*yu) - ys*(xt*N1u - N1t*xu) + N1s*(xt*yu - yt*xu);
N2z = xs*(yt*N2u - N2t*yu) - ys*(xt*N2u - N2t*xu) + N2s*(xt*yu - yt*xu);
N3z = xs*(yt*N3u - N3t*yu) - ys*(xt*N3u - N3t*xu) + N3s*(xt*yu - yt*xu);
N4z = xs*(yt*N4u - N4t*yu) - ys*(xt*N4u - N4t*xu) + N4s*(xt*yu - yt*xu);
N5z = xs*(yt*N5u - N5t*yu) - ys*(xt*N5u - N5t*xu) + N5s*(xt*yu - yt*xu);
N6z = xs*(yt*N6u - N6t*yu) - ys*(xt*N6u - N6t*xu) + N6s*(xt*yu - yt*xu);
N7z = xs*(yt*N7u - N7t*yu) - ys*(xt*N7u - N7t*xu) + N7s*(xt*yu - yt*xu);
N8z = xs*(yt*N8u - N8t*yu) - ys*(xt*N8u - N8t*xu) + N8s*(xt*yu - yt*xu);
% Next, the B matrix is calculated explicitly as follows:
B = [N1x N2x N3x N4x N5x N6x N7x N8x 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 N1y N2y N3y N4y N5y N6y N7y N8y 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 N1z N2z N3z N4z N5z N6z N7z N8z ;
N1y N2y N3y N4y N5y N6y N7y N8y N1x N2x N3x N4x N5x N6x N7x N8x 0 0 0.........
0 0 0 0 0 ;
0 0 0 0 0 0 0 0 N1z N2z N3z N4z N5z N6z N7z N8z N1y N2y N3y N4y N5y.............
N6y N7y N8y ;
N1z N2z N3z N4z N5z N6z N7z N8z 0 0 0 0 0 0 0 0 N1x N2x N3x N4x N5x..........
N6x N7x N8x];
Bnew = simplify(B);
Jnew = simplify(J);
D = (E/((1+NU)*(1-2*NU)))*[1-NU NU NU 0 0 0 ; NU 1-NU NU 0 0 0 ; NU NU.......
1-NU 0 0 0 ;
0 0 0 (1-2*NU)/2 0 0 ; 0 0 0 0 (1-2*NU)/2 0 ; 0 0 0 0 0 (1-2*NU)/2];
BD = transpose(Bnew)*D*Bnew/Jnew;
r = int(int(int(BD, u, -1, 1), t, -1, 1), s, -1, 1);
w = double(r);
end