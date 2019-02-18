% Below function is from result of google search of "Conn Cost Threshold %
% Calculates the strongest v * 100 percent of correlations %
% Function takes in a matrix(fisher transfomred z), and threshold and outputs binary matrix 
% with same dimensions.
% v ranges from 0 to 1. 5% = .05   

function thresholded_matrix = cost_thresh(Z,v)
% eye returns an identity matrix(1 in diagonal elements). ~eye returns the
% opposite(0 in diagonal elements). mask holds indices of matrix that holds
% non-zero elements
mask = find(~eye(size(Z,1)));
% N holds number of elements in mask. Size of mask
N = numel(mask);
% sort all non-zero values in input matrix, and sort them in ascending order
% and store that linear vector in to variable in
% Alex: in stores the *indices*, that correspond to the values, 
% not the actual values.
[~,in] = sort(Z(mask));
% since now we know that in is sorted, we only look at the last v% of
% element. 
in(1:N-round(N*v/2)*2) = []; % N-round(N*v/2)*2 is equivalent with N-ceil(N*v)
% Create empty matrix with original size with all Nan value
thresholded_matrix = nan(size(Z));
% Assign according indices to accoding value
thresholded_matrix(mask(in)) = Z(mask(in));
% We need to binary the result
nan_val = find(thresholded_matrix>0); % This output a vector containing the linear indices of each non zero elements
thresholded_matrix(nan_val) = 1;
thresholded_matrix(isnan(thresholded_matrix)) = 0;

