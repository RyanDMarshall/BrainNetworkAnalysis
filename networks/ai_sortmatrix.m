
function outmat = ai_sortmatrix(inmat, M)
% inmat  = input matric
% M0     = intial community structure
% M      = to be sorted to community structure
% outmat = output matrix

[sM, sIdx] = sort(M,'ascend'); 
outmat = inmat(sIdx,sIdx); 
