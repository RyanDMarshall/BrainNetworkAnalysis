function [Z, ROInames] = basco_get_matrix(anafile);
% NOTE: Type of values (corr, Fisher's Z etc.) is determined by selecting
% the appropriate measure from the dropbox in BASCO.

load(anafile);

nSub = size(anaobj, 2);
matSize = size(anaobj{1}.Ana{1}.Matrix,1);

Z = zeros(matSize,matSize,nSub);

for i = 1:nSub
    
    Z(:,:,i) = anaobj{i}.Ana{1}.Matrix;
    
end

ROInames = anaobj{1}.Ana{1}.Configure.ROI.Names';


