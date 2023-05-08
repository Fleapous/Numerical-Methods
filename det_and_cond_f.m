function [det,cond] = det_and_cond_f(A)

[U, num_swaps, Hinv] = gaussian_elim(A);

%finding the det(A)
det = determinant(U, num_swaps);

%find ||A^-1||F
fro_norm_inv = frobenius_norm(Hinv);

% finding the ||A||F
fro_norm = frobenius_norm(A);

%find condF
%cond = ||A||F * ||A^-1||F
cond = fro_norm * fro_norm_inv;
end

