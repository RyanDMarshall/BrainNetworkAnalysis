
function distances = ai_rois_distance(indexfile, roisdir)
% distances = ai_rois_distance(indexfile, roisdir)
%
% Returns matrix of ROI distances.
%
% Input
%     indexfile : text file containing the ROIs
%     roisdir   : location of MarsBAR 

fid = fopen(indexfile);
rois = textscan(fid, '%s');
fclose(fid);

nrois = size(rois{1},1);
centers = cell(nrois,[]);
distances = zeros(nrois, nrois);

for i = 1:nrois
    
    roifile = rois{1}{i};
    roifile = [roifile '.mat'];
    
    load(fullfile(roisdir, roifile));
    centers{i} = centre(roi);
    clear roi;
    
end
    
for i = 1:nrois
    for j = 1:nrois
        
        distances(i, j) = norm(centers{i}-centers{j});
        
    end
end
