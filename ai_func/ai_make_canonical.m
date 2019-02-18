
%%
clear; clc;

%%

load('w3aRS_YAOA12_264_dartel_nodist_rawdata.mat');

%%
nrois = length(rois);

%% Make net_codes
for i = 1:nrois
    roi_labels{i} = rois{i}(1:3);
end

for i = 1:nrois
    switch roi_labels{i}
        case 'DAN'
            net_codes(i) = 1;
        case 'FPN'
            net_codes(i) = 2;
        case 'VAN'
            net_codes(i) = 3;
        case 'CON'
            net_codes(i) = 4;
        case 'SaN'
            net_codes(i) = 5;
        case 'DMN'
            net_codes(i) = 6;
        case 'Vis'
            net_codes(i) = 7;
        case 'Aud'
            net_codes(i) = 8;
        case 'Han'
            net_codes(i) = 9;
        case 'Mou'
            net_codes(i) = 10;
        case 'Mem'
            net_codes(i) = 11;
        case 'Sub'
            net_codes(i) = 12;
        case 'Crb'
            net_codes(i) = 13;
        case 'Unc'
            net_codes(i) = 14;
    end
end

%%
orig_net = zeros(nrois,nrois);
ncomm = max(net_codes);
start = 1;
for idx = 1:ncomm
    count = sum(net_codes == idx);
    orig_net(start:start+count-1,start:start+count-1) = idx;
    start = start + count;
end
for i=1:nrois, orig_net(i,i)=0; end;
figure; ai_drawmatrix(orig_net,[],'net14',net_codes,[]);    

canonical_M = net_codes;

save(['network_codes_' num2str(nrois) 'rois.mat'],'canonical_M','nrois','roi_labels','rois');