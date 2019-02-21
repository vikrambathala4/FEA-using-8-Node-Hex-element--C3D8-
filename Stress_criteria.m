function[Pstress,V_stress,T_stress]=Stress_criteria(stress,Num_elements)
Pstress=cell(Num_elements,8);% Prnciple stress
V_stress=zeros(Num_elements,8);%Von-Mises stress
T_stress=zeros(Num_elements,8);% Tresca Stress
 for e=1:Num_elements
  for i=1:8
  S=stress{e,i};
  S=[S(1,1) S(4,1) S(6,1);S(4,1) S(2,1) S(5,1);S(6,1) S(5,1) S(3,1)];
  [~,Ps]=eig(S);
  Ps=diag(Ps);
  V_stress(e,i)=sqrt((1/2)*((Ps(1)-Ps(2))^2+(Ps(2)-Ps(3))^2+(Ps(3)-Ps(1))^2));
  T_stress(e,i)=max([abs(Ps(1)-Ps(2));abs(Ps(2)-Ps(3));abs(Ps(3)-Ps(1))]);
  Ps=sort(Ps,'ascend');
  Pstress{e,i}=Ps;
  end
 end
end