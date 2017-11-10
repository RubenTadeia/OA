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
clc;clear all; close all;

%% Loading the dataset into variables
currentFolder = pwd;

datasetFile = strcat(currentFolder,'/project5_gambling_dataset/dataset_project5_gambling.mat');

load (datasetFile);