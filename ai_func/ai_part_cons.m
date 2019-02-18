 function [consM_grp, avgQ, avgNMI] = ai_part_cons(W, gamma, tau, nrep_sub, nrep_grp)

nSS = size(W, 3);

try parpool(16); catch, end;

%% partition every subject n times
for isub = 1:nSS
    
    parfor irep = 1:nrep_sub
        
        %% iterative community finetuning
        M(:,irep,isub) = ai_iter_comm_louvain(W(:,:,isub),gamma);
        
    end
        
end

%% build consensus at the subject level
parfor isub = 1:nSS
    
    agrD_ind(:,:,isub) = agreement(squeeze(M(:,:,isub)))./nrep_sub;
    
    %% custom gamma
    consM_ind(:,isub) = ai_consensus_und_gamma(agrD_ind(:,:,isub), tau, nrep_grp, gamma);
        
end

%% build consensus at the group level
agrD_grp = agreement(consM_ind)./nSS;

%% custom gamma
[consM_grp, avgQ] = ai_consensus_und_gamma_q(agrD_grp, tau, nrep_grp, gamma);
