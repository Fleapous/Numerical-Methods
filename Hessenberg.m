% function H = Hessenberg(n)
% % Initialize the matrix with random values
% H = rand(n) * 10;
% H = triu(H,-1);
% end

function H = Hessenberg(n)
% Generate a random square matrix of size n with entries between -1 and 1.
A = rand(n); % Generate a matrix of random numbers between 0 and 1
A = 2*A - 1; % Scale and shift the matrix so that entries are between -1 and 1
H = hess(A);
end






