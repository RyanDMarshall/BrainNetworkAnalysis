 
function mstthr = find_mst_thresh2(rawZ, thrvec)

% minimum spanning tree

isfound = false;

for i = 1:length(thrvec)
    
    % thrZ = ai_cost_thresh(rawZ, thrvec(i));
    
    thrZ = ai_binarize(rawZ, thrvec(i));
    
    if isconnected(thrZ)
        mstthr = thrvec(i);
        isfound = true;
        break;
    end
    
end

if ~isfound
    mstthr = 0;
end
    
