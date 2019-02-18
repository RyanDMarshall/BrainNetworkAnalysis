function [H_sumD, binD] = ai_thresh_Hact(D, thrvec)

[nroi, ~, nsub] = size(D);
nthr = length(thrvec);

%% Calculate entropy in actual data
binD = zeros(nroi,nroi,nsub,nthr);
H_sumD = zeros(1,nthr);

fprintf('Actual data, threshold: '); str=counter(0,nthr,'num','');
for ithr = 1:nthr
    
    str=counter(ithr,nthr,'num',str);
  
    % binarized each subject's matrix by setting to 1 all values above
    % threshold and to 0 other values
    % note: this only takes into account pos links (see > 0), so you need
    % to run diagn_thresh_neglinks to see when neg links start to appear
    for isub = 1:nsub
        binD(:,:,isub,ithr) = (threshold_proportional(D(:,:,isub), thrvec(ithr)) > 0);
    end
    
    % % diagnostic version
    % sum_binD(:,:,ithr)  = sum(binD(:,:,:,ithr), 3);
    % % uses custom uptri b/c the matrix may have zeros off-diagonal
    % uptri has been optimized to not use for loops
    % H_sumD(ithr) = ai_entropy(uptri(sum_binD(:,:,ithr)),1);
    
    % in one shot
    H_sumD(ithr) = ai_entropy(uptri(sum(binD(:,:,:, ithr), 3)),1);
        
end
lnfeed;

