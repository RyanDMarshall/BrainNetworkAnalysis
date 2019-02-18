
%%
clear;
% p = '/home/data/parl-lab/experiments/crunch/fmri/analysis/spm12/times12/resting_state/';
% dset = 'dartel_offset_w3a_mot.5_43Ss';
% load([p dset '/output_D_partition_CONS_nodist_nothr_gamma1.25_tau.45.mat']);
% load([p dset '/w3aRS_YAOA12_264_dartel_nodist_rawdata.mat'])

%% Eliminate cerebellum and uncertain ROIs - to see !!
YA1([121 222],:,:) = 0; YA1(:,[121 222],:) = 0;
YA2([121 222],:,:) = 0; YA2(:,[121 222],:) = 0;
OA1([121 222],:,:) = 0; OA1(:,[121 222],:) = 0;
OA2([121 222],:,:) = 0; OA2(:,[121 222],:) = 0;

%%
ai_write_nodes('Node_YA1_w3aRS_CONS_gamma1.25_tau.5', consM_grpYA1, rois);
ai_write_nodes('Node_YA2_w3aRS_CONS_gamma1.25_tau.5', consM_grpYA2, rois);

ai_write_nodes('Node_OA1_w3aRS_CONS_gamma1.25_tau.5', consM_grpOA1, rois);
ai_write_nodes('Node_OA2_w3aRS_CONS_gamma1.25_tau.5', consM_grpOA2, rois);

%%
% ai_write_nodes('Node_YA1_w3aRS_CONS_gamma1.25_tau.45', ai_reorder(consM_grpYA1, [1 5 4 6 2 3 6]), rois);
% ai_write_nodes('Node_YA2_w3aRS_CONS_gamma1.25_tau.45', ai_reorder(consM_grpYA2, [4 5 1 2 3]), rois);

% ai_write_nodes('Node_OA1_w3aRS_CONS_gamma1.25_tau.45', ai_reorder(consM_grpOA1, [5 4 1 3 6 2 6]), rois);
 %ai_write_nodes('Node_OA2_w3aRS_CONS_gamma1.25_tau.45', ai_reorder(consM_grpOA2, [1 5 4 2 3 6]), rois);

%%
dlmwrite('Edge_YA1_w3aRS_CONS_gamma1.25_tau.5.edge',mean(YA1,3),'delimiter','\t','precision','%.8f');
dlmwrite('Edge_OA1_w3aRS_CONS_gamma1.25_tau.5.edge',mean(OA1,3),'delimiter','\t','precision','%.8f');
dlmwrite('Edge_YA2_w3aRS_CONS_gamma1.25_tau.5.edge',mean(YA2,3),'delimiter','\t','precision','%.8f');
dlmwrite('Edge_OA2_w3aRS_CONS_gamma1.25_tau.5.edge',mean(OA2,3),'delimiter','\t','precision','%.8f');

