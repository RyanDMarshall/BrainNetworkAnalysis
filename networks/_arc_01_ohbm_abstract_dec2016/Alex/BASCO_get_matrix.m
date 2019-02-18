clear all;

basepath = '/home/data/parl-lab/experiments/crunch/fmri/analysis/spm12/time2/workmem/01_maint_conc/02_setsizes_noderiv/task_connect/BASCO/ALL_test/';

% NOTE: Type of values (corr, Fisher's Z etc.) is determined by selecting
% the appropriate measure from the dropbox in BASCO.

% anafile = 'estim_BL_Z.mat';
anafile = 'estim_WM_Z.mat';

load([basepath anafile]);

nSub = size(anaobj, 2);
matSize = size(anaobj{1}.Ana{1}.Matrix,1);

A = zeros(matSize,matSize,nSub);

for i = 1:nSub
    
    A(:,:,i) = anaobj{i}.Ana{1}.Matrix;
    
end

ROInames = anaobj{1}.Ana{1}.Configure.ROI.Names';


