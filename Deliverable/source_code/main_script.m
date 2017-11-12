%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Instituto Superior Técnico          % 
%                                              %
%          Optimization and Algorithms         %
%                                              %
%                   Project 5                  %
%                                              %
%            Adviser: António Simões           %
%                                              %
%                    Grupo 2                   %
%                                              %
%   Luís Miguel Martins Alves          75189   %
%                                              %
%   Rúben Miguel Oliveira Tadeia       75268   %
%                                              %
%   Pedro Guilherme Moreira Falcão     77063   %
%                                              %
%   Diogo Henrique Monteiro Silva      79462   %
%                                              %
%                                              %
%         Script: Main of the Project          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reset Variable states

clc;
clear all;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Loading the dataset into the workspace

% Make sure you are at this folder .../OA/Deliverable/source_code
currentFolder = pwd; %Get the current folder. pwd is bash command

datasetFile = strcat(currentFolder,'/project5_gambling_dataset/dataset_project5_gambling.mat');

load (datasetFile);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CVX code for Equation 2 - Kelly  

 % solve optimization problem
 cvx_begin quiet
    variable b_kelly(K, 1)

    % build cost function
    for i = 1:N
        function_kelly = sum(prob_outcome_i.*log(returns_matrix(:,i).* b_kelly));
    end;
    maximize(function_kelly);
    
    % subject to
    sum(b_kelly) == 1; b_kelly >= 0;
 cvx_end;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CVX code for Equation 11 - Risk-constrained Kelly

% This value should be random? I don't get it from the paper

 % solve optimization problem
 cvx_begin quiet
    variable b_rck(K, 1)
    variable lambda_risk nonnegative

    % build cost function
    for i = 1:N
        function_rck = sum(prob_outcome_i.*log(returns_matrix(:,i).* b_rck));
        risk_constraint = log ( ...
                            sum( ...
                                exp( ...
                                    log(prob_outcome_i) - lambda_risk*log(returns_matrix(:,i).* b_rck) ...
                                ) ...
                            ) ...
                          );
    end;
    maximize(function_rck);
    
    % subject to
    sum(b_rck) == 1; b_rck >= 0; risk_constraint <= 0;
 cvx_end;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% Plots

% Inicialization of variables for Kelly
weight_kelly = zeros(N,1);
weight_kelly(1,1) = 1;

% Inicialization of variables for RCK
weight_rck = zeros(N,1);
weight_rck(1,1) = 1;

% Loop to get one line for both trajectories:
%   - Kelly
%   - RCK
for i = 2:N
    % Weight plot for Kelly
    weight_kelly(i,1) = weight_kelly(i-1,1) * (returns_matrix(:,i-1)' * b_kelly);
    
    % Weight plot Risk-constrained Kelly
    weight_rck(i,1) = weight_rck(i-1,1) * (returns_matrix(:,i-1)' * b_rck);
end

figure(1); clf;
title('{\color{red}Kelly Trajectories}');
hold on;
plot(1:1:N, weight_kelly);

figure(2); clf;
title('{\color{darkgreen}RCK Trajectories}');
hold on;
plot(1:1:N, weight_rck);