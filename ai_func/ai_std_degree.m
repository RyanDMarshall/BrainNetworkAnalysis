function WD_Net = ai_std_degree(Z, NetID, Mvec, thrvec)

nthr = length(thrvec);
nsub = size(Z,3); 
A = ai_binarize(Z,thrvec); % binarize 

% isolate the network
thrNet = A(find(Mvec==NetID),find(Mvec==NetID),:,:);

% calculate degree for each node
for isub = 1:nsub
    
    for ithr = 1:nthr
    
        kNet(:,isub,ithr) = degrees_und(thrNet(:,:,isub,ithr));
        
    end
    
end

% how many nodes in network
nnod = size(kNet,1);

% calculate mean degree within network
mkNet = squeeze(mean(kNet,1));
% calculate std degree within network
skNet = squeeze(std(kNet,0,1));

% calculate standardized degree for each node within network
for inod = 1:nnod
    
    for isub = 1:nsub
        
        for ithr = 1:nthr
            
            WD_Net(inod,isub,ithr) = (kNet(inod,isub,ithr)-mkNet(isub,ithr)) / skNet(isub,ithr);
            
        end
    end
end
