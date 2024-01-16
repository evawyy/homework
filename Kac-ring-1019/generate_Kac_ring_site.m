function Ring = generate_Kac_ring_site(numB, numW)
%% Generate the site location of a Kac ring
%  Input:  numB --- number of black balls
%          numW --- number of white balls
%  Output: Ring --- an array to store ring, black = 1, white = 0

%% allocate memory
Nsite = numB + numW;
Ring = zeros(1, Nsite);

%% allocate the sites
array = randsample( Nsite, numB );
Ring(array) = 1;
end

