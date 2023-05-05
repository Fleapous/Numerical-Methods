function result = determinant(A, n)
% Multiply the multiplication of elements on the main diagonal of matrix A by (-1)^n

product = 1;
for i = 1:min(size(A))
    product = product * A(i,i);
end

result = product * (-1)^n;
end
