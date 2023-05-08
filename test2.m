function [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err, det_calculated, det_bin, condf_calculated, condf_bin] = test2(type)
    if type == "H1"
        H1 = [1 2 0; 0 3 4; 0 0 5];
        H1inv = [1 -0.6667 0.5333; 0 0.3333 -0.2667; 0 0 0.2000];
        H1det = 15;
        [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err, det_calculated, det_bin, condf_calculated, condf_bin] = test2_sub(H1, H1inv, H1det);
    end
    if type == "H2"
        H2 = [1 2 3 0; 0 5 6 7; 0 8 0 10; 0 0 11 12];
        H2inv = [1.0000   -0.9961    0.3725    0.2706; 0    0.2157   -0.0098   -0.1176; 0    0.1882   -0.1176   -0.0118; 0   -0.1725    0.1078    0.0941];
        H2det = -510.0000;
        [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err, det_calculated, det_bin, condf_calculated, condf_bin] = test2_sub(H2, H2inv, H2det);
    end
    if type == "H3"
        H3 = [1 2 3 0; 0 5 6 7; 0 8 0 10; 0 0 11 12];
        H3inv = [1.0000   -0.9961    0.3725    0.2706; 0    0.2157   -0.0098   -0.1176; 0    0.1882   -0.1176   -0.0118; 0   -0.1725    0.1078    0.0941];
        H3det = -510.0000;
        [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err, det_calculated, det_bin, condf_calculated, condf_bin] = test2_sub(H3, H3inv, H3det);
    end
end

function [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err, det_calculated, det_bin, condf_calculated, condf_bin] = test2_sub(A, Ainv_exact, Adet_exact)
    %find computed det and condf
    [det_calculated, condf_calculated, U, Hinv] = det_and_cond_f(A);

    %calculate errors from GEPP
    [cond, relative_err, forward_stability_err, backWard_stability_err, left_residual_err] = direct_methods_test(A, Ainv_exact, eye(size(A, 1)), Hinv, true);

    %calculate det and condf using build in functions
    det_bin = Adet_exact;
    condf_bin = norm(A, "fro") * norm(Ainv_exact, "fro");

end

