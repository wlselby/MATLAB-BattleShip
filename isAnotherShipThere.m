function anotherShipThere=isAnotherShipThere(ship,orientation,r,c)
% isAnotherShipThere checks whether or not there is another ship in the way
% of the ship that the player is trying to place. It does this by checking
% where the ship will go against the binary layout of the ships that are
% already on the board.
% INPUTS:       ship - the type of ship, given by a number. Will result
%               in a specific ship length
%               orientation - checks which way the ship is facing
%               (horizontal or vertical) either a 1 or 2
%               r, c - the leftmost or topmost point given by the row and
%               column where it is
% OUTPUTS:      anotherShipThere - gives a binary output. If there is
%               another ship in the way, it will give a 1, to indicate
%               true. likewise, if there is no ship in the way it will spit
%               out a zero.

%pull in values for the lengths of the different ships based off of the
%type of ship it is.
shipArray=[5,4,3,3,2];
shipLength=shipArray(ship);

shipSquares=getSquaresWithShips(r,c);

% just a quick spitball to get the code flowing
if orientation==2
    %if horizontal, the footprint of the new ship is the part o fthe array
    %for the whole board in the same row, spanning from the start of the
    %ship to where the ship ends based on ship length
    shipFootprint= shipSquares(r,(c:c+shipLength-1));
elseif orientation==1
    %same idea but for vertical this time
    shipFootprint= shipSquares((r:r+shipLength-1),c);

end

for i = 1:length(shipFootprint)
    shipThere=shipFootprint(i) ~= 1


end
end