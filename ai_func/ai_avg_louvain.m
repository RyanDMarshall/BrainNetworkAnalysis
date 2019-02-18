function mQ = ai_avg_louvain(binD, thrvec, nrep, gamma)

% runs Louvain nrep times and outputs average Q
thrvec=thrvec.';
nthr = length(thrvec);
nsub = size(binD,3);

mQ = zeros(nsub,nthr);

try parpool(16); catch, end;

fprintf('Calculating modularity for %s...\n', inputname(1));

for ithr = 1:nthr
    fprintf('Threshold:  %d/%d; Subject ', ithr, nthr); str=counter(0,nsub,'num','');
    
    for isub = 1:nsub
        str=counter(isub,nsub,'num',str);
        
        S = binD(:,:,isub,ithr);
        
        rQ = zeros(nrep,1);
        parfor irep = 1:nrep
            
            [~, rQ(irep)] = ai_iter_comm_louvain(S, gamma);
            
        end
        
        mQ(isub,ithr) = mean(rQ);
        
    end
    lnfeed;
    
end
