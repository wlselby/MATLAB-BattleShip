function orientation = validateOrientation(orientation)
%validates the orientation entered by the Player
% Input: orientation is an number entered by the Player when they are
%        placing their ship on  their board
% Return: orientation - integer either 1 or 2
% PRINTING: this function prints to the Command Window and interacts with
%           the Player to enter orientation (if it was invalid)

% start a loop for a user input to check correct values
while true
    %check the value for the orientation 
    if rem(orientation,1) == 0 && orientation >=1 && orientation <= 2
        
        %orientaion is named the exact same as the input variable so no
        %reassigining is necessary adn we can just break the loop
        break
    else

        %promt user for correct input if check fails
        orientation = input('Incorrect Orientation Enter orientation again: ');

    end

end