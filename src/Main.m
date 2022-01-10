% Filename:      Main.m
%
% Description:   Runs a program that simulates the dynamics and control of
%                a 3DOF double pendulum-sliding cart system. The system is
%                under single-axis control (of the cart's horizontal
%                position) and uses the state space representation with
%                linearization about four fixed points near which the
%                system is controllable. Friction is neglected.
%
% Author(s):     Edwin Christhuraj
% Created:       23-Apr-2021
%
% Copyright (c) 2022 Edwin Christhuraj.
% See LICENSE for terms.

clear;

%% Main Parameters
%Initial State
X = [0;     %x_0
     0;     %x_dot_0
     0;     %θ_1
     0;     %θ_dot_1
     0;     %θ_2
     0];    %θ_dot_2

%% Main Setup


%% Main Simulation

