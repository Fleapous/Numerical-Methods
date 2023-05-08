function [U, num_swaps, Hinv] = gaussian_elim(A)
% Perform Gaussian elimination with partial pivoting on matrix A
num_swaps = 0;
[n, ~] = size(A);
I = eye(n);
M = [A I];

%generating U
for k = 1:n - 1 
    %check if the entrie below is larger(abs)
    if M(k, k) < M((k + 1), k)
        % swap rows if it is
        M([k (k + 1)],:) = M([(k + 1) k],:);
        num_swaps = num_swaps + 1;
    end
    %eliminate etrie below
    if M((k + 1), k) ~= 0
        l = (M((k + 1), k)) / M(k, k);
        row_piwot = M(k, :);
        row_i = M((k + 1), :);
        row_i = row_i - l * row_piwot;
        M((k + 1), :) = row_i;
    end
end
%extracting U from M
U = M(:,1:n);

%continuing with the inversion
for k = 2:n
    for j = 1:k-1
        factor = (M((k - j), k)) / M(k , k);
        M(k-j,:) = M(k-j,:) - factor * M(k,:);
    end
end

%deviding each row by its diag value
for k = k:n
    M(k,:) = M(k,:) / M(k,k);
end

%extracting I from M
Hinv = M(:,n+1:end);
end

