
function P = ai_participation(Z,thrvec,Ci)

% if thrvec = [0] then it assumes that the input was a thresholded binary
% matrix.

nroi = size(Z,1);
nsub = size(Z,3);
nthr = length(thrvec);

P = zeros(nroi,nsub,nthr);

% binarize
if sum(thrvec) > 0
    A = ai_binarize(Z,thrvec);
else
    A = Z;
end

fprintf('Calculating Partic. threshold: '); str=counter(0,nthr,'num','');
for ithr = 1:length(thrvec)
    
    str=counter(ithr,nthr,'num',str);
    
    for isub = 1:nsub
    
        P(:,isub,ithr) = participation_coef(A(:,:,isub,ithr),Ci);
        
    end
    
end
lnfeed;
