function [det,cond] = det_and_cond_f(A)

%finding the det(A)
[B, number_of_swaps] = gauss_elim_partial(A);
det = determinant(B, number_of_swaps);

% finding the ||A||F
% basic formula for calculating the f norm is sqrt(sum_i, sum_j (a_ij)^2)
fro_norm = frobenius_norm(A);

%inverting A 
Ainv = invert_hessenberg(A);

%find ||A^-1||F
fro_norm_inv = frobenius_norm(Ainv);

%find condF
%cond = ||A||F * ||A^-1||F
cond = fro_norm * fro_norm_inv;
end

