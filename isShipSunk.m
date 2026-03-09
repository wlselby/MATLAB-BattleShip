function [isSunk, shipType] = isShipSunk(Locations, Guesses)
% A function to determine if a hit has resulted in a ship being sunk or not
% by taking the locations of the ships and the respective guess log and
% cross refrencing them to check for enough matches to classify a sunk ship
%
%           INPUTS
%               -Locations is a 5x4 numeric array where
%                   Col 1 ship type
%                       1 = Aircraft Carrier, 2 = Battleship,
%                       3 = Submarine, 4 = Cruiser, 5 = Patrol Boat
%                   Col 2 ship orientation, horizontal (2) or vertical (1)
%                   Col 3 row of the leftmost (horizontal) or topmost (vertical) end of the
%                   ship
%                   Col 4 column of the leftmost (horizontal) or topmost (vertical) end of
%                   the ship
%               -Guesses is an Nx2 matrix containing vector pairs where N
%                   is the number of guesses form the player or the
%                   computer has made during the game.
%                   Col 1 - Row
%                   Col 2 - Column
%
%           OUTPUTS
%               -isSunk is a logical value determining if a ship is sunk
%                   after a hit or not, to then print a message.
%               -shipType is a scalar between 0 and 5 to be indexed
%                   after the function has been run.

isSunk = false;
shipLength = [5,4,3,3,2];
shipType = 0;

for i = 1:5
    
    type = Locations(i,1);
    orient = Locations(i,2);
    row = Locations(i,3);
    col = Locations(i,4);
    len = shipLength(type);
    
    if orient == 1 % vertical
        
        rows = (row:row+len-1)';
        cols = col * ones(len,1);
        
    elseif orient == 2 % horizontal
        
        rows = row * ones(len,1);
        cols = (col:col+len-1)';
        
    end
    
    shipCoords = [rows cols];
    
    if all(ismember(shipCoords, Guesses, 'rows'))
        isSunk = true;
        shipType = type;
        return
    end
    
end

end

