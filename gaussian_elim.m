function [U, num_swaps, Hinv] = gaussian_elim(A)
% Perform Gaussian elimination with partial pivoting on matrix A
num_swaps = 0;
[n, ~] = size(A);
I = eye(n);
M = [A I];

% Generating U
for k = 1:n - 1 

    %finding the largest value(abs)
    [~,i] = max(abs(A(k:n,k)));
    i = i+k-1;
    if i ~= k
        M([k i],:) = M([i k],:);
        num_swaps = num_swaps + 1;
    end

    % eliminate entry below
    if M((k + 1), k) ~= 0
        l = (M((k + 1), k)) / M(k, k);
        row_pivot = M(k, :);
        row_i = M((k + 1), :);
        row_i = row_i - l * row_pivot;
        M((k + 1), :) = row_i;
    end
end

% Extracting U from M
U = triu(M(:,1:n));

% Continuing with the inversion
for k = n:-1:2
    for j = k-1:-1:1
        factor = M(j,k) / M(k,k);
        M(j,:) = M(j,:) - factor * M(k,:);
    end
end

% Dividing each row by its diagonal value
for k = 1:n
    M(k,:) = M(k,:) / M(k,k);
end

% Extracting inverse matrix from M
Hinv = M(:,n+1:end);
end


