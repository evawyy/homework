function Marker = generate_Kac_ring_marker( mu, Nsite )
%% Randomly allocate markers on edges with probability mu
%  Input: mu    --- probability
%         Nsite --- number of sites

Marker = zeros(1, Nsite);
for i = 1:Nsite
  if(rand() < mu)
    Marker(i) = 1; % allocate marker
  else
    Marker(i) = -1; % not allocate
  end
end

end

