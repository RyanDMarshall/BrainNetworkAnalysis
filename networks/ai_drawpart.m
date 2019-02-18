
function ai_drawpart(apart, colorize, communities)

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

linewidth = 4;

num_communities = max(communities);

labels = {};

imagesc(apart);

%% apply colormap
switch colorize
    case 'net7'
        labels = {'DAN', 'FPN', 'VAN', 'CON',   'SaN', 'DMN', 'Vis'};
        colormap([green; yellow; cyan; magenta; grey;  red;   blue]);
        ticks = 0:1:7;
    case 'net14'
        labels = {'DAN', 'FPN', 'VAN', 'CON',   'SaN', 'DMN', 'Vis', 'Aud', 'Han',  'Mou',  'Mem', 'Sub', 'Crb',     'Unc'};
        colormap([green; yellow; cyan; magenta; purple; red;   blue;  pink;  orange; orange; grey; brown; rosybrown; dimgrey]);
        ticks = 0:1:14;
    case 'net5'
        labels = {'FPN', 'SMN', 'Vis', 'DMN', 'CON'};
        colormap([yellow; green; blue; red;   magenta; grey; grey]);
    otherwise
        colormap(colorize);
end

%% show legend
% if length(labels)
%     numcolors = length(labels);
%     c = colorbar;
%     c.TickLabels = labels;
%     c.Ticks = ticks;
%     c.YTick = [0+0.5*(numcolors-1)/numcolors:(numcolors-1)/numcolors:numcolors];
% else
%     c = colorbar;
% end

if length(communities)
    
    start = 1;
    for idx=1:num_communities
        
        count = sum(communities==idx);
        
        % thin lines across matrix
        line([.5, length(communities)+.5], [start+count-.5, start+count-.5],...
            'LineWidth',linewidth,...
            'Color','k');
        line([start+count-.5, start+count-.5], [.5, length(communities)+.5],...
            'LineWidth',linewidth,...
            'Color','k');
                
        start = start + count;
    end
    
end

axis off;
% set(gcf,'color','w');

