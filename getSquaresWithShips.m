function shipSquares = getSquaresWithShips(Locations)
% INPUT:
% Locations is a 5x4 numeric array where
%   Col 1 ship type
%       1 = Aircraft Carrier, 2 = Battleship,
%       3 = Submarine, 4 = Cruiser, 5 = Patrol Boat
%   Col 2 ship orientation, horizontal (2) or vertical (1)
%   Col 3 row of the leftmost (horizontal) or topmost (vertical) end of the
%   ship
%   Col 4 column of the leftmost (horizontal) or topmost (vertical) end of
%   the ship
% RETURNS:
% shipSquares is a 10x10 numeric array of 0s and 1s
%               - 1 indicates a ship square
%               - 0 indicates open water

% define initial variables


shipLength = [5,4,3,3,2];
shipSquares = zeros(10,10);

[r,~] = size(Locations);

% iterate through the rows of the locations matrix
for i=1:r
    
    % vectorized code that uses the orienation to update the appropriate
    % rows or columns by adding using the initial row and column point,
    % iterating through the ship length (minus 1 to account for the initial
    % value) then adding 1 to the found zeros vector.
    
    if Locations(i,2) == 1 %vertical

        shipSquares(Locations(i,3) : Locations(i,3) + shipLength(Locations(i,1)) -1, Locations(i,4)) = shipSquares(Locations(i,3) : Locations(i,3) + shipLength(Locations(i,1)) - 1, Locations(i,4)) + 1;
    

    elseif Locations(i,2) == 2 %horizontal

        shipSquares(Locations(i,3), Locations(i,4): Locations(i,4) + shipLength(Locations(i,1)) - 1) = shipSquares(Locations(i,3), Locations(i,4): Locations(i,4) + shipLength(Locations(i,1)) - 1) + 1;
    
    end


end


end

