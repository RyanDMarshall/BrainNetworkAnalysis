
function ai_scatter(dataYA, dataOA, DV, atitle, xdata, ydata)

dataSS = vertcat(dataYA, dataOA);
nYA = length(dataYA);
nOA = length(dataOA);

assert(nYA+nOA == length(DV));

%%
% plot(dataSS, DV, 'ko'); hold on;

plot(dataSS(1:nYA,:), DV(1:nYA,:), 'bo'); lsline; hold on;
plot(dataSS(nYA+1:end,:), DV(nYA+1:end,:), 'ro'); lsline; hold on;

% plot(dataSS(1:nYA,:), DV(1:nYA,:), 'bo', 'MarkerFaceColor', 'Blue'); lsline; hold on;
% plot(dataSS(nYA+1:end,:), DV(nYA+1:end,:), 'ro', 'MarkerFaceColor', 'Red'); lsline; hold on;

% %%
% [b1 stats1] = robustfit(dataSS, DV);
% %%
% [b2 stats2] = robustfit(dataSS(1:nYA,:), DV(1:nYA,:));
% [b3 stats3] = robustfit(dataSS(nYA+1:end,:), DV(nYA+1:end,:));
% %%
% % plot(dataSS, b1(1)+b1(2)*dataSS,'k', 'LineWidth', 2);
% plot(dataSS(1:nYA,:), b2(1)+b2(2)*dataSS(1:nYA,:),'b', 'LineWidth', 2);
% plot(dataSS(nYA+1:end,:), b3(1)+b3(2)*dataSS(nYA+1:end,:),'r', 'LineWidth', 2);
% 
% xlabel(xdata); ylabel(ydata); title(atitle); 