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

shipType=Locations(1);
orientation=Locations(2);
inputRow= Locations(3);
inputCol= Locations(4);
zerosArray=zeros(10,10);
switch shipType
    case 1
        shipLength = ones(1,5);
    case 2
        shipLength = ones(1,4);
    case 3
        shipLength = ones(1,3);
    case 4
        shipLength = ones(1,3);
    case 5
        shipLength = ones(1,2);
end

for i=1:5        
  
    if orientation == 1 %vertical
        zerosArray(inputRow:inputRow+length(shipLength),inputCol)= zerosArray(inputRow:inputRow+length(shipLength),inputCol)+1;
    
    elseif orientation == 2 %horizontal
        zerosArray(inputCol:inputCol+length(shipLength), inputRow)= zerosArray(inputCol:inputCol+length(shipLength), inputRow)+1;
    
    end

end

end

