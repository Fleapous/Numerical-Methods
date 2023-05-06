function Ainv = invert_matrix(A)
% Compute the inverse of matrix A using Gaussian elimination.

% Augment A with the identity matrix.
n = size(A, 1);
I = eye(n);
M = [A I];

%can use the existing gauss_elim_partial function for future
for i = 1:n
    [~, j] = max(abs(M(i:n,i)));
    j = j + i - 1;
    M([i j], :) = M([j i], :);
    for k = 1:n
        if k ~= i
            m = M(k,i) / M(i,i);
            M(k,:) = M(k,:) - m * M(i,:);
        end
    end
    M(i,:) = M(i,:) / M(i,i);
end

Ainv = M(:, n+1:end);
end

