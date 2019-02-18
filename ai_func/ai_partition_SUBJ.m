
function [subM, subQ] = ai_partition_SUBJ(binD, gamma, nrep)

% Calculate each subject's partition for thrvec thresholds

nroi = size(binD, 1);
nsub = size(binD, 3);

subQ = zeros(nsub,1);
subM = zeros(nroi,nsub);
   
fprintf('Processing subject: '); str=counter(0,nsub,'num','');
for isub = 1:nsub
    
    str=counter(isub,nsub,'num',str);
    
    subD = binD(:,:,isub);
    
    repM = zeros(nroi,nrep);
    repQ = zeros(nrep,1);
    parfor irep = 1:nrep
        
        [repM(:,irep), repQ(irep), iters] = ai_iter_comm_louvain(subD, gamma);
        
    end
    
    % choose partition with highest modularity
    maxQ = max(repQ);
    idx_maxQ = find(repQ == maxQ);
    maxM = repM(:,idx_maxQ(1));
    
    % load these into the subject-level output
    subQ(isub) = maxQ;
    subM(:,isub) = maxM;
    
end
lnfeed;
    
