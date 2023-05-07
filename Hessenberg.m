function H = Hessenberg(n)
% Initialize the matrix with random values
H = rand(n) * 10;
H = triu(H,-1);
end




