
function NMI = ai_nmi(M1, M2)

% Calculate NMI

N1 = size(M1,2);
N2 = size(M2,2);

NMI = zeros(N1+N2, N1+N2);

for i1 = 1:N1-1
    for i2 = i1+1:N1
        
        [VIn NMI(i1, i2)] = partition_distance(M1(:,i1),M1(:,i2));
        
    end
end

for i1 = 1:N2-1
    for i2 = i1+1:N2
        
        [VIn NMI(N1+i1, N1+i2)] = partition_distance(M2(:,i1),M2(:,i2));
        
    end
end

for i1 = 1:N1
    for i2 = 1:N2
        
        [VIn NMI(i1,N1+i2)] = partition_distance(M1(:,i1),M2(:,i2));
        
    end
end

% need to simmetrize matrix
NMI = NMI + NMI.';