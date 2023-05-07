function [B, num_swaps] = gauss_elim_partial(A)
% % Perform Gaussian elimination with partial pivoting on matrix A
% 
% n = size(A, 1);
% num_swaps = 0;
% 
% for i = 1:n-1
%     % Find pivot element and row index for current column
%     [pivot, idx] = max(abs(A(i:n, i)));
%     idx = idx + i - 1;
% 
%     % Swap rows i and idx if necessary
%     if idx ~= i
%         A([i idx], :) = A([idx i], :);
%         num_swaps = num_swaps + 1;
%     end
% 
%     % Eliminate entries below the pivot element
%     for j = i+1:n
%         factor = A(j,i) / A(i,i);
%         A(j,i:n) = A(j,i:n) - factor * A(i,i:n);
%     end
% end

%optimized for hessenberg matrices
B = A;
num_swaps = 0;

[rows, ~] = size(B);

for k = 1:rows - 1 
    %check if the entrie below is larger(abs)
    if B(k, k) < B((k + 1), k)
        % swap rows if it is
        B([k (k + 1)],:) = B([(k + 1) k],:);
        num_swaps = num_swaps + 1;
    end
    %eliminate etrie below
    if B((k + 1), k) ~= 0
        l = (B((k + 1), k)) / B(k, k);
        row_piwot = B(k, :);
        row_i = B((k + 1), :);
        row_i = row_i - l * row_piwot;
        B((k + 1), :) = row_i;
    end


end

end



