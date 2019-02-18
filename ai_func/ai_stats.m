function ai_stats(YA1, OA1, YA2, OA2, ananame)

nYA = length(YA1);
nOA = length(OA1);

assert(nYA == length(YA2));
assert(nOA == length(OA2));

%% Effect of time 
[pval_YA12, t_orig, crit_t, est_alpha, seed_state]=mult_comp_perm_t1(YA1-YA2,50000);
[pval_OA12, t_orig, crit_t, est_alpha, seed_state]=mult_comp_perm_t1(OA1-OA2,50000);

fprintf('\n***** Statistics for %s ******\n\n', ananame);

fprintf('Means:\n');
fprintf('YA1 : %6.4f\n', mean(YA1));
fprintf('OA1 : %6.4f\n', mean(OA1));
fprintf('YA2 : %6.4f\n', mean(YA2));
fprintf('OA2 : %6.4f\n\n', mean(OA2));

%% ANOVA
fprintf('ANOVA results:\n');
ranova2x2(vertcat(horzcat(YA1, YA2), horzcat(OA1, OA2)), nYA, nOA);
%% t-tests between
fprintf('Between-Ss t-tests\n'); 
fprintf('YA1 vs. OA1:\n'); 
ttest_between(YA1, OA1);
fprintf('YA2 vs. OA2:\n'); 
ttest_between(YA2, OA2);
%% t-test within
fprintf('Within-Ss t-tests\n'); 
fprintf('YA1 vs. YA2:\n'); 
ttest_within(YA1, YA2);
fprintf('OA1 vs. OA2:\n'); 
ttest_within(OA1, OA2);
%% t-test interaction
fprintf('Interaction t-test\n'); 
fprintf('YA1-YA2 vs. OA1-OA2:\n'); 
ttest_between(YA1-YA2, OA1-OA2);

%% Effect of group
fprintf('Effect of group: YA1 vs OA1 & YA2 vs OA2 (mattest):');
mattest(vertcat(YA1', YA2'), vertcat(OA1', OA2'), 'permute', 10^4)
%% Effect of time
fprintf('Effect of time - within-Ss (mattestvec):\n');
fprintf('YA1 vs. YA2:\n'); 
mattestvec(YA1'-YA2',zeros(1,nYA), 'permute', 10^4)
fprintf('OA1 vs. OA2:\n'); 
mattestvec(OA1'-OA2',zeros(1,nOA), 'permute', 10^4)
%%
fprintf('Effect of time - within-Ss (mult_comp_perm_t1):\n');
fprintf('YA1 vs. YA2:\n'); 
disp(pval_YA12); 
fprintf('OA1 vs. OA2:\n'); 
disp(pval_OA12);
%% Interaction
fprintf('Group x Time (mattestvec):\n');
mattestvec(YA1'-YA2',OA1'-OA2', 'permute', 10^4) 
