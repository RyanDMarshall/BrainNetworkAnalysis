
function eCI = ai_confid(D)

% x = randi(50, 1, 100);                      % Create Data

for col = 1:size(D,2)
    x = D(:,col)';
    SEM = std(x)/sqrt(length(x));               % Standard Error
    ts = tinv([0.025  0.975],length(x)-1);      % T-Score
    CI = mean(x) + ts*SEM;                      % Confidence Intervals
    eCI(col) = (CI(2)-CI(1))/2;
end