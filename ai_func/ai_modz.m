
function [mW, mB] = ai_modz(M, modvec)

% calculates the average z value for each module in a partition
% there is an issue with orphan modules - see below

nmod = max(modvec); 

for imod = 1:nmod
    W_mod{imod} = M(find(modvec == imod), find(modvec == imod), :);
end

for imod = 1:nmod
    B_mod{imod} = M(find(modvec == imod), find(modvec ~= imod), :);
end

for imod = 1:nmod
    mW_mod(imod,:) = ai_mean_uptri(W_mod{imod});
end

for imod = 1:nmod
    mB_mod(imod,:) = mean(mean(B_mod{imod}));
end

% if there are orphan nodes, you might get NaNs in this
mW_mod(isnan(mW_mod))=0;

for isub = 1:size(mW_mod,2)
    onesub = mW_mod(:,isub);
    % mW(isub) = sum(onesub)/nnz(onesub); % !!! WATCH THIS !!!
    % mW(isub) = mean(onesub);
    mW(isub) = mean(onesub(1:5)); % only 5 networks
end

% mB = mean(mB_mod);
mB = mean(mB_mod(1:5,:)); % only 5 networks