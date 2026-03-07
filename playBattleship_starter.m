% William Selby, Benjamin Roylance
% wlselby@ncsu.edu, bmroylance@ncsu.edu
% 1/29/2026
% Lab Section: 209
%  Project 2: Battleship Game, Spring 2026
clc ; clear ; close('all');

%% clear variables, Command Window and turn off warning messages, load images
clear; clc;
warning('off','all'); % turns off all warning messages
load Battleship % loads the ship images into Matlab

%% setting up the Computer Board & determining the squares with ships
% places ships on Computer Board 
Computer_Locations = setupBoard(); 
% displays both Boards
displayBoards(Computer_Board, Player_Board);%player board is still empty
% use the ship Locations to lay out the Computer Board 
compSquaresWithShips = getSquaresWithShips(Computer_Locations); 

%% ask the Player to setup their Board

% Cell array for ship data to use in imput loop
shipData = {
            1, "Aircraft Carrier", 5;
            2, "Battleship",       4;
            3, "Submarine",        3;
            4, "Cruiser",          3;
            5, "PT Boat",          2
            };
% initial game statement
fprintf("Welcome to the Battleship Game!\nSetup your ships on the board\n")

% empty player locations to add to 
Player_Locations = [];

for i = 1:size(shipData, 1)
    fprintf("\n%s(length %d):\n", shipData{i,2}, shipData{i,3})
    
    % get input for coordinate, then check if it is valid
    [inputRow, inputCol] = validateRowColumn(input("Enter [row, column]:"));
    
    % get input for orientation, then check if it is valid
    orientation = validateOrientation(input("Orientation ver = 1, hor = 2: "));
    
    % update the player locations array with a new row, making a 5x4 matrix
    Player_Locations = [Player_Locations; shipData{i,1},orientation, inputRow, inputCol]; 

    %place the ship on the board & display the board
    Player_Board = placeShipsOnBoard( Player_Board, Player_Locations, 1);
    displayBoards( Computer_Board, Player_Board )
end

fprintf("*********************************")




%% Play the game 

% initialize variables
turnTotal = 0;
hitTotal = zeros(1,2);
playerSquaresWithShips = getSquaresWithShips(Player_Locations);
computerGuesses = [];
playerGuesses = zeros(1,2);

% while loop to run the game until someone wins
while sum(hitTotal < [17,17]) > 1
    % player turn
    if rem(turnTotal, 2) == 0

        turnTotal = turnTotal + 1; %increase turn count for iteration
        fprintf('\nPLAYER''S TURN\n')
        
        % gather input for attack
        [atkRow, atkCol] = validateRowColumn(input('Enter [row, column] to hit: '));
       
        % check if the value is in the already used
        if ismember([atkRow, atkCol], playerGuesses, 'rows')

            disp('Error: already guessed that location.')


        else
            
            % if its not already used then check if its a hit or not before
            % acting everything else out
            playerGuesses(end+1,:) = [atkRow, atkCol];
            
            if compSquaresWithShips(atkRow, atkCol)

            Computer_Board = markBoard('Computer', Computer_Board, atkRow, atkCol, true);
            displayBoards( Computer_Board, Player_Board )

            fprintf('Hit!\n')
           
            % give one point to the player
            hitTotal(1) = hitTotal(1) + 1;


            else

            Computer_Board = markBoard('Computer', Computer_Board, atkRow, atkCol, false);
            displayBoards( Computer_Board, Player_Board )

            fprintf('No hit.\n')


            end

        end
        


        

    % computer turn
    elseif rem(turnTotal, 2) == 1
        fprintf('\nCOMPUTER''S TURN\n')
        turnTotal = turnTotal + 1;

        % rather than give the computer the option to accidentally aim for
        % the same suqare twice, that capability has been removed
        % completely and the computer only aims for new spots
        while true

            atk = randi([1,10],1,2);
            
            exists = false;

            % check if already guessed then append if it hasn't
            for i = 1:length(computerGuesses)
                
                if isequal(computerGuesses{:,i}, atk)
                
                    exists = true;
                    break
                
                    
                end

            end
    
            if ~exists
                
                computerGuesses{end+1} = atk;

                break


            end

        end
        
        fprintf('Computer aims at [%d, %d].\n', atk)
        
    % check for a hit or not before updating the board, same as the player
    % side
        if playerSquaresWithShips(atk(1),atk(2))
            
            Player_Board = markBoard('Player', Player_Board, atk(1), atk(2), true);
            displayBoards( Computer_Board, Player_Board )

            fprintf('Hit!\n')

            hitTotal(2) = hitTotal(2) + 1;


        else

            Player_Board = markBoard('Player', Player_Board, atk(1), atk(2), false);
            displayBoards( Computer_Board, Player_Board )

            fprintf('No hit.\n')


        end

        

    end
end

%check who won once the loop is broken
if hitTotal(1) > hitTotal(2)

    fprintf('PLAYER WINS!')


elseif hitTotal(1) < hitTotal(2)

    fprintf('COMPUTER WINS!')


end


%% Reveal the ships on the Computer Board when the game ends.
% DO NOT modify, leave this at the end of your script.
Computer_Board = placeShipsOnBoard( Computer_Board, Computer_Locations, 2 );
displayBoards(Computer_Board, Player_Board);


