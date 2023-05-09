function [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err, det_calculated, det_build_in, condf_calculated, condf_build_in] = test(size)
    %generating a hassenberg matrix by given size
    A = Hessenberg(size);

    %computing the det and condf using home made functions
    [det_calculated, condf_calculated, ~, Hinv] = det_and_cond_f(A);

    %calculating the errors for Hinv(inverted A)
    [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err] = direct_methods_test(A, inv(A), eye(size), Hinv, true);

    %computing the det and codf using build in matlab functions
    det_build_in = det(A);
    condf_build_in = norm(A, "fro") * norm(inv(A), "fro");
end

