function v = uptri(A)

% original:
% https://www.mathworks.com/matlabcentral/newsreader/view_thread/278808
% m = magic(5)
% i = triu(ones(5), 1)
% v = m(find(i))

[nrows ncols] = size(A);
if ~(nrows==ncols)
    error('Not a square matrix');
end

i = triu(ones(nrows), 1);
v = A(find(i));

