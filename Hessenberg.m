function H = Hessenberg(n, use_integers)
% Initialize the matrix with random values
if use_integers
    H = randi([0 9], n);
else
    H = rand(n);
end

H = triu(H,-1);
end




