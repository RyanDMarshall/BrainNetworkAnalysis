
function mvec = ai_mean_uptri(A)

fprintf('ai_mean_uptri changed - uses ALL values\n');

nsub = size(A,3);

for c=1:nsub
    
    % mvec(c) = mean(nonzeros(uptri(A(:,:,c))));
    
    % Geerligs (2015): sum of all corelations divided by the number of
    % possible correlations - thus, zero values are included!
    
    mvec(c) = mean(uptri(A(:,:,c)));
    
end
