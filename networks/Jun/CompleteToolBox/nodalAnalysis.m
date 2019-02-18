%% Nodal level analysis %%
% Given a path to an anafile, this function calculates binarized community
% structure by calling (cost_thresh, modularity_und, and communityMatrix)
% for each subject (39 subejcts).Then, function calculates correlation 
% coefficients between every subjects for each node - result is a cell
% array of size 1 by 160, where each cell contains a matrix 39 X 39. It
% then sparates the result matrix into three sections (YA vs YA, OA vs OA,
% and YA vs OA), then stores these 3 vector results in a cell array of size
% 1 by 160
% Usage:
% anafile = '/C/folder/anafile.mat';
% toolBoxPath = '/C/folder/toolbox';
% threshValue = 0.05
% result = nodalAnalysis(anafile, toolBoxPath, threshValue);


function vectorizedResults = nodalAnalysis(anafile, toolBoxPath, threshValue)

    %Add paths to all dependencies. Path to a toolBox%
    addpath(toolBoxPath);
    addpath([toolBoxPath '/BCT']);
    %Extract matrix and ROI names from anafile%
    [A ROIs] = BASCO_get_matrix_func(anafile);
    
    
    %Set variables%
    numNodes = size(ROIs,2);
    numSubjects = size(A,3);
    numYA = 20;
    numOA = 19;

    % store matrix results in cellarray %
    binaryMatrixNodalLevel = cell(1,numSubjects);

    for i=1:numSubjects
        % 5-percent threshold
        costResult = cost_thresh(A(:,:,i), threshValue);
        % running modularity_und to get community structures
        communityStructure = modularity_und(costResult);
        % running communityMatrix -> binarize community structures between
        % nodes
        communityMatrixResult = communityMatrix(communityStructure);
        % add the result to the cell array
        binaryMatrixNodalLevel{1,i} = communityMatrixResult;
    end

    %% Calculate Phi coefficients across subjects %%
    % Calculating phi coefficient between different subjects in same node %
    % Node1 -> subject i vs. subject j -> get coefficient %
    % Create a matrix for each node and save it to a cell array %

    %create cell array with legnth of number of nodes
    nodesCoefBtwSubjs = cell(1,numNodes);

    % for every node from 1 to 160 %
    % Later, can optimize this because we can stop in the middle %
    % We only need half of the matrix %
    for nodeIdx=1:numNodes
        % for every subject %
        for subjIdx=1:numSubjects
            % compare subject vs. all subjects %
            for compSubj=1:numSubjects
                coefVal = corrcoef(binaryMatrixNodalLevel{1,subjIdx}(nodeIdx,:), binaryMatrixNodalLevel{1,compSubj}(nodeIdx,:));
                nodesCoefBtwSubjs{1,nodeIdx}(subjIdx,compSubj) = coefVal(1,2);
            end
        end
    end

    %% Seperate coefficients into YA, OA, YA + OA and store them in to separate vectors %%
    % Current version will include 1's (node 1 and node 1 will have 1 %
    % Later we can exclude 1's %

    vectorizedResults = cell(1, numNodes);

    for nodeIdx=1:numNodes
        %Create three new vectors for each node
        YAVector = [];
        OAVector = [];
        YAOAVector = [];
        for y=1:numSubjects
            for x=y:numSubjects
                %don't store diagonal values which is one
                
                if ( (y <= numYA) && (x <= numYA) && (y ~= x) )
                    YAVector = [YAVector nodesCoefBtwSubjs{1, nodeIdx}(x,y)];
                elseif ( (y <= numYA) && (x >= numYA + 1) && (y ~= x) )
                    YAOAVector = [YAOAVector nodesCoefBtwSubjs{1, nodeIdx}(x,y)];
                elseif ( (y >= numYA + 1) && (x >= numYA + 1) && (y ~= x) )
                    OAVector = [OAVector nodesCoefBtwSubjs{1, nodeIdx}(x,y)];
                end
            end
        end
        %After going thorugh a node's matrix, add those vectors
        vectorizedResults{1, nodeIdx}{1} = YAVector;
        vectorizedResults{1, nodeIdx}{2} = OAVector;
        vectorizedResults{1, nodeIdx}{3} = YAOAVector;
    end
end
