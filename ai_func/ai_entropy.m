function H = ai_entropy(x, res)

% the binning resolution
% NOTE: this will have an effect on the numerical computation of
% entropy
% If binning is too fine and there are empty bins, you will get NaNs
% If binning is too coarse you will underestimate the entropy
% a slight correction can be made by deleting empty bins before
% computing entropy (see below),
% but this should be done with caution and results should be tested
% for accuracy as sample size and bin size are varied

% clear all
% x = round(1000.*randn(1000,1));
% res = 1;

bins = min(x) : res : max(x);

% the frequency distribution of x
f_x = hist(x, bins);

% approximate probability density of x (e.g., area sums to 1)
p_x = f_x ./ sum(f_x);
clip = find(p_x == 0);
p_x(clip) = [];
bins(clip) = [];

% display
% subplot(3, 1, 1)
% bar(bins, p_x)
% title('Original distribution')
% xlabel('x')
% ylabel('p_x')

% Shannon entropy (discrete approximation)
H = -sum( p_x .* log2(p_x) );