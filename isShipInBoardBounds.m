function shipInBoundsResult = isShipInBoardBounds(ship, vertOrHor, r, c)
% This function takes the type of ship, its orientation, and its location,
% to determine if it is out of the bounds of the board.
% INPUT: ship - the type of ship that we want to measure the bounds for, numeric input which correlates to a type of ship.  
%           vertOrHor - whether the ship is vertically or horizontally
%           oriented
%           r,c - the location in the play board where the left most, or
%           topmost part of the ship in question is. r is the row number,
%           and c is the column number
% OUTPUT: shipInBoundsResult - gives a binary 1 or 0 output depending on
% whether the ship is within the bounds

%define intial ship length in relation to the ship type
shipArray=[5,4,3,3,2];
shipLength=shipArray(ship);
%by using a while loop, the proces runs more seemlessly, and requires
%player to put new input in until they put in something that works
while true
%checks to see if vertical or horizontal, and then adds the ship length to
%either columns or rows depending on if it is vertical or horizontal
    if vertOrHor == 2
        farLocation= shipLength-1 + c;
    elseif vertOrHor == 1
        farLocation= shipLength-1 + r;
    end
    %check to see if the far location is greater than 10. if it is the ship
    %is off the board and must be placed in a different location.
    shipInBoundsResult=farLocation <= 10;

    %if the function is true, and the ship is within bounds, then this will
    %break the while loop and allow the player to continue on with the game
    if shipInBoundsResult ==1
        break
    end

    %if not in bounds, the player is prompted for a new location that will
    %then run through back through the loop to see if it is in the bounds.
    newLocation=input('Ship is out of bounds. Enter a new location [row, column]:');
    [r,c]=validateRowColumn(newLocation);
end


end