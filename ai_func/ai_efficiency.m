
function [Eglob,Eloc] = ai_efficiency(Z,thrvec)

% if thrvec = [0] then it assumes that the input was a thresholded binary
% matrix.

nroi = size(Z,1);
nsub = size(Z,3);
nthr = length(thrvec);

Eglob = zeros(nsub,nthr);
Eloc = zeros(nroi,nsub,nthr);

% binarize
if sum(thrvec) > 0
    A = ai_binarize(Z,thrvec);
else
    A = Z;
end

fprintf('Calculating Effic. threshold: '); str=counter(0,nthr,'num','');
for ithr = 1:nthr
    
    str=counter(ithr,nthr,'num',str);
    
    for isub = 1:nsub
    
        Eglob(isub,ithr) = efficiency_bin(A(:,:,isub,ithr));
        Eloc(:,isub,ithr) = efficiency_bin(A(:,:,isub,ithr),1);
        
    end
    
end
lnfeed;

