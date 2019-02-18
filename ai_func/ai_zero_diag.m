function M = ai_zero_diag(M)

[r,c] = size(M);

assert(r==c,'Not a square matrix!');

M = M .* ~eye(r);
