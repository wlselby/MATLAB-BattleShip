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
% ADD YOUR CODE HERE


%% Play the game 


%% Reveal the ships on the Computer Board when the game ends.
% DO NOT modify, leave this at the end of your script.
Computer_Board = placeShipsOnBoard( Computer_Board, Computer_Locations, 2 );
displayBoards(Computer_Board, Player_Board);


