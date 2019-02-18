
function [maxM, maxQ] = ai_partition_GRP(binD, nrep, gamma)

meanD = mean(binD, 3);

nroi = size(binD,1);
grpM = zeros(nroi,nrep);
grpQ = zeros(nrep,1);

% fprintf('Calculating Partition repetition: '); str=counter(0,nrep,'num','');
parfor irep = 1:nrep
    
    % str=counter(irep,nrep,'num',str);
    
    [grpM(:,irep), grpQ(irep), iters] = ai_iter_comm_louvain(meanD, gamma);
    
end
lnfeed;

% choose partition with highest modularity
maxQ = max(grpQ);
idx_maxQ = find(grpQ == maxQ);
maxM = grpM(:,idx_maxQ(1));
