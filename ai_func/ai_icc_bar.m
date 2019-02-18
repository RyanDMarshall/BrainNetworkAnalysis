function ai_icc_bar(All, YA, OA)

b = bar([All, YA, OA]); set(gca,'XTickLabel', {'YA+OA', 'YA', 'OA'}); % ylabel('ICC score'); 

b.FaceColor = 'cyan';

if min([All, YA, OA]) > 0
    LB = 0;
else
    LB = min([All, YA, OA]);
end
ylim([LB 1]);

x = [1 2 3];
y = [All, YA, OA];

text(x,y',num2str(y','%0.3f'),... 
'HorizontalAlignment','center',... 
'VerticalAlignment','bottom')

% text(0.05,.1,'Poor'); line([0 4],[.2 .2], 'Color','Black', 'LineStyle','--', 'LineWidth',1);
% text(0.05,.3,'Fair'); line([0 4],[.4 .4], 'Color','Black', 'LineStyle','--', 'LineWidth',1);
% text(0.05,.5,'Moderate'); line([0 4],[.6 .6], 'Color','Black', 'LineStyle','--', 'LineWidth',1);
% text(0.05,.7,'Strong'); line([0 4],[.8 .8], 'Color','Black', 'LineStyle','--', 'LineWidth',1);
% text(0.05,.9,'Perfect');


