%%  Project - Optimization and Algorithms
%
%   2017/2018
%
%   Luís Miguel Martins Alves       75189
%
%   Rúben Miguel Oliveira Tadeia    75268
%
%   Pedro Guilherme Moreira Falcão  77063
%
%   Diogo Henrique Monteiro Silva   79462
%
%   Script: Main of the Project

%% Reset Variable states
clc;
clear all;
close all;

%% Loading the dataset into variables
currentFolder = pwd;

datasetFile = strcat(currentFolder,'/project5_gambling_dataset/dataset_project5_gambling.mat');

load (datasetFile);

%% CVX code for Equation 2 - Kelly  

 % solve optimization problem
 cvx_begin quiet
    variable b(K, 1)

    % build cost function
    for i = 1:N
        f= sum(prob_outcome_i.*log(returns_matrix(:,i).* b));
    end;
    maximize(f);
    
    % subject t
    sum(b) == 1; b >= 0;
 cvx_end;
 
%% W plot

w = zeros(N,1);
w(1,1) = 1;
for i = 2:N
    w(i,1) = w(i-1,1) * (returns_matrix(:,i-1)' * b);
end
    
figure(1); clf;
plot(1:1:N, w);