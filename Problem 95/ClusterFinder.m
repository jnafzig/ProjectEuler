function cluster_groups = ClusterFinder(C_Matrix)
%Identify clusters:  cluster_groups is an array which gives each element an
%id to tell it which cluster it belongs to.  Each element which is assigned
%the same number is part of the same cluster

Number_Circles = size(C_Matrix,1);

p=symrcm(C_Matrix);
Crcm_Matrix=C_Matrix(p,p);

cluster_groups = zeros(Number_Circles,1);
clusterID = 1;

start_ind=1;
ind = start_ind; 
while  start_ind <=Number_Circles
    % find the extent of the cluster:   
    connections = Crcm_Matrix(:,ind);
    new_ind=find(connections,1,'last');
    
    if new_ind==ind
        cluster_groups(start_ind:new_ind)=clusterID;
        clusterID=clusterID+1;
        start_ind = new_ind + 1;
        ind = start_ind;
    else
        ind=new_ind;
    end
    
end

cluster_groups(p)=cluster_groups;
