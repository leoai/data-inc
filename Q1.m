
clc
clear all
close all

% params
numJumps = 512; % how many times the knight moves, change accordingly
modulo_1 = 43; % change according to question
modulo_2 = 7; % change according to question, 2nd part

%it's not clear to me how the question wants to calculate the means and
%standard deviations. I'm going to assume it expects me to run the
%simulation for many iterations, and find the mean and stdev of these many
%iterations.
simIterations = 1000000;

grid = [0 1 2 3;
        4 5 6 7;
        8 9 10 11;
        12 13 14 15];
    
% initialize
numsToSum = zeros(numJumps,1);
jumpSum = zeros(simIterations,1);
jumpSum_mod = zeros(simIterations,1);
knightLocX = 1;
knightLocY = 1;

% iteration interation of sum
for iteration_indx = 1:simIterations
    % create unit movement and direction
    jump_indx = 1;
    while jump_indx <= numJumps
        moveX = randi(2)*(randi([0,1])*2 - 1);
        if abs(moveX) > 1
            moveY = 1*(randi([0,1])*2 - 1);
        else
            moveY = 2*(randi([0,1])*2 - 1);
        end

        % create coord location
        knightLocX = knightLocX + moveX;
        knightLocY = knightLocY + moveY;

        if ( 1 <= knightLocX && knightLocX <= 4 ) && ...
           ( 1 <= knightLocY && knightLocY <= 4 )
           numsToSum(jump_indx) = grid(knightLocY,knightLocX);

           jump_indx = jump_indx + 1;
        else
            % resets to last coordinates
            knightLocX = knightLocX - moveX;
            knightLocY = knightLocY - moveY;
        end
    end % while t_indx <= 15

    jumpSum(iteration_indx) = sum(numsToSum);
    jumpSum_mod(iteration_indx) = mod(jumpSum(iteration_indx),modulo_1);
    
end %for iteration_indx = 1:simIterations

jumpSum_mod_mean = mean(jumpSum_mod);
jumpSum_mod_std = std(jumpSum_mod);

% for prob sum is div by x given div by y
divByModulo_1 = find(jumpSum_mod==0);
divByModulo_2 = find(mod(jumpSum(divByModulo_1),modulo_2)==0);

probDiv = numel(divByModulo_2)/numel(divByModulo_1);

