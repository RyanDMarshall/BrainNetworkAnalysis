%% Tests Consistency Across Iterations for Group Level Partitions

%% Running 5 Iterations
% Runs partitioning algorithm 5 times and saves to part_cons_sub_all.mat after 
% relabelling all variables in each iteration to append the iteration index

% NOTE: Comment out all "clear","clc" commands in Analysis_YA_grp.m before
% running this code!

% clear;clc;
% 
% for i = 1:5
%     i
%     fname = strcat('part_cons_grp_',num2str(i),'.mat');
%     Analysis_YA_grp;
%     save(fname);
%     fix_label_rm(fname, i);
% end
% 
% clear;clc;
% 
% for i = 1:5
%     fname = strcat('part_cons_grp_',num2str(i),'.mat');
%     load(fname);
% end
% 
% save('part_cons_grp_all.mat');

%% Relabeling
% Permutes all community labels of iterations 2-5 to match the community 
% identities of iteration 1 as closely as possible. 

clear;clc;
load('part_cons_grp_all.mat');

commNodeYA1_2 = relabel_rm(commNodeYA1_1, commNodeYA1_2);
commNodeYA1_3 = relabel_rm(commNodeYA1_1, commNodeYA1_3);
commNodeYA1_4 = relabel_rm(commNodeYA1_1, commNodeYA1_4);
commNodeYA1_5 = relabel_rm(commNodeYA1_1, commNodeYA1_5);

commLinkYA1_2 = relabel_rm(commLinkYA1_1, commLinkYA1_2);
commLinkYA1_3 = relabel_rm(commLinkYA1_1, commLinkYA1_3);
commLinkYA1_4 = relabel_rm(commLinkYA1_1, commLinkYA1_4);
commLinkYA1_5 = relabel_rm(commLinkYA1_1, commLinkYA1_5);

commNodeYA2_2 = relabel_rm(commNodeYA2_1, commNodeYA2_2);
commNodeYA2_3 = relabel_rm(commNodeYA2_1, commNodeYA2_3);
commNodeYA2_4 = relabel_rm(commNodeYA2_1, commNodeYA2_4);
commNodeYA2_5 = relabel_rm(commNodeYA2_1, commNodeYA2_5);

commLinkYA2_2 = relabel_rm(commLinkYA2_1, commLinkYA2_2);
commLinkYA2_3 = relabel_rm(commLinkYA2_1, commLinkYA2_3);
commLinkYA2_4 = relabel_rm(commLinkYA2_1, commLinkYA2_4);
commLinkYA2_5 = relabel_rm(commLinkYA2_1, commLinkYA2_5);

%% Calculate Similarities
% Finds the percent of commonly identified nodes/edges in each partition as
% a measure of the similarities of each partition

simNodeYA1_2 = sum(commNodeYA1_1 == commNodeYA1_2)/length(commNodeYA1_1);
simNodeYA1_3 = sum(commNodeYA1_1 == commNodeYA1_3)/length(commNodeYA1_1);
simNodeYA1_4 = sum(commNodeYA1_1 == commNodeYA1_4)/length(commNodeYA1_1);
simNodeYA1_5 = sum(commNodeYA1_1 == commNodeYA1_5)/length(commNodeYA1_1);

simLinkYA1_2 = sum(commLinkYA1_1 == commLinkYA1_2)/length(commLinkYA1_1);
simLinkYA1_3 = sum(commLinkYA1_1 == commLinkYA1_3)/length(commLinkYA1_1);
simLinkYA1_4 = sum(commLinkYA1_1 == commLinkYA1_4)/length(commLinkYA1_1);
simLinkYA1_5 = sum(commLinkYA1_1 == commLinkYA1_5)/length(commLinkYA1_1);

simNodeYA2_2 = sum(commNodeYA2_1 == commNodeYA2_2)/length(commNodeYA2_1);
simNodeYA2_3 = sum(commNodeYA2_1 == commNodeYA2_3)/length(commNodeYA2_1);
simNodeYA2_4 = sum(commNodeYA2_1 == commNodeYA2_4)/length(commNodeYA2_1);
simNodeYA2_5 = sum(commNodeYA2_1 == commNodeYA2_5)/length(commNodeYA2_1);

simLinkYA2_2 = sum(commLinkYA2_1 == commLinkYA2_2)/length(commLinkYA2_1);
simLinkYA2_3 = sum(commLinkYA2_1 == commLinkYA2_3)/length(commLinkYA2_1);
simLinkYA2_4 = sum(commLinkYA2_1 == commLinkYA2_4)/length(commLinkYA2_1);
simLinkYA2_5 = sum(commLinkYA2_1 == commLinkYA2_5)/length(commLinkYA2_1);

% Takes the average similarity over all iterations for each group and method

aveSimNodeYA1 = (simNodeYA1_2 + simNodeYA1_3 + simNodeYA1_4 + simNodeYA1_5)/4;
aveSimLinkYA1 = (simLinkYA1_2 + simLinkYA1_3 + simLinkYA1_4 + simLinkYA1_5)/4;
aveSimNodeYA2 = (simNodeYA2_2 + simNodeYA2_3 + simNodeYA2_4 + simNodeYA2_5)/4;
aveSimLinkYA2 = (simLinkYA2_2 + simLinkYA2_3 + simLinkYA2_4 + simLinkYA2_5)/4;

save('cons_check_data.mat');