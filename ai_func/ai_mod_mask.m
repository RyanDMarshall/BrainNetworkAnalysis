
function mask = ai_mod_mask(Mvec)

% Mvec = [1 1 1 1 2 2 2 3];

sMvec = sort(Mvec,'ascend');

nmod = max(sMvec);

mask = zeros(length(Mvec));

for imod = 1:nmod
    
    idxnodes = find(sMvec == imod);
    
    nnodes = length(idxnodes);
    
    modmat = ~eye(nnodes) .* imod;
    
    mask(idxnodes(1):idxnodes(end),idxnodes(1):idxnodes(end)) = modmat;
    
end