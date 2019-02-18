function mH_sumR = ai_thresh_Hnull(grp_name, thrvec, randpath)

% randpath = './rand/';

nthr = length(thrvec);

%% Constructing null model
nrep = 500;

H_sumR = zeros(nthr,nrep);

fprintf('Processing %s...\n', grp_name);
fprintf('Null model, threshold '); str=counter(0,nthr,'num','');
for ithr = 1:nthr

    str=counter(ithr,nthr,'num',str);
    
    clear('binR');
    load([randpath 'rand_' grp_name '_' num2str(thrvec(ithr)) '.mat'], 'binR');
    
    [nroi, ~, nsub, nver] = size(binR); % nver = # randomized matrices per subject
    
    seq = zeros(nrep, nsub); 
    for irep = 1:nrep
    
        % generate sequence re: which randomization is selected for each
        % subject
        seq(irep,:) = round((nver-1) .* rand(nsub,1) + 1);
        
        selR = zeros(nroi,nroi,nsub);
        for isub = 1:nsub
        
            selR(:,:,isub) = binR(:,:,isub,seq(irep,isub));
            
        end
        
        % calculate entropy for each repetition
        H_sumR(ithr,irep) = ai_entropy(uptri(sum(selR, 3)),1);
        
    end
    
end
lnfeed;
% average entropy for each threshold
mH_sumR = mean(H_sumR,2)';