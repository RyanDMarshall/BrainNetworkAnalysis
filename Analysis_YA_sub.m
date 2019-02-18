%% Subject Level Analysis for YA1 and YA2

%% Load & Basic Setup
clear; clc;

% USING Dartel
dataset = 'dartel_offset_w3a_mot.5_42Ss_copy';
infile = 'w3aRS_YAOA123_264_dartel_nodist_rawdata.mat';

basepath = '/home/ryanmars/Scripts/';
infolder = [basepath dataset '/'];
outfolder = infolder; 
load([infolder infile]);

%% Settings
nrep = 100;
gamma = 1.25;
tau = 0.5;
nYA = size(YA1,3);

outparams = 'thr.02.01.1_gamma1.25_500rep';

if info.dist20
    outfile = ['output_C_modularity_dist20_' outparams '.mat'];
else
    outfile = ['output_C_modularity_nodist_' outparams '.mat'];
end

clear YA3 OA*

%% Noise and Error Reduction; Outlier Removal

% Enforces that the adjacency matrices be symmetric
YA1 = symmetrize_group_rm(YA1);
YA2 = symmetrize_group_rm(YA2);

% Finds minimal threshold of strongest edges needed for each graph to be
% node-connected
thrminYA1 = find_conn_thresh_rm(YA1); 
thrminYA2 = find_conn_thresh_rm(YA2); 

% Calculates threshold outliers (subjects with too high a threshold for
% connectivity) and erases them from the dataset
outliersYA1 = find(thrminYA1 > 1.5*iqr(thrminYA1)+prctile(thrminYA1,75));
outliersYA2 = find(thrminYA2 > 1.5*iqr(thrminYA2)+prctile(thrminYA2,75));

outliersYA123 = vertcat(outliersYA1, outliersYA2);

thrminYA1(outliersYA123) = []; 
thrminYA2(outliersYA123) = []; 

% OA 4,8, and 19 are removed as outliers. No YA outliers identified
YA1(:,:,outliersYA123) = [];  
YA2(:,:,outliersYA123) = []; 

clear outliers*

%% Data Binarization

% This binarizes each graph - edges with weight above the highest minimal
% threshold needed for each subject's node-connectedness are set to 1, and
% edges with weights below this threshold are set to 0.

thrmin = zeros(nYA,1);
for i = 1:nYA
    thrmin(i) = max(thrminYA1(i), thrminYA2(i));
    nodeYA1(:,:,i) = binarize_rm(YA1(:,:,i), thrmin(i)); 
    nodeYA2(:,:,i) = binarize_rm(YA2(:,:,i), thrmin(i)); 
end

clear thr*

%% Subject-Level Community Partioning & Measure Calculation

% This script (analyze_group_rm) calculates the node (commNode) and link 
% (commLink) community partitions, as well as the participation 
% coefficients (P), within module degree z-score (D), and link numbers (N) 
% of every node in the subject-level graphs.

[PYA1, DYA1, NYA1, commNodeYA1, commLinkYA1] = analyze_group_rm(nodeYA1, gamma, tau, nrep);
[PYA2, DYA2, NYA2, commNodeYA2, commLinkYA2] = analyze_group_rm(nodeYA2, gamma, tau, nrep);

%% Inter-Method Analysis

% Spearman correlation coefficients and their corresponding p-values are 
% calculated between measures (P, D, N above).

[corrPDYA1, corrPDYA1_pval] = corr(PYA1, DYA1, 'type', 'Spearman');
[corrPNYA1, corrPNYA1_pval] = corr(PYA1, NYA1, 'type', 'Spearman');
[corrDNYA1, corrDNYA1_pval] = corr(DYA1, NYA1, 'type', 'Spearman');

[corrPDYA2, corrPDYA2_pval] = corr(PYA2, DYA2, 'type', 'Spearman');
[corrPNYA2, corrPNYA2_pval] = corr(PYA2, NYA2, 'type', 'Spearman');
[corrDNYA2, corrDNYA2_pval] = corr(DYA2, NYA2, 'type', 'Spearman');

%% Hub Identification

% Calculates hubs by each method (participation coefficient & within-module
% degree z-score for non-overlapping community detection; link number for
% overlapping community detection) for each subject.

zMin = 1.5; % Threshold for R5-R7 in part-deg analysis
roles = [3,4,6,7]; % Which node roles are considered to be hubs

for i=1:nYA
    RYA1(:,i) = identify_roles_rm(nodeYA1(:,:,i), commNodeYA1(:,i), zMin);
    RYA2(:,i) = identify_roles_rm(nodeYA2(:,:,i), commNodeYA2(:,i), zMin);

    hubNodeYA1(:,i) = identify_PDhubs_rm(RYA1(:,i), roles);
    hubNodeYA2(:,i) = identify_PDhubs_rm(RYA2(:,i), roles);

    pctHubNodeYA1(i) = sum(hubNodeYA1(:,i))/length(hubNodeYA1(:,i));
    pctHubNodeYA2(i) = sum(hubNodeYA2(:,i))/length(hubNodeYA2(:,i));

    % We attempt to have aproximately as many link hubs as node hubs. Since we
    % define this as a percentile, it is an arbitrary cutoff.
    hubLinkYA1(:,i) = identify_linkhubs_rm(NYA1(:,i), pctHubNodeYA1(i));
    hubLinkYA2(:,i) = identify_linkhubs_rm(NYA2(:,i), pctHubNodeYA2(i));

    pctHubLinkYA1(i) = sum(hubLinkYA1(:,i))/length(hubLinkYA1(:,i));
    pctHubLinkYA2(i) = sum(hubLinkYA2(:,i))/length(hubLinkYA2(:,i));
end

save('Analysis_YA_sub.mat');

%% End