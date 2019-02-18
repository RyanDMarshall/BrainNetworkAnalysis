
function binD = ai_binarize(D, thrvec)

[nroi, ~, nsub] = size(D);
nthr = length(thrvec);

binD = zeros(nroi,nroi,nsub,nthr);

% fprintf('Binarizing %s; threshold: ', inputname(1)); str=counter(0,nthr,'num','');
for ithr = 1:nthr
    
    % str=counter(ithr,nthr,'num',str);
  
    % binarized each subject's matrix by setting to 1 all values above
    % threshold and to 0 other values
    for isub = 1:nsub
        binD(:,:,isub,ithr) = (threshold_proportional(D(:,:,isub), thrvec(ithr)) > 0);
    end
end
% lnfeed;
