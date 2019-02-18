%%
communities = consM_grpYA1;

[can_net, can_mod] = ai_canonical_network('network_codes_234rois.mat');
[sM, sIdx] = sort(communities,'ascend'); 
outvec = can_mod(sIdx);

figure;imagesc(outvec');
colormap([green; yellow; cyan; magenta; purple; red;   blue;  pink;  orange; orange; grey; brown; rosybrown; dimgrey]);

num_communities = max(communities);
start = 1;
for idx=1:num_communities
    count = sum(communities==idx);
    line([0.5 1.5], [start+count-1, start+count-1],...
        'LineWidth',.5,...
        'Color','white');
   
    start = start + count;
end
    
axis off;