function result = frobenius_norm(A)
% Compute the Frobenius norm of matrix A

sum_squares = 0;
for i = 1:size(A,1)
    for j = 1:size(A,2)
        sum_squares = sum_squares + A(i,j)^2;
    end
end

result = sqrt(sum_squares);
end


