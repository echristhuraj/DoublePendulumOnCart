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
% Created:       8-Jan-2022
%
% Copyright (c) 2022 Edwin Christhuraj.
% See LICENSE for terms.

clear;

%% Main Parameters


%% Main Setup
comp_scrn_size = get(0, 'ScreenSize');
simUI = figure('Name', 'Double Pendulum On Cart', 'Position', [comp_scrn_size(3) / 4, comp_scrn_size(4) / 4, 0.5 * comp_scrn_size(3), 0.5 * comp_scrn_size(4)], 'Color', 'k');
panel = uipanel('Parent', simUI);
set(panel, 'BackgroundColor', 'k');
axes = axes('Parent', panel);
set(axes, 'Visible', 'on', 'Color', 'k', 'xcolor', 'w', 'ycolor', 'w', 'zcolor', 'w');
hold(axes, 'on');
hold(axes, 'off');

%% Main Simulation

