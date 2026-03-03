function shipSquares = getSquaresWithShips(locations)
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

for i=1:5        
  
    if locations(i,2) == 1 %vertical
        shipSquares(locations(i,3) : locations(i,3) + shipLength(locations(i,1)) -1, locations(i,4)) = shipSquares(locations(i,3) : locations(i,3) + shipLength(locations(i,1)) - 1, locations(i,4)) + 1;
    
    elseif locations(i,2) == 2 %horizontal
        shipSquares(locations(i,3), locations(i,4): locations(i,4) + shipLength(locations(i,1)) - 1) = shipSquares(locations(i,3), locations(i,4): locations(i,4) + shipLength(locations(i,1)) - 1) + 1;
    
    end

end

end

