
function outmat = ai_sortvec(invec, M)

[sM, sIdx] = sort(M,'ascend'); 
outmat = invec(sIdx)'; 
