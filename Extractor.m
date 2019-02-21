% TNum_Nodes=Total Number of nodes in the entire Model
function[Nod_xCo,Nod_yCo,Nod_zCo,TNum_Nodes,Nodes_data,Nodal_fixity,...
         Nodal_loads,Element_data,Num_elements,.....
         Element_loads,E,Niu,Alp,Nodal_fixity_status]=Extractor(file_name)
Nodes_data=importdata(file_name,',');
Nodes_data=Nodes_data.data;
TNum_Nodes= size(Nodes_data,1);
Nodes_data=sequence_Node(Nodes_data,TNum_Nodes);
Nod_xCo=Nodes_data(:,2);
Nod_yCo=Nodes_data(:,3);
Nod_zCo=Nodes_data(:,4);
fid=fopen(file_name,'r');
textscan(fid,'%*s',TNum_Nodes+4,'delimiter','\n');
Nodal_fixity=textscan(fid,'%d %s %s %s %f %f %f','Delimiter',',');
Nodal_fixity_status=[Nodal_fixity{2},Nodal_fixity{3}, Nodal_fixity{4}];
Nodal_fixity=([double(Nodal_fixity{1}),Nodal_fixity{5},Nodal_fixity{6}, Nodal_fixity{7}]);
textscan(fid,'%*s',1,'delimiter','\n');
Nodal_loads=textscan(fid,'%d %f %f %f %f','Delimiter',',');
Nodal_loads=[Nodal_loads{1},Nodal_loads{2},Nodal_loads{3},Nodal_loads{4}, Nodal_loads{5}];
Nodal_loads=sequence_Node(Nodal_loads,TNum_Nodes);
textscan(fid,'%*s',1,'delimiter','\n');
Element_data=textscan(fid,'%d %d %d %d %d %d %d %d %d %f %f %f',...
                                                  'Delimiter',',');
E=Element_data{10};
Niu=Element_data{11};
Alp=Element_data{12};

Element_data=[Element_data{1},Element_data{2},Element_data{3},....
              Element_data{4},Element_data{5},Element_data{6},.....
              Element_data{7},Element_data{8},Element_data{9}];
Num_elements= size(Element_data,1);
textscan(fid,'%*s',1,'delimiter','\n');
Element_loads=textscan(fid,'%d %d %f','Delimiter',',');
fclose(fid);
end


          
