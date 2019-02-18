
function ai_sigstar_lo(pvals, thrvec, yrange, ff)

% offset_x = -.0015;
offset_x = -.001 * ff;
offset_y = .01;

for i=1:length(thrvec)
    if pvals(i) < .05, text(thrvec(i)+offset_x,yrange(1)+offset_y,'*', 'Color', 'k', 'FontSize', 12); end 
end