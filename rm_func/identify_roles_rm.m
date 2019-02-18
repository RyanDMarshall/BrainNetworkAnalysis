%% Finds the Topological Roles of Each Node in an Adjacency Matrix

%% FUNCTION:
% Returns a n_node x 1 vector, R, whose elements describe the node roles of 
% each node (as defined in the note below)

%% REQUIRES: 
% 'A' is a n_node x n_node adjacency matrix
% 'C' is a n_node x 1 community affiliation vector
% 'minZ' is the threshold required for the cutoff between roles {1,2,3,4}
%       and roles {5, 6, 7}.

% Note: These values are defined below, based off from Guimera and Amaral 
% (2005). 
% R1: Ultra-peripheral    (0.00 < P <= 0.05, Z < 2.5)
% R2: Peripheral          (0.05 < P <= 0.62, Z < 2.5)
% R3: Nonhub connector    (0.62 < P <= 0.80, Z < 2.5)
% R4: Nonhub kinless      (0.80 < P <= 1.00, Z < 2.5)
% R5: Provincial hubs     (0.00 < P <= 0:30, Z > 2.5)
% R6: Connector hubs      (0.30 < P <= 0:75, Z > 2.5)
% R7: Kinless hubs        (0.75 < P <= 1.00, Z > 2.5)

% We use minZ = 1.5 for a more liberal criterion.

function R = identify_roles_rm(A, C, minZ)

    P = participation_coef(A, C);
    D = module_degree_zscore(A, C);

    R1_P_idx = find(P <= 0.05);
    R2_P_idx = find((0.05 < P) & (P <= 0.62));
    R3_P_idx = find((0.62 < P) & (P <= 0.80));
    R4_P_idx = find(P >= 0.80);
    R5_P_idx = find(P <= 0.30);
    R6_P_idx = find((0.30 < P) & (P <= 0.75));
    R7_P_idx = find(P > 0.75);
    
    R1234_D_idx = find(D < minZ);
    R567_D_idx = find(D >= minZ);

    R1 = intersect(R1_P_idx,R1234_D_idx);
    R2 = intersect(R2_P_idx,R1234_D_idx);
    R3 = intersect(R3_P_idx,R1234_D_idx);
    R4 = intersect(R4_P_idx,R1234_D_idx);
    R5 = intersect(R5_P_idx,R567_D_idx);
    R6 = intersect(R6_P_idx,R567_D_idx);
    R7 = intersect(R7_P_idx,R567_D_idx);
    
    R = zeros(length(P),1);
    R(R1) = 1;
    R(R2) = 2;
    R(R3) = 3;
    R(R4) = 4;
    R(R5) = 5;
    R(R6) = 6;
    R(R7) = 7;
    
    
    
    
    
    