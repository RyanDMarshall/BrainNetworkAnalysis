%% Group-Level Images

clear;clc;close all;
load('Analysis_YA_grp.mat');

%% Between-Measure Comparison

plot_PDN_3D_rm(PYA1,DYA1,NYA1,'YA1');
plot_PDN_3D_rm(PYA2,DYA2,NYA2,'YA2');

%% Node and Link Community Structure

write_brain_node_comm_rm(nodeYA1, commNodeYA1, rois, 'NodeCommsYA1grp');
write_brain_link_comm_rm(nodeYA1, commLinkYA1, rois, 'LinkCommsYA1grp')

%% Hub Identification

write_common_hubs_rm('allHubsYA1', rois, hubNodeYA1, hubLinkYA1);
write_common_hubs_rm('allHubsYA2', rois, hubNodeYA2, hubLinkYA2);

%% Consistency Over Time

write_common_nodehubs_rm('interNodeHubsGrpYA', rois, RYA1, RYA2);
write_common_linkhubs_rm('interLinkHubsGrpYA', rois, hubLinkYA1, hubLinkYA2);

%% Node and Link Hubs Across Time
    
write_PDhubs_rm('PDHubsYA1', nodeYA1, commNodeYA1, rois, 1.5, [3 4 6 7]);
write_PDhubs_rm('PDHubsYA2', nodeYA2, commNodeYA2, rois, 1.5, [3 4 6 7]);

write_linkhubs_rm('LinkHubsYA1', nodeYA1, commLinkYA1, rois, 3);
write_linkhubs_rm('LinkHubsYA2', nodeYA2, commLinkYA2, rois, 3);

%% Consistency Over Time

write_common_hubs_rm('timeHubNodesGrpYA', rois, hubNodeYA1, hubNodeYA2);
write_common_hubs_rm('timeHubLinksGrpYA', rois, hubLinkYA1, hubLinkYA2);

%% End