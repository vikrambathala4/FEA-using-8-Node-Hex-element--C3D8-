function[m]=verify_data(Nod_XCo,Nod_yCo,TNum_Nodes,Nodes_data,Nodal_fixity,...
                       Nodal_loads,problem_state,Element_data,Num_elements,.....
                       Element_loads,E,Niu,Alp,t,Nodal_fixity_status)
% check for poisson's ratio
 for e=1:Num_elements
     if Niu(e)>0.5 && Niu(e)<-1
     disp('The poissions ratio input is not valid');
     m=0;
     break
     else m=1;
     end
 if m==0
     break
 end
     if E(e)<0
         disp('The Youngs Modulus input is not valid');
         m=0;
         break
     else m=1;
     end
 if m==0
 break
 end
     if t(e)<0
         disp('The thickness input in not valid')
         m=0;
         break
     else
         m=1;
     end
if m==0
 break
end  
 
   if strcmp('plane stress',problem_state{e})==0 &&(strcmp('plane strain',problem_state{e}))==0
    disp('The Input elasticity condition of the problem is not valid')
    m=0;
    break
    else
      m=1;
   end
if m==0
 break
end
end



 end