function [] = plot_link_given_PD_rm(A, commLink, roles, group, gamma)
    roles = roles{2};
    M = nodePart_rm(ConstructEdgeMatrix_rm(A, commLink));
    
    for i=0:max(M)
        nComm(i+1) = {find(M == (i))};
    end
    
    for i=1:7
        nRoles(i) = {find(roles == i)};
    end
    
    for i=0:max(M)
        for j=1:7
            comm_idx = cell2mat(nComm(i+1));
            role_idx = cell2mat(nRoles(j));
            common(i+1,j) = length(intersect(comm_idx,role_idx));
        end
    end
    
    figure;
    h = bar3(common);
    hh = get(h(3), 'parent');
    set(hh, 'yticklabel', 0:max(M));
    set(hh, 'xticklabel', 1:7);
    xlabel('Node Role')
    ylabel('Number of Link Communities');
    zlabel('Frequency');
    title(['Frequency distribution for ' group ' at gamma = ' num2str(gamma)]);
    axis([0 8 0 (max(M)+2) 0 ceil(1.1*max(max(common)))]);