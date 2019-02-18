%% Finds Minimal Connectivity Threshold for an Adjacency Matrix

%% FUNCTION:
% Tests multiple values in thrrng to see the minimal value needed to
% guarantee node-connectedness. Here, the value defines the threshold at
% which A is to be binarized.

%% REQUIRES: 
% 'A' is a n_node x n_node adjacency matrix

function thrvec = find_conn_thresh_rm(A)
    thrrng=(0.02:0.01:0.35);
    thrvec=zeros(size(A,3),1);
    for isub=1:size(A,3)
        for i=thrrng
            connA = (threshold_proportional(A(:,:,isub), i));
            if (isConnected_rm(connA))
                thrvec(isub) = i;
                break;
            end
        end
    end

