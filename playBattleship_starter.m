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
%Player_Locations = [1,1,1,1;2,1,1,2;3,1,1,3;4,1,1,4;5,1,1,5];

%Player_Board = placeShipsOnBoard( Player_Board, Player_Locations, 1);
%displayBoards( Computer_Board, Player_Board )
% REMOVE THESE ^^^^

turnTotal = 0;
hitTotal = zeros(1,2);
playerSquaresWithShips = getSquaresWithShips(Player_Locations);
computerHits = [];


while sum(hitTotal < [17,17]) > 1
    % player turn
    if rem(turnTotal, 2) == 0

        turnTotal = turnTotal + 1;
        fprintf('\nPLAYER''S TURN\n')
        
        [atkRow, atkCol] = validateRowColumn(input('Enter [row, column] to hit: '));
        
        %atk = randi([1,10],1,2);
        %atkRow = atk(1); atkCol = atk(2);

        if compSquaresWithShips(atkRow, atkCol)

            Computer_Board = markBoard('Computer', Computer_Board, atkRow, atkCol, true);
            displayBoards( Computer_Board, Player_Board )

            fprintf('Hit!\n')

            hitTotal(1) = hitTotal(1) + 1;


        else
            Computer_Board = markBoard('Computer', Computer_Board, atkRow, atkCol, false);
            displayBoards( Computer_Board, Player_Board )

            fprintf('No hit.\n')
        end

    % computer turn
    elseif rem(turnTotal, 2) == 1
        fprintf('\nPUTER''S TURN\n')
        turnTotal = turnTotal + 1;

        while true

            atk = randi([1,10],1,2);
            
            exists = false;

            for i = 1:length(computerHits)
                
                if isequal(computerHits{:,i}, atk)
                
                    exists = true;
                    break
                
                    
                end

            end
    
            if ~exists
                
                computerHits{end+1} = atk;

                break


            end

        end
        
        fprintf('Computer aims at [%d, %d].\n', atk)
        

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


if hitTotal(1) > hitTotal(2)

    fprintf('PLAYER WINS!')


elseif hitTotal(1) < hitTotal(2)

    fprintf('COMPUTER WINS!')


end


%% Reveal the ships on the Computer Board when the game ends.
% DO NOT modify, leave this at the end of your script.
Computer_Board = placeShipsOnBoard( Computer_Board, Computer_Locations, 2 );
displayBoards(Computer_Board, Player_Board);


