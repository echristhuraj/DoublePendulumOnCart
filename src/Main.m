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
set(axes, 'Visible', 'on', 'Color', 'k', 'xcolor', 'w', 'ycolor', 'w', 'zcolor', 'w', 'Clipping', 'off');
hold(axes, 'on');
xlabel('x');
ylabel('y');
zlabel('z');
view(3);
axis equal;
camlight;
cylndr('x', 0.25, 20, 0.25, [0.5, 0.5, 0.5], 50);
cartTrnsfrm = hgtransform;
set(cart(), 'Parent', cartTrnsfrm);
hold(axes, 'off');

%% Main Simulation
% pause(1);
% t = 0;
% x = 0;
% while (t <= 2*pi)
%     cartTrnsfrm.Matrix = makehgtform('translate', [-x, 0, 0]);
%     x = sin(t);
%     cartTrnsfrm.Matrix = makehgtform('translate', [x, 0, 0]);
%     drawnow;
%     t = t + 0.01;
% %     pause(0.05);
% end
