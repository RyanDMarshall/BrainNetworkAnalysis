
function ai_drawmatrix(amatrix, minmax, colorize, communities, flag)

yellow     = [1,1,0];
magenta    = [1,0,1];
cyan       = [0,1,1];
red        = [1,0,0];
green      = [0,1,0];
blue       = [0,0,1];
white      = [1,1,1];
black      = [0,0,0];
grey       = [.5,.5,.5];
pink       = [255,192,203]./255;
orange     = [255,165,0]./255;
slategrey  = [112,128,144]./255;
brown      = [165,42,42]./255;
rosybrown  = [188,143,143]./255;
dimgrey    = [105,105,105]./255;
purple     = [128,0,128]./255;

linewidth = 2;

num_communities = max(communities);

labels = {};

% default flags
offdiag = 1;
% set flags
if length(flag)
    
    switch flag
        case 'nooffdiag'
            offdiag = 0;
        otherwise
    end
    
end

% off diag elements
if length(communities) && (offdiag == 0)
    
    start = 1;
    mask = zeros(size(amatrix));
    for idx=1:num_communities
        count = sum(communities==idx);
        
        mask(start:start+count-1,start:start+count-1) = 1;
                
        start = start + count;
    end
    
    amatrix = amatrix .* mask;
    
end

% apply scale
if length(minmax)
    imagesc(amatrix, minmax);
else
    imagesc(amatrix);
end

% apply colormap
switch colorize
    case 'net7'
        labels = {'', 'DAN', 'FPN', 'VAN', 'CON', 'SaN', 'DMN', 'Vis'};
        % colormap([0,0,0; 0,1,0; 1,1,0; 0,1,1; 1,0,1; .5,.5,.5; 1,0,0; 0,0,1]);
        colormap([black; green; yellow; cyan; magenta; grey; red; blue]);
        ticks = 0:1:7;
    case 'net14'
        labels = {'',    'DAN', 'FPN', 'VAN', 'CON',   'SaN', 'DMN', 'Vis', 'Aud', 'Han',  'Mou',  'Mem',    'Sub',  'Crb', 'Unc'};
        colormap([black; green; yellow; cyan; magenta; purple; red;   blue;  pink;  orange; orange; grey; brown; rosybrown; dimgrey]);
        ticks = 0:1:14;
    otherwise
        colormap(colorize);
end

% show legend
if length(labels)
    numcolors = length(labels);
    c = colorbar;
    c.TickLabels = labels;
    c.Ticks = ticks;
    c.YTick = [0+0.5*(numcolors-1)/numcolors:(numcolors-1)/numcolors:numcolors];
else
    c = colorbar;
end

% draw communities
if length(communities)
    
    start = 1;
    for idx=1:num_communities
        
        count = sum(communities==idx);
        
        % thick lines around modules
%         line([start, start+count-1], [start+count-1, start+count-1],...
%             'LineWidth',linewidth,...
%             'Color','white');
%         line([start, start+count-1], [start, start],...
%             'LineWidth',linewidth,...
%             'Color','white');
%         line([start+count-1, start+count-1],[start, start+count-1],...
%             'LineWidth',linewidth,...
%             'Color','white');
%         line([start, start],[start, start+count-1],...
%             'LineWidth',linewidth,...
%             'Color','white');
        
        % thin lines across matrix
%         line([0, length(communities)], [start+count-1, start+count-1],...
%             'LineWidth',linewidth/4,...
%             'Color','white');
%         line([start+count-1, start+count-1], [0, length(communities)],...
%             'LineWidth',linewidth/4,...
%             'Color','white');
        
        % thin lines across matrix
        line([.5, length(communities)+.5], [start+count-.5, start+count-.5],...
            'LineWidth',linewidth/2,...
            'Color','white');
        line([start+count-.5, start+count-.5], [.5, length(communities)+.5],...
            'LineWidth',linewidth/2,...
            'Color','white');
                
        start = start + count;
    end
    
end

axis off;
set(gcf,'color','w');





