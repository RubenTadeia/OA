%%  Project - Optimization and Algorithms
%
%   2017/2018
%
%   Luis Miguel Martins Alves       75189
%
%   Ruben Miguel Oliveira Tadeia    75268
%
%   Pedro Guilherme Moreira Falcao  77063
%
%   Diogo Henrique Monteiro Silva   79462
%
%   Script: Main of the Project
%   Part II
%       - Second Phase

%% Reset Variable states
clc;
clear all;
close all;

%% Loading the dataset into variables
currentFolder = pwd;

datasetFile1 = strcat(currentFolder,'/project5_gambling_dataset/dataset_project5_gambling.mat');

datasetFile2 = strcat(currentFolder,'/dataset_project5_phase2/dataset_project5_phase2.mat');

load (datasetFile1);
load (datasetFile2);





%% Solve optimization problem - Kelly
cvx_begin quiet
    variable b(N, 1)
    variable b_k
    
    % Build cost function
    f1=1/2*((beta(1,1)*(b_k-b_ref(1,1)))+abs(beta(1,1)*(b_k-b_ref(1,1)))+(alfa(1,1)*(b_k-b_ref(1,1)))+abs(alfa(1,1)*(b_k-b_ref(1,1))));
    f2=1/2*((beta(2,1)*(b_k-b_ref(2,1)))+abs(beta(2,1)*(b_k-b_ref(2,1)))+(alfa(2,1)*(b_k-b_ref(2,1)))+abs(alfa(2,1)*(b_k-b_ref(2,1))));
    f3=1/2*((beta(3,1)*(b_k-b_ref(3,1)))+abs(beta(3,1)*(b_k-b_ref(3,1)))+(alfa(3,1)*(b_k-b_ref(3,1)))+abs(alfa(3,1)*(b_k-b_ref(3,1))));
    f4=1/2*((beta(4,1)*(b_k-b_ref(4,1)))+abs(beta(4,1)*(b_k-b_ref(4,1)))+(alfa(4,1)*(b_k-b_ref(4,1)))+abs(alfa(4,1)*(b_k-b_ref(4,1))));
    f5=1/2*((beta(5,1)*(b_k-b_ref(5,1)))+abs(beta(5,1)*(b_k-b_ref(5,1)))+(alfa(5,1)*(b_k-b_ref(5,1)))+abs(alfa(5,1)*(b_k-b_ref(5,1))));
    f6=1/2*((beta(6,1)*(b_k-b_ref(6,1)))+abs(beta(6,1)*(b_k-b_ref(6,1)))+(alfa(6,1)*(b_k-b_ref(6,1)))+abs(alfa(6,1)*(b_k-b_ref(6,1))));
    f7=1/2*((beta(7,1)*(b_k-b_ref(7,1)))+abs(beta(7,1)*(b_k-b_ref(7,1)))+(alfa(7,1)*(b_k-b_ref(7,1)))+abs(alfa(7,1)*(b_k-b_ref(7,1))));
    f8=1/2*((beta(8,1)*(b_k-b_ref(8,1)))+abs(beta(8,1)*(b_k-b_ref(8,1)))+(alfa(8,1)*(b_k-b_ref(8,1)))+abs(alfa(8,1)*(b_k-b_ref(8,1))));
    f9=1/2*((beta(9,1)*(b_k-b_ref(9,1)))+abs(beta(9,1)*(b_k-b_ref(9,1)))+(alfa(9,1)*(b_k-b_ref(9,1)))+abs(alfa(9,1)*(b_k-b_ref(9,1))));
    f10=1/2*((beta(10,1)*(b_k-b_ref(10,1)))+abs(beta(10,1)*(b_k-b_ref(10,1)))+(alfa(10,1)*(b_k-b_ref(10,1)))+abs(alfa(10,1)*(b_k-b_ref(10,1))));
    f11=1/2*((beta(11,1)*(b_k-b_ref(11,1)))+abs(beta(11,1)*(b_k-b_ref(11,1)))+(alfa(11,1)*(b_k-b_ref(11,1)))+abs(alfa(11,1)*(b_k-b_ref(11,1))));
    f12=1/2*((beta(12,1)*(b_k-b_ref(12,1)))+abs(beta(12,1)*(b_k-b_ref(12,1)))+(alfa(12,1)*(b_k-b_ref(12,1)))+abs(alfa(12,1)*(b_k-b_ref(12,1))));
    f13=1/2*((beta(13,1)*(b_k-b_ref(13,1)))+abs(beta(13,1)*(b_k-b_ref(13,1)))+(alfa(13,1)*(b_k-b_ref(13,1)))+abs(alfa(13,1)*(b_k-b_ref(13,1))));
    f14=1/2*((beta(14,1)*(b_k-b_ref(14,1)))+abs(beta(14,1)*(b_k-b_ref(14,1)))+(alfa(14,1)*(b_k-b_ref(14,1)))+abs(alfa(14,1)*(b_k-b_ref(14,1))));
    f15=1/2*((beta(15,1)*(b_k-b_ref(15,1)))+abs(beta(15,1)*(b_k-b_ref(15,1)))+(alfa(15,1)*(b_k-b_ref(15,1)))+abs(alfa(15,1)*(b_k-b_ref(15,1))));
    f16=1/2*((beta(16,1)*(b_k-b_ref(16,1)))+abs(beta(16,1)*(b_k-b_ref(16,1)))+(alfa(16,1)*(b_k-b_ref(16,1)))+abs(alfa(16,1)*(b_k-b_ref(16,1))));
    f17=1/2*((beta(17,1)*(b_k-b_ref(17,1)))+abs(beta(17,1)*(b_k-b_ref(17,1)))+(alfa(17,1)*(b_k-b_ref(17,1)))+abs(alfa(17,1)*(b_k-b_ref(17,1))));
    f18=1/2*((beta(18,1)*(b_k-b_ref(18,1)))+abs(beta(18,1)*(b_k-b_ref(18,1)))+(alfa(18,1)*(b_k-b_ref(18,1)))+abs(alfa(18,1)*(b_k-b_ref(18,1))));
    f19=1/2*((beta(19,1)*(b_k-b_ref(19,1)))+abs(beta(19,1)*(b_k-b_ref(19,1)))+(alfa(19,1)*(b_k-b_ref(19,1)))+abs(alfa(19,1)*(b_k-b_ref(19,1))));
    
    
                    %From part 1
    f = sum(prob_outcome_i' * log(returns_matrix * b))...
    ...                % From part 2
    -(f1+f2+f3+f4+f5+f6+f7+f8+f9+f10+f11+f12+f13+f14+f15+f16+f17+f18+f19)...
    ;
    maximize(f);

    % Subject t
    sum(b) == 1; 
    b >= 0;
    b_k >= 0;
cvx_end;
