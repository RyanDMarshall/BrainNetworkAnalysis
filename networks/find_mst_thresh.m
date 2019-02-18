 
function mstthr = find_mst_thresh(rawZ, thrvec)

% minimum spanning tree

w_st = zeros(length(thrvec),1);

isfound = false;

for i = 1:length(thrvec)
    
    % thrZ = ai_cost_thresh(rawZ, thrvec(i));
    
    thrZ = ai_binarize(rawZ, thrvec(i));
    
    [w_st(i), ~, ~] = kruskal(thrZ, thrZ);
    
    if w_st(i) >= size(rawZ, 1)-1
        mstthr = thrvec(i);
        isfound = true;
        break;
    end
    
end

if ~isfound
    mstthr = 0;
end
    
