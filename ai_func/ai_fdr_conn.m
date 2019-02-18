 
function [FDR_Z FDRcorr_Z max_tFDR] = ai_fdr_conn(Z,q,nvols)

% Takes as input a FisherZ transformed group connectivity matrix
% Outputs the FDR-corrected FisherZ and R matrices, and the max 
% value of tFDR amongst all subjects.

nsub = size(Z,3); % data is for all subjects (3-D)

%% reverse transform from FisherZ to r
% corr_Z = ifisherz(Z);
corr_Z = tanh(Z); % this does the same thing

%% transform r values to corresponding p values
% one-tailed p values are used because this is done separately
% for pos and neg correlations
[tcorr_Z, pcorr_Z, ~] = rtot(corr_Z, nvols);

%% find out FDR-corrected critical t, q=0.05
% Note: tFDR toses NaNs. Check if it also tosses zeros
for c=1:nsub
    % because the matrix is simmetrical, the FDR correction is calculated
    % based on the upper triangle (withouth the diagonal, which is zeros)
    
    % independence/pos dependence assumption - more sensitive/liberal
    % this is what Tom Nichols recomments for fMRI data
    [tFDR_Z(c), ~, nvals_Z(c)] = tFDR(uptri(tcorr_Z(:,:,c)), q, nvols-2);
    
    % no correlation assumption - more conservative
    % [~, tFDR_Z(c), nvals_Z(c)] = tFDR(uptri(tcorr_Z(:,:,c)), q, nvols-2);
end

max_tFDR = max(tFDR_Z)

%% threshold Z by tFDR
for c=1:nsub
    FDRcorr_Z(:,:,c) = corr_Z(:,:,c) .* (tcorr_Z(:,:,c) >= tFDR_Z(c));
    FDR_Z(:,:,c) = Z(:,:,c) .* (tcorr_Z(:,:,c) >= tFDR_Z(c));
end