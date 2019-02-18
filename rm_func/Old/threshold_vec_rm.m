function V_new = threshold_vec_rm(V, thr)
    for i=1:size(V,2)
        V_sort = sort(V(:,i), 'descend');
        val = V_sort(ceil(length(V_sort)*thr));
        V_new(:,i) = double((V(:,i) >= val)).*V(:,i);
    end