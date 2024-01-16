function Data = data_processing( fname )
%% Read data from external file and process them
% Input: fname: name of file
% Output: Scaled data

%%
file = [fname,'.csv'];
A    = readtable( file );

Data = table2array( A );
Data(:, 1) = Data(:, 1)*50;
Data(:, 2) = Data(:, 2)*10;

end