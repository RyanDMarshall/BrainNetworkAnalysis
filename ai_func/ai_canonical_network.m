 
function [canonical_Z, canonical_M] = ai_canonical_network(filename)

load(filename);

canonical_Z = zeros(nrois,nrois);
ncomm = max(canonical_M);

start = 1;
for idx = 1:ncomm
    count = sum(canonical_M == idx);
    canonical_Z(start:start+count-1,start:start+count-1) = idx;
    start = start + count;
end

canonical_Z(1:nrois+1:nrois*nrois) = 0;

% figure; drawmatrix(canonical_Z,[],'networks',canonical_M);  
