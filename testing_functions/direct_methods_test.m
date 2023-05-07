function [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err] = direct_methods_test(A, X, B, Z, is_inverse_calculation)
    %calculating the cond of A
    Ainv = inv(A);
    Ainvnorm = norm(Ainv);
    Anorm = norm(A);
    cond = Ainvnorm * Anorm;

    %calculating relative_err
    Xnorm = norm(X);
    diffnorm = norm(Z - X);
    relative_err = diffnorm / Xnorm;

    %calculating forvard_stabbility_err
    forward_stability_err = diffnorm / (Xnorm * cond);

    %calculating backWard_stability_err
    Znorm = norm(Z);
    backWard_stability_err = norm(B - A*Z) / (Anorm * Znorm);

    %calculating left_residual_err
    if is_inverse_calculation
        left_residual_err = norm(B - Z*A) / (Anorm * Znorm);
    end
end

