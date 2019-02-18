function ai_thresh_wrand(binD, grp_name, thrvec, randpath)

[nroi, ~, nsub, nthr] = size(binD);

%% Randomize actual data and write to disk
nrep = 50; % how many randomizations for each subject

% randpath = './rand/'; % where the data will be written

try parpool(16); catch, end;

fprintf('Generating random matrices for %s...\n', grp_name);
for ithr = 1:nthr
    
    binR = zeros(nroi,nroi,nsub,nrep);
    
    tic; fprintf('Threshold:  %d/%d; Subject ', ithr, nthr);
    str=counter(0,nsub,'num','');
    
    for isub = 1:nsub
        str=counter(isub,nsub,'num',str);
        
        S = binD(:,:,isub,ithr);
        
        % 50 randomization per subject
        parfor irep = 1:nrep
        
            % using random null model
            binR(:,:,isub,irep) = randomizer_bin_und(S,1);
        
        end
        
    end
    fprintf(' > '); toc;
    
    save([randpath 'rand_' grp_name '_' num2str(thrvec(ithr)) '.mat'], 'binR');
    
end