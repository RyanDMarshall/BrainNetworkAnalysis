function hubs = sort_hubs_rm(hubs)

    names = hubs{1};
    [~, idx] = sort(names,1);
    for i = 1:size(hubs,1)
        temp = hubs{i};
        temp = temp(idx);
        hubs{i} = temp;
    end