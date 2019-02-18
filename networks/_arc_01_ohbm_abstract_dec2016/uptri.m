function vec = uptri(A)

[nrows ncols] = size(A);
if ~(nrows==ncols)
    error('Not a square matrix');
end

c = 1;
for i1 = 1:nrows-1
    for i2 = i1+1:nrows
        vec(c) = A(i1,i2);
        c=c+1;
    end
end
        