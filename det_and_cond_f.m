function [det,cond] = det_and_cond_f(A)

%finding the det(A)
[B, number_of_swaps] = gauss_elim_partial(A);
det = determinant(B, number_of_swaps);

% finding the ||A||F
% basic formula for calculating the f norm is sqrt(sum_i, sum_j (a_ij)^2)
fro_norm = frobenius_norm(A);

%inverting A 
%invert A can be done using partial pivoting
% X is the matrix of unknowns representing the columns of A^{-1}
%P^-1 is the inverse of the permutation matrix P
%PAX = I_n => LUX = P^-1*I_n

%find ||A^-1||F

%find condF
%cond = ||A||F + ||A^-1||F
end

