
function [nmodules nnodes] = ai_count_nodes(M)

nmodules = max(M);

for c=1:nmodules
    nnodes(c)=sum(M==c);
end 
