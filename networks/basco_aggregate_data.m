function [bigZ, ROInames] = basco_aggregate_data(matrices)

nmat = length(matrices);

% get just the first one
[Z1, ROInames] = basco_get_matrix(matrices{1});
[nrows, ncols, nsub] = size(Z1);
bigZ = zeros(nrows, ncols, nsub, nmat);
bigZ(:,:,:,1) = Z1;

for i = 2:nmat
    bigZ(:,:,:,i) = basco_get_matrix(matrices{i});
end
