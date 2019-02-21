function [L,C,B,x]=SymmetricBandedCholesky(A,q)
% This function solves a linear system Ax=q where A is symmetric and banded
% Procedure: The initial system is Ax=q, where A is symmetric and banded.
% To optimize computer memory, only the nonzero diagonals of A are stored.
% Thereafter, banded Cholesky decomposition is performed only on the stored
% nonzero main diagonal and superdiagonals to get banded lower traingualar matrix stored 
% in compact mode B. Next, the compact mode is unpacked into banded lower
% traingular matrix and then banded forward and backward substituion are performed on 
% LL'x= q to solve for x.
% Input: %A,banded square matrix and q,a vector
% Output: C compact storage of A
%        L banded Lower Cholesky decomposition of A
%        x is the solution to Ax=q
% Author : Michael Akinwumi
[m,n]=size(A);
if (m~=n)
    error('Coefficient Matrix A Must be Square')
end
C=compactstorage(A);
B= compactchol(C);
L=unpack(B);L=L';
y=bandforward(L,q);%solves Ly=b
x=bandback(L',y);%solves L'x=y
%q=[5,3.55,2.81428571428571,2.34642857142857,2.01746031746032];
function B = compactstorage(A)
% This function stores symmetric banded matrix A in a 
% compact form bA in such a way that only the main diagonal,
% and the nonzero superdiagonals are stored. The first column 
% of bA corresponds to the main diagonal of A and the subsequent 
% columns of bA correspond to superdiagonals of A.
% Input:upper or lower bandwidth p and a symmetric matrix A
% Output: B, compressed form of A
dim=size(A);
if ~(dim(1)==dim(2))
    error('A must be square')
end
if (all((all(A)~=all(A'))))
    error('A must be symmetric')
end
if ~(all(eig(A))> 0)
    error('Matrix is at least not positive definite')
end
c=find(A(1,1:dim(1))~=0);
B=zeros(dim(1),c(end));
n=dim(1);p=c(end)-1;
for i=1:n
if i<=n-p
for j=i:p+i
B(i,j-i+1)=A(i,j);
end
else 
for j=i:n
B(i,j-i+1)=A(i,j);
end
end
end
function C = compactchol(B)
[m,p] = size(B);  p = p - 1;
C = B;
for k = 1:m
    last = min(k+p,m) - k + 1;
    for j = 2:last
        i = k + j - 1;
        C(i,1:last-j+1) = C(i,1:last-j+1) - ...
            ((C(k,j))/C(k,1))*C(k,j:last); 
    end
    C(k,:) = C(k,:)/sqrt(C(k,1));
end
C(end-(p-1):end,end) = 0;
function L=unpack(B)
[m,n]=size(B);
L=zeros(m,n);
for i=1:m
for j=1:n
ind=i+j-1;
if ind<=m
L(i,ind)=B(i,j);
end
end
end
function y= bandforward(R,b)
dim=size(R);c=find(R(1:dim(1),1)~=0);d=c(end)-1;
n= length(b); y=b(:);
y(1)=y(1)/R(1,1);
for k=2: n
km= max (1,k-d);
y(k )=(y(k)-dot(R(k,km:k -1),y(km:k -1)))/ R(k,k);
end
function x= bandback(R,y)
dim=size(R);c=find(R(1,1:dim(1))~=0);d=c(end)-1;
n=length(y); x=y (:);
x(n)=x(n)/R(n,n);
for k=n-1: -1:1
kp= min(n,k+d);
x(k )=(x(k)-dot(R(k,k +1: kp ),x(k +1: kp )))/ R(k,k);
end