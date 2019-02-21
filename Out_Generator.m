function[]=Out_Generator(Out_file,Processing_time,TNum_Nodes,Nodes_data,Nodal_fixity,.....
                         Nodal_loads,Element_data,..........
                         Num_elements,Element_loads,E,Niu,Alp,..........
                         GQ_Order,Dof,EK,GK,F,d,UVW,U,V,W,......
                         stress,strain,Pstress,......
                         V_stress,T_stress,A_error,R_error,position,Rx,Ry,Rz,.....
                        fixity_size,Nodal_fixity_status)
                         
CL=pwd;%current working directory
Out_file=strcat(CL,'\',Out_file);
file=fopen(Out_file,'w');
fprintf(file,'%70s\r\n','____________________________________________');
fprintf(file,'\r\n');
fprintf(file,'%54s\r\n','A FEA Program');                                 
fprintf(file,'%62s\r\n','Composed by, Vikram Kumar Bathala');
fprintf(file,'%70s\r\n','____________________________________________');
fprintf(file,'\r\n');
fprintf(file,'%34s\r\n','DETAILS OF FINITE ELEMENT MODEL');
fprintf(file,'%34s\r\n','-------------------------------');
fprintf(file,'\r\n');
fprintf(file,'              Time taken for the analysis: %s',num2str(Processing_time));
fprintf(file,'%s\r\n',' Sec');
fprintf(file,'              Number of Nodes: %d\r\n',TNum_Nodes);
fprintf(file,'           Number of Elements: %d\r\n',Num_elements);
fprintf(file,'\r\n');
fprintf(file, '%57s','Nodal Data');
fprintf(file,'\r\n');
fprintf(file,'%80s','-------------------------------------------------------');
fprintf(file,'\r\n');
fprintf(file, '%32s', 'Node');
fprintf(file, '%13s', 'X Coord');
fprintf(file, '%16s', 'Y Coord');
fprintf(file, '%16s', 'Z Coord');
fprintf(file,'\r\n');
fprintf(file,'%80s','-------------------------------------------------------');
fprintf(file,'\r\n');
% nodal coordinates Table data
for n=1:TNum_Nodes
    %for 1st column
    le=length(num2str(Nodes_data(n,1)));
    le=le+28;
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodes_data(n,1)));
    %for 2nd column
    le=length(num2str(Nodes_data(n,1)));
    if(Nodes_data(n,1)<0)
        le=le-1;
    end
    le=9-(le-1);
    le=le+length(num2str(Nodes_data(n,2)));
    if(Nodes_data(n,2)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodes_data(n,2)));
    %for 3rd column
    le=length(num2str(Nodes_data(n,2)));
    if(Nodes_data(n,2)<0)
        le=le-1;
    end
    le=16-(le-1);
    le=le+length(num2str(Nodes_data(n,3)));
    if(Nodes_data(n,3)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodes_data(n,3)));
    %for 4th column
    le=length(num2str(Nodes_data(n,3)));
    if(Nodes_data(n,3)<0)
        le=le-1;
    end
    le=14-(le-1);
    le=le+length(num2str(Nodes_data(n,4)));
    if(Nodes_data(n,4)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodes_data(n,4)));
    fprintf(file,'\r\n');
end
fprintf(file,'\r\n');
% Element Data
fprintf(file, '%59s','Element Data');
fprintf(file,'\r\n');
fprintf(file,'%79s','--------------------------------------------------------');
fprintf(file,'\r\n');
fprintf(file, '%32s', 'Element');
fprintf(file, '%6s', 'Type');
fprintf(file, '%15s', 'List of nodes');
fprintf(file,'\r\n');
fprintf(file,'%79s','--------------------------------------------------------');
fprintf(file,'\r\n');
% start printing element data
for n=1:Num_elements
     %for 1st column
    le=length(num2str(Element_data(n,1)));
    le=le+25;
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,1)));
    %for 2nd column
    le=length(num2str(Element_data(n,1)));
    le=9-(le-1);
    le=le+length('T6');
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,'H8');
    %for 3rd column
    le=length('T6');
    le=5-(le-1);
    le=le+length(num2str(Element_data(n,2)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,2)));
    %for 4th column
    le=length(num2str(Element_data(n,2)));
    le=4-(le-1);
    le=le+length(num2str(Element_data(n,3)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,3)));
    %for 5th column
    le=length(num2str(Element_data(n,3)));
    le=4-(le-1);
    le=le+length(num2str(Element_data(n,4)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,4)));
    % for 6th column
    le=length(num2str(Element_data(n,4)));
    le=4-(le-1);
    le=le+length(num2str(Element_data(n,5)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,5)));
    % for 7th column
    le=length(num2str(Element_data(n,5)));
    le=4-(le-1);
    le=le+length(num2str(Element_data(n,6)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,6)));
    % for 8th column
    le=length(num2str(Element_data(n,6)));
    le=4-(le-1);
    le=le+length(num2str(Element_data(n,7)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,7)));
    % for 9th column
    le=length(num2str(Element_data(n,7)));
    le=4-(le-1);
    le=le+length(num2str(Element_data(n,8)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,8)));
    % for 10th column
    le=length(num2str(Element_data(n,8)));
    le=4-(le-1);
    le=le+length(num2str(Element_data(n,9)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,9)));
    fprintf(file,'\r\n');
end

fprintf(file,'\r\n');
% Element properties
fprintf(file, '%63s','Element Properties');
fprintf(file,'\r\n');
fprintf(file,'%92s','-------------------------------------------------------------------------');
fprintf(file,'\r\n');
fprintf(file, '%46s', 'Element');
fprintf(file, '%6s', 'E');
fprintf(file, '%15s', 'NU');
fprintf(file,'\r\n');
fprintf(file,'%92s','-------------------------------------------------------------------------');
fprintf(file,'\r\n');
% print data
for n=1:Num_elements
    le=length(num2str(Element_data(n,1)));
    le=le+39;
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Element_data(n,1)));
%     Column2
    le=length(num2str(Element_data(n,1)));
    le=11-(le-1);
    le=le+length(num2str(E(n)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(E(n)));
%     column3
    le=length(num2str(E(n)));
    le=13-(le-1);
    le=le+length(num2str(Niu(n)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Niu(n)));
    fprintf(file,'\r\n');
end
% fprintf(file,'\r\n');
% % Element load data
% a=size(Element_loads{1,1});
% a=a(1,1);
% fprintf(file, '%49s','Element Loads');
% fprintf(file,'\r\n');
% fprintf(file,'%67s','------------------------------------------');
% fprintf(file,'\r\n');
% fprintf(file, '%32s', 'Element');
% fprintf(file, '%10s', 'Side');
% fprintf(file, '%20s', 'Load Intensity');
% fprintf(file,'\r\n');
% fprintf(file,'%67s','------------------------------------------');
% fprintf(file,'\r\n');
% for n=1:a
% %     column1
%     le=length(num2str(Element_loads{1,1}(n)));
%     le=le+25;
%     le=le+length(num2str(Element_data(n,6)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(Element_loads{1,1}(n)));
% %     column2
%     le=length(num2str(Element_loads{1,1}(n)));
%     le=12-(le-1);
%     le=le+length(num2str(Element_loads{1,2}(n)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(Element_loads{1,2}(n)));
% %     column 3
%     le=length(num2str(Element_loads{1,2}(n)));
%     le=9-(le-1);
%     le=le+length(num2str(Element_loads{1,3}(n)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(Element_loads{1,3}(n)));
%     fprintf(file,'\r\n');
% end
    
fprintf(file,'\r\n');
% Nodal Fixity data
fprintf(file, '%67s','Nodal Fixities');
fprintf(file,'\r\n');
fprintf(file,'%114s','----------------------------------------------------------------------------------------------------------');
fprintf(file,'\r\n');
fprintf(file, '%12s', 'Node');
fprintf(file, '%18s', 'X-Fixity');
fprintf(file, '%16s', 'X-Disp');
fprintf(file, '%18s', 'Y-Fixity');
fprintf(file, '%16s', 'Y-Disp');
fprintf(file, '%18s', 'Z-Fixity');
fprintf(file, '%16s', 'Z-Disp');
fprintf(file,'\r\n');
fprintf(file,'%114s','----------------------------------------------------------------------------------------------------------');
fprintf(file,'\r\n');
for n=1:fixity_size
    %for 1st column
    le=length(num2str(Nodal_fixity(n,1)));
    le=le+8;
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodal_fixity(n,1)));
%    column2
    le=length(num2str(Nodal_fixity(n,1)));
    le=13-(le-1);
    if strcmp(Nodal_fixity_status(n,1),'known')
        x='fixed';
    else
        x='free';
    end
    le=le+length(x);
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,x);
    %column 3
    le=length(x);
    le=17-(le-1);
    le=le+length(num2str(Nodal_fixity(n,2)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodal_fixity(n,2)));
    % column 4
    le=length(num2str(Nodal_fixity(n,2)));
    le=15-(le-1);
    if strcmp(Nodal_fixity_status(n,2),'known')
        x='fixed';
    else
        x='free';
    end
    le=le+length(x);
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,x);
%     column 5
    le=length(x);
    le=17-(le-1);
    le=le+length(num2str(Nodal_fixity(n,3)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodal_fixity(n,3)));
    % column 6
    le=length(num2str(Nodal_fixity(n,3)));
    le=15-(le-1);
    if strcmp(Nodal_fixity_status(n,3),'known')
        x='fixed';
    else
        x='free';
    end
    le=le+length(x);
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,x);
%     column 7
    le=length(x);
    le=17-(le-1);
    le=le+length(num2str(Nodal_fixity(n,4)));
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodal_fixity(n,4)));
     fprintf(file,'\r\n');
end
    
    fprintf(file,'\r\n');

%Nodal Displacement data
fprintf(file,'%36s\r\n','DETAILS OF FINITE ELEMENT RESULTS');
fprintf(file,'%36s\r\n','---------------------------------');
fprintf(file,'\r\n');
fprintf(file,'%61s\r\n','Nodal Displacements.');
fprintf(file,'%74s\r\n','----------------------------------------------');
 % building column names
fprintf(file,'%32s','Node');
fprintf(file,'%12s','X Disp');
fprintf(file,'%15s','Y Disp');
fprintf(file,'%15s\r\n','Z Disp');
fprintf(file,'%74s\r\n','----------------------------------------------');
% start printing data
for n=1:TNum_Nodes
    %for 1st column
    le=length(num2str(Nodes_data(n,1)));
    le=le+28;
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Nodes_data(n,1)));
    %for 2nd column
    le=length(num2str(Nodes_data(n,1)));
    le=9-(le-1);
    le=le+length(num2str(U(n,1)));
    if(U(n,1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(U(n,1)));
    %for 3rd column
    le=length(num2str(U(n,1)));
    if(U(n,1)<0)
        le=le-1;
    end
    le=14-(le-1);
    le=le+length(num2str(V(n,1)));
    if(V(n,1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(V(n,1)));
    %for 4rd column
    le=length(num2str(V(n,1)));
    if(V(n,1)<0)
        le=le-1;
    end
    le=14-(le-1);
    le=le+length(num2str(W(n,1)));
    if(W(n,1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(W(n,1)));
    fprintf(file,'\r\n');
end
fprintf(file,'\r\n');
% % print min max values of nodal displacements
% fprintf(file,'%31s','Min');
% % print min x value
%     le=7;
%     le=le+length(num2str(UV_Max_Min(1,2)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(1,2)));
%  % print min Y value
%     le=length(num2str(UV_Max_Min(1,2)));
%     le=14-(le-1);
%     le=le+length(num2str(UV_Max_Min(2,2)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(2,2)));
%     fprintf(file,'\r\n');
%     % print Xmin node
%     fprintf(file,'%32s','Node');
%     le=6;
%     le=le+length(num2str(UV_Max_Min(1,1)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(1,1)));
%     % print Ymin node value
%     le=length(num2str(UV_Max_Min(1,1)));
%     le=14-(le-1);
%     le=le+length(num2str(UV_Max_Min(2,1)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(2,1)));
%     fprintf(file,'\r\n');
%     % print max x value
%     fprintf(file,'%31s','Max');
%     le=7;
%     le=le+length(num2str(UV_Max_Min(1,4)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(1,4)));
%     % print max Y value
%     le=length(num2str(UV_Max_Min(1,4)));
%     le=14-(le-1);
%     le=le+length(num2str(UV_Max_Min(2,4)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(2,4)));
%     fprintf(file,'\r\n');
%     % print Xmax node
%     fprintf(file,'%32s','Node');
%     le=6;
%     le=le+length(num2str(UV_Max_Min(1,3)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(1,3)));
%     % print Ymax node value
%     le=length(num2str(UV_Max_Min(1,3)));
%     le=14-(le-1);
%     le=le+length(num2str(UV_Max_Min(2,3)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(2,3)));
%     fprintf(file,'\r\n');
% Reactions
fprintf(file,'%67s\r\n','Nodal Reaction Forces');
fprintf(file,'%84s\r\n','--------------------------------------------------------');
 % building column names
fprintf(file,'%32s','Node');
fprintf(file,'%12s','X Force');
fprintf(file,'%20s','Y Force');
fprintf(file,'%20s\r\n','Z Force');
fprintf(file,'%84s\r\n','--------------------------------------------------------');
% start printing nodal reaction forces
for i=1:fixity_size
    %for 1st column
    le=length(num2str(position(i,1)));
    le=le+28;
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(position(i,1)));
    %for 2nd column
    le=length(num2str(position(i,1)));
    le=8-(le-1);
    le=le+length(num2str(Rx(i,1)));
    if(Rx(i,1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Rx(i,1)));
    %for 3rd column
    le=length(num2str(Rx(i,1)));
    if(Rx(i,1)<0)
        le=le-1;
    end
    le=19-(le-1);
    le=le+length(num2str(Ry(i,1)));
    if(Ry(i,1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Ry(i,1)));
    %for 4th column
    le=length(num2str(Ry(i,1)));
    if(Ry(i,1)<0)
        le=le-1;
    end
    le=19-(le-1);
    le=le+length(num2str(Rz(i,1)));
    if(Rz(i,1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Rz(i,1)));
    fprintf(file,'\r\n');
end
fprintf(file,'\r\n');
fprintf(file,'%48s','Absolute error Norm: ');
fprintf(file,'%s\r\n',A_error);
fprintf(file,'%48s','Relative error Norm: ');
if (R_error~=0)
fprintf(file,'%s\r\n',num2str(R_error));
else
fprintf(file,'%s\r\n','N/A');
end
fprintf(file,'\r\n');
% strain data
fprintf(file,'%57s\r\n','Element Strain Data');
fprintf(file,'%s\r\n','---------------------------------------------------------------------------------------------------------------------');
fprintf(file,'%s','Element');
fprintf(file,'%4s','PT');
fprintf(file,'%11s','Strain XX');
fprintf(file,'%19s','Strain YY');
fprintf(file,'%19s','Strain ZZ');
fprintf(file,'%19s','Strain XY');
fprintf(file,'%19s','Strain YZ');
fprintf(file,'%19s\r\n','Strain ZX');
fprintf(file,'%s\r\n','---------------------------------------------------------------------------------------------------------------------');
% generate table for strain data
if (GQ_Order==2)
    GQ_pints=8;
end
for e=1:Num_elements
    
 for n=1:GQ_pints
     if n==1% first row is different in n=1
         %column 1
        le=length(num2str(e));
        %le=3+le;
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(e));
        %column2
        le=length(num2str(e));
        le=8-(le-1);%(gap-lengt_of_previous_element-1)
        le=le+length(num2str(n));
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(n));
     else
        %column2  row starts from column2
        le=length(num2str(n));
        le=9+le;%(gap-lengt_of_previous_element-1)
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(n));
      end
    % column 3
    le=length(num2str(n));
    le=3-(le-1);
    le=le+length(num2str(strain{e,n}(1)));
    if (strain{e,n}(1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(strain{e,n}(1)));
    %column4
    le=length(num2str(strain{e,n}(1)));
    if (strain{e,n}(1)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(strain{e,n}(2)));
    if (strain{e,n}(2)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(strain{e,n}(2)));
    %colum5
    le=length(num2str(strain{e,n}(2)));
    if (strain{e,n}(2)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(strain{e,n}(3)));
    if (strain{e,n}(3)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(strain{e,n}(3)));
    %column6
    le=length(num2str(strain{e,n}(3)));
    if (strain{e,n}(3)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(strain{e,n}(4)));
    if (strain{e,n}(4)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(strain{e,n}(4)));
    %column7
    le=length(num2str(strain{e,n}(4)));
    if (strain{e,n}(4)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(strain{e,n}(5)));
    if (strain{e,n}(5)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(strain{e,n}(5)));
    %column8
    le=length(num2str(strain{e,n}(5)));
    if (strain{e,n}(5)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(strain{e,n}(6)));
    if (strain{e,n}(6)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(strain{e,n}(6)));
    fprintf(file,'\r\n');
 end
  fprintf(file,'\r\n');
 end
 fprintf(file,'\r\n');
% %  Print max and min values of strain data
% fprintf(file,'%s','Min');
% % print min x strain
%     le=10;
%     le=le+length(num2str(strain_Max_Min(1,2)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(strain_Max_Min(1,2)));
%  % print min Y value
%     le=length(num2str(strain_Max_Min(1,2)));
%     le=14-(le-1);
%     le=le+length(num2str(strain_Max_Min(2,2)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(strain_Max_Min(2,2)));
%  % print min Z value  Need to change to craete original Z values
%     le=length(num2str(strain_Max_Min(3,2)));
%     le=14-(le-1);
%     le=le+length(num2str(strain_Max_Min(3,2)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(strain_Max_Min(3,2)));
%   % print min xy value 
%  
%     % print Xmin node
%     fprintf(file,'%32s','Node');
%     le=6;
%     le=le+length(num2str(UV_Max_Min(1,1)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(1,1)));
%     % print Ymin node value
%     le=length(num2str(UV_Max_Min(1,1)));
%     le=14-(le-1);
%     le=le+length(num2str(UV_Max_Min(2,1)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(2,1)));
%     fprintf(file,'\r\n');
%     % print max x value
%     fprintf(file,'%31s','Max');
%     le=7;
%     le=le+length(num2str(UV_Max_Min(1,4)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(1,4)));
%     % print max Y value
%     le=length(num2str(UV_Max_Min(1,4)));
%     le=14-(le-1);
%     le=le+length(num2str(UV_Max_Min(2,4)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(2,4)));
%     fprintf(file,'\r\n');
%     % print Xmax node
%     fprintf(file,'%32s','Node');
%     le=6;
%     le=le+length(num2str(UV_Max_Min(1,3)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(1,3)));
%     % print Ymax node value
%     le=length(num2str(UV_Max_Min(1,3)));
%     le=14-(le-1);
%     le=le+length(num2str(UV_Max_Min(2,3)));
%     skip=strcat('%',num2str(le),'s');
%     fprintf(file,skip,num2str(UV_Max_Min(2,3)));
%     fprintf(file,'\r\n');

% stress data
fprintf(file,'%57s\r\n','Element Stress Data.');
fprintf(file,'%s\r\n','---------------------------------------------------------------------------------------------------------------------');
fprintf(file,'%s','Element');
fprintf(file,'%4s','PT');
fprintf(file,'%11s','Stress XX');
fprintf(file,'%19s','Stress YY');
fprintf(file,'%19s','Stress ZZ');
fprintf(file,'%19s','Stress XY');
fprintf(file,'%19s','Stress YZ');
fprintf(file,'%19s\r\n','Stress ZX');
fprintf(file,'%s\r\n','---------------------------------------------------------------------------------------------------------------------');
% generate table for stress data
for e=1:Num_elements
 for n=1:GQ_pints
     if n==1% first row is different in n=1
         %column 1
        le=length(num2str(e));
        %le=3+le;
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(e));
        %column2
        le=length(num2str(e));
        le=8-(le-1);%(gap-lengt_of_previous_element-1)
        le=le+length(num2str(n));
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(n));
     else
        %column2  row starts from column2
        le=length(num2str(n));
        le=9+le;%(gap-lengt_of_previous_element-1)
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(n));
      end
    % column 3
    le=length(num2str(n));
    le=3-(le-1);
    le=le+length(num2str(stress{e,n}(1)));
    if (stress{e,n}(1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(stress{e,n}(1)));
    %column4
    le=length(num2str(stress{e,n}(1)));
    if (stress{e,n}(1)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(stress{e,n}(2)));
    if (stress{e,n}(2)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(stress{e,n}(2)));
    %colum5
    le=length(num2str(stress{e,n}(2)));
    if (stress{e,n}(2)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(stress{e,n}(3)));
    if (stress{e,n}(3)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(stress{e,n}(3)));
    %column6
    le=length(num2str(stress{e,n}(3)));
    if (stress{e,n}(3)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(stress{e,n}(4)));
    if (stress{e,n}(4)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(stress{e,n}(4)));
    %column7
    le=length(num2str(stress{e,n}(4)));
    if (stress{e,n}(4)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(stress{e,n}(5)));
    if (stress{e,n}(5)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(stress{e,n}(5)));
    %column8
    le=length(num2str(stress{e,n}(5)));
    if (stress{e,n}(5)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(stress{e,n}(6)));
    if (stress{e,n}(6)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(stress{e,n}(6)));
    fprintf(file,'\r\n');
 end
 fprintf(file,'\r\n');
end
fprintf(file,'\r\n');
fprintf(file,'%71s\r\n','Element Failure Criteria.');
fprintf(file,'%114s\r\n','-------------------------------------------------------------------------------------------------------');
fprintf(file,'%18s','Element');
fprintf(file,'%4s','PT');
fprintf(file,'%7s','Sig 1');
fprintf(file,'%19s','Sig 2');
fprintf(file,'%19s','Sig 3');
fprintf(file,'%20s','Tresca');
fprintf(file,'%18s\r\n','Mises');
fprintf(file,'%114s\r\n','-------------------------------------------------------------------------------------------------------');
%Generate table for Element failure criteria
 for e=1:Num_elements
 for n=1:GQ_pints
     if n==1% first row is different in n=1
         %column 1
        le=length(num2str(e));
        le=11+le;
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(e));
        %column2
        le=length(num2str(e));
        le=8-(le-1);%(gap-lengt_of_previous_element-1)
        le=le+length(num2str(n));
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(n));
     else
        %column2  row starts from column2
        le=length(num2str(n));
        le=20+le;%(gap-lengt_of_previous_element-1)
        skip=strcat('%',num2str(le),'s');
        fprintf(file,skip,num2str(n));
      end
    % column 3
    le=length(num2str(n));
    le=3-(le-1);
    le=le+length(num2str(Pstress{e,n}(1)));
    if(Pstress{e,n}(1)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Pstress{e,n}(1)));
    %column4
    le=length(num2str(Pstress{e,n}(1)));
    if(Pstress{e,n}(1)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(Pstress{e,n}(2)));
    if(Pstress{e,n}(2)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Pstress{e,n}(2)));
    %colum5  
    le=length(num2str(Pstress{e,n}(2)));
    if(Pstress{e,n}(2)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(Pstress{e,n}(3)));
    if(Pstress{e,n}(3)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(Pstress{e,n}(3)));
    %column6
    le=length(num2str(Pstress{e,n}(3)));
    if(Pstress{e,n}(3)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(T_stress(e,n)));
    if(T_stress(e,n)<0)
        le=le-1;
    end
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(T_stress(e,n)));
    %column7
    le=length(num2str(T_stress(e,n)));
    if(T_stress(e,n)<0)
        le=le-1;
    end
    le=18-(le-1);
    le=le+length(num2str(V_stress(e,n)));
    if(V_stress(e,n)<0)
        le=le-1;
    end 
    skip=strcat('%',num2str(le),'s');
    fprintf(file,skip,num2str(V_stress(e,n)));    
% end of all columns
    fprintf(file,'\r\n');
 end
  fprintf(file,'\r\n');
 end
fprintf(file,'\r\n');
fprintf(file,'%56s','********************************************************');
fprintf(file,'End of the data');
fprintf(file,'%56s','********************************************************');
fclose(file);
end