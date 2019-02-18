%% Testing Consistency Across Iterations For Subject Level Partitions
 
%% Running 5 Iterations
% Runs partitioning algorithm 5 times and saves to part_cons_sub_all.mat after 
% relabelling all variables in each iteration to append the iteration index

% NOTE: Comment out all "clear","clc" commands in Analysis_YA_sub.m before
% running this code!

% clear;clc;
% 
% for i = 1:5
%     i
%     fname = strcat('part_cons_sub_',num2str(i),'.mat');
%     Analysis_YA_sub;
%     save(fname);
%     fix_label_rm(fname, i);
% end
% 
% clear;
% 
% for i = 1:5
%     fname = strcat('part_cons_sub_',num2str(i),'.mat');
%     load(fname);
% end
% 
% save('part_cons_sub_all.mat');

%% Relabeling
% Permutes all community labels of iterations 2-5 to match the community 
% identities of iteration 1 as closely as possible. Note link community
% partitions are stored in a cell since we are allowing for different
% numbers of edges in subject level graphs.

clear; clc;
load('part_cons_sub_all.mat');

commNodeYA1_2 = relabel_rm(commNodeYA1_1, commNodeYA1_2);
commNodeYA1_3 = relabel_rm(commNodeYA1_1, commNodeYA1_3);
commNodeYA1_4 = relabel_rm(commNodeYA1_1, commNodeYA1_4);
commNodeYA1_5 = relabel_rm(commNodeYA1_1, commNodeYA1_5);

commLinkYA1_2 = relabel_cell_rm(commLinkYA1_1, commLinkYA1_2);
commLinkYA1_3 = relabel_cell_rm(commLinkYA1_1, commLinkYA1_3);
commLinkYA1_4 = relabel_cell_rm(commLinkYA1_1, commLinkYA1_4);
commLinkYA1_5 = relabel_cell_rm(commLinkYA1_1, commLinkYA1_5);

commNodeYA2_2 = relabel_rm(commNodeYA2_1, commNodeYA2_2);
commNodeYA2_3 = relabel_rm(commNodeYA2_1, commNodeYA2_3);
commNodeYA2_4 = relabel_rm(commNodeYA2_1, commNodeYA2_4);
commNodeYA2_5 = relabel_rm(commNodeYA2_1, commNodeYA2_5);

commLinkYA2_2 = relabel_cell_rm(commLinkYA2_1, commLinkYA2_2);
commLinkYA2_3 = relabel_cell_rm(commLinkYA2_1, commLinkYA2_3);
commLinkYA2_4 = relabel_cell_rm(commLinkYA2_1, commLinkYA2_4);
commLinkYA2_5 = relabel_cell_rm(commLinkYA2_1, commLinkYA2_5);

save('part_cons_sub_all.mat');

%% Calculate Similarities
% Finds the percent of commonly identified nodes/edges in each partition as
% a measure of the similarities of each partition
for i = 1:22
    simNodeYA1_2(i) = sum(commNodeYA1_1(:,i) == commNodeYA1_2(:,i))/length(commNodeYA1_1(:,i));
    simNodeYA1_3(i) = sum(commNodeYA1_1(:,i) == commNodeYA1_3(:,i))/length(commNodeYA1_1(:,i));
    simNodeYA1_4(i) = sum(commNodeYA1_1(:,i) == commNodeYA1_4(:,i))/length(commNodeYA1_1(:,i));
    simNodeYA1_5(i) = sum(commNodeYA1_1(:,i) == commNodeYA1_5(:,i))/length(commNodeYA1_1(:,i));
    
    simLinkYA1_2(i) = sum(commLinkYA1_1{i} == commLinkYA1_2{i});
    simLinkYA1_3(i) = sum(commLinkYA1_1{i} == commLinkYA1_3{i});
    simLinkYA1_4(i) = sum(commLinkYA1_1{i} == commLinkYA1_4{i});
    simLinkYA1_5(i) = sum(commLinkYA1_1{i} == commLinkYA1_5{i});

    simNodeYA2_2(i) = sum(commNodeYA2_1(:,i) == commNodeYA2_2(:,i))/length(commNodeYA2_1(:,i));
    simNodeYA2_3(i) = sum(commNodeYA2_1(:,i) == commNodeYA2_3(:,i))/length(commNodeYA2_1(:,i));
    simNodeYA2_4(i) = sum(commNodeYA2_1(:,i) == commNodeYA2_4(:,i))/length(commNodeYA2_1(:,i));
    simNodeYA2_5(i) = sum(commNodeYA2_1(:,i) == commNodeYA2_5(:,i))/length(commNodeYA2_1(:,i));

    simLinkYA2_2(i) = sum(commLinkYA2_1{i} == commLinkYA2_2{i});
    simLinkYA2_3(i) = sum(commLinkYA2_1{i} == commLinkYA2_3{i});
    simLinkYA2_4(i) = sum(commLinkYA2_1{i} == commLinkYA2_4{i});
    simLinkYA2_5(i) = sum(commLinkYA2_1{i} == commLinkYA2_5{i});
    
    numLinkYA1(i) = length(commLinkYA1_1{i});
    numLinkYA2(i) = length(commLinkYA2_1{i});
end

simLinkYA1_2 = sum(simLinkYA1_2)/sum(numLinkYA1);
simLinkYA1_3 = sum(simLinkYA1_3)/sum(numLinkYA1);
simLinkYA1_4 = sum(simLinkYA1_4)/sum(numLinkYA1);
simLinkYA1_5 = sum(simLinkYA1_5)/sum(numLinkYA1);

simLinkYA2_2 = sum(simLinkYA2_2)/sum(numLinkYA2);
simLinkYA2_3 = sum(simLinkYA2_3)/sum(numLinkYA2);
simLinkYA2_4 = sum(simLinkYA2_4)/sum(numLinkYA2);
simLinkYA2_5 = sum(simLinkYA2_5)/sum(numLinkYA2);

% Takes the average similarity over all iterations for each group and method
aveSimNodeYA1 = (simNodeYA1_2 + simNodeYA1_3 + simNodeYA1_4 + simNodeYA1_5)./4;
aveSimLinkYA1 = (simLinkYA1_2 + simLinkYA1_3 + simLinkYA1_4 + simLinkYA1_5)./4;
aveSimNodeYA2 = (simNodeYA2_2 + simNodeYA2_3 + simNodeYA2_4 + simNodeYA2_5)./4;
aveSimLinkYA2 = (simLinkYA2_2 + simLinkYA2_3 + simLinkYA2_4 + simLinkYA2_5)./4;

aveSimNodeYA1 = mean(aveSimNodeYA1);
aveSimNodeYA2 = mean(aveSimNodeYA2);

aveNumLinksYA1 = mean(numLinkYA1);
aveNumLinksYA2 = mean(numLinkYA2);

save('part_cons_sub_all.mat');