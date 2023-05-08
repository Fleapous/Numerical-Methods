function [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err, det_calculated, det_bin, condf_calculated, condf_bin] = test(size)
    A = Hessenberg(size);
    [det_calculated, condf_calculated, U, Hinv] = det_and_cond_f(A);
    [~, Utest, ~] = lu(A);
    [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err] = direct_methods_test(A, inv(A), eye(size), Hinv, true);
    det_bin = det(A);
    condf_bin = norm(A, "fro") * norm(inv(A), "fro");
end

