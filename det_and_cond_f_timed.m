function [det, cond, U, Hinv, time] = det_and_cond_f_timed(A)
tic; % Start the timer

[U, num_swaps, Hinv] = gaussian_elim(A);

% Finding the det(A)
det = determinant(U, num_swaps);

% Find ||A^-1||F
fro_norm_inv = frobenius_norm(Hinv);

% Finding the ||A||F
fro_norm = frobenius_norm(A);

% Find condF
cond = fro_norm * fro_norm_inv;

time = toc; % Stop the timer and record the elapsed time
end
