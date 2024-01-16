function Ring_new = run_Kac_ring(Ring, Marker, Nsite)
%% run the Kac ring
%  Input: Ring   --- The Kac's ring
%         Marker --- The markers
%         Nsite  --- number of sites

%% allocate memory
Ring_new = zeros(1, Nsite);

%% run one-step simulation
for i = 1:Nsite - 1
  if(Marker(i) == 1) % change the color
    Ring_new(i+1) = 1 - Ring(i);
  elseif(Marker(i) == -1) % keep the color
    Ring_new(i+1) = Ring(i);
  end
end

%% the last one
if(Marker(Nsite) == 1) % change the color
  Ring_new(1) = 1 - Ring(Nsite);
else                   % keep the color 
  Ring_new(1) = Ring(Nsite);
end
end

