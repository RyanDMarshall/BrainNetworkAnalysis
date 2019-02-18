function outvec = ai_reorder(origvec, neworder)

maxorig = max(origvec);

for idx = 1:maxorig
    
    origvec(origvec == idx) = neworder(idx) * 100;
    
end

outvec = origvec / 100;