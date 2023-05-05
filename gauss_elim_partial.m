function [A, num_swaps] = gauss_elim_partial(A)
% Perform Gaussian elimination with partial pivoting on matrix A

n = size(A, 1);
num_swaps = 0;

for i = 1:n-1
    % Find pivot element and row index for current column
    [pivot, idx] = max(abs(A(i:n, i)));
    idx = idx + i - 1;

    % Swap rows i and idx if necessary
    if idx ~= i
        A([i idx], :) = A([idx i], :);
        num_swaps = num_swaps + 1;
    end

    % Eliminate entries below the pivot element
    for j = i+1:n
        factor = A(j,i) / A(i,i);
        A(j,i:n) = A(j,i:n) - factor * A(i,i:n);
    end
end

end



