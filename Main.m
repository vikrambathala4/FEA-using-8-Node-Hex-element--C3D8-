%% Matlab Code to perform Stress Analysis using 3D 8 Noded Hex Element
% Defining the input and output file names
file_name=input('enter the name of the file:','s');
Out_file=input('enter the name of the out file:','s');

tic
%Specifying the order of integration
GQ_Order=2;
%Problem dimensionality 
Dof=3;
% order/Number of node of the traingular element
Num_Nodes=8;
% extract the information from the text file
[Nod_xCo,Nod_yCo,Nod_zCo,TNum_Nodes,Nodes_data,Nodal_fixity,...
      Nodal_loads,Element_data,Num_elements,.....
      Element_loads,E,Niu,Alp,Nodal_fixity_status]=Extractor(file_name);
% calculate the stifness matrix for each element.
EK=Element_Stifness(Num_elements,Num_Nodes,Element_data,Nodes_data,Dof,....
                    GQ_Order,E,Niu);
% Assmeble the all elements stifness matrix
[GK]=Assemble(TNum_Nodes,Dof,Num_elements,EK,Num_Nodes,Element_data);
% Construct the force vector
[F]=construct_F(Nodal_loads,TNum_Nodes,Dof);
%[GTF]=Traction_load(t,Element_loads,Num_elements,Num_Nodes,Element_data,Nodes_data,TNum_Nodes,Dof);
%[Total_Thermal_F]=ThermalF(Num_elements,Num_Nodes,TNum_Nodes,Element_data,....
                           % Nodes_data,Dof,problem_state,GQ_pints,E,Niu,t,Alp,Delta_T);
%d=displacements solution after solving GK,F
[d]=solve(GK,F,Nodal_fixity,Nodal_fixity_status);
%UV-both Ux and Ux for all nodes,U=Ux,V=Uy for all nodes
[UVW,U,V,W]=Nodal_response(d,TNum_Nodes,Nodal_fixity,Dof,Nodal_fixity_status);
% Calculating stress and strain in the elements
[strain,stress]=element_response(Num_elements,.....
                                Num_Nodes,UVW,Element_data,E,Niu,Dof,......
                                       Nodes_data,GQ_Order);
[Pstress,V_stress,T_stress]=Stress_criteria(stress,Num_elements);
[A_error,R_error,position,Rx,Ry,Rz,fixity_size]=Err(F,GK,UVW,Nodal_fixity,Nodal_fixity_status);

Processing_time=toc;
%print output to the text file
Out_Generator(Out_file,Processing_time,TNum_Nodes,Nodes_data,Nodal_fixity,.....
                         Nodal_loads,Element_data,..........
                         Num_elements,Element_loads,E,Niu,Alp,..........
                         GQ_Order,Dof,EK,GK,F,d,UVW,U,V,W,......
                         stress,strain,Pstress,......
                         V_stress,T_stress,A_error,R_error,position,Rx,Ry,Rz,.....
                        fixity_size,Nodal_fixity_status)
 toc