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
cylndr('x', 0, 0.25, 20, 0.25, [0.5, 0.5, 0.5], 50);
cylndr('z', 0, 0.25, 11, 0.25, 'none', 50);
cartTrnsfrm = hgtransform;
set(cart([0.72, 0.45, 0.2], [0.83, 0.69, 0.22], 50), 'Parent', cartTrnsfrm);
pndulm1Trnsfrm = hgtransform;
set(pndulm(2.5, [0.5, 0.5, 0.5], [0, 1, 0], 50), 'Parent', pndulm1Trnsfrm);
pndulm1Trnsfrm.Matrix = makehgtform('translate', [0, -0.5, 0]);
pndulm2Trnsfrm = hgtransform;
set(pndulm(2.5, [0.5, 0.5, 0.5], [1, 0, 0], 50), 'Parent', pndulm2Trnsfrm);
pndulm2Trnsfrm.Matrix = makehgtform('translate', [0, -0.5, 2.5]);
hold(axes, 'off');

%% Main Simulation
% pause(1);
% t = 0;
% x = 0;
% while (t <= 8*pi)
%     cartTrnsfrm.Matrix = makehgtform('translate', [-x, 0, 0]);
%     pndulm1Trnsfrm.Matrix = makehgtform('translate', [-x, 0.5, 0]);
%     pndulm2Trnsfrm.Matrix = makehgtform('translate', [-x, 0.5, -2.5]);
%     x = 5 * sin(t);
%     cartTrnsfrm.Matrix = makehgtform('translate', [x, 0, 0]);
%     pndulm1Trnsfrm.Matrix = makehgtform('translate', [x, -0.5, 0], 'axisrotate', [0, -1, 0], t);
%     pndulm2Trnsfrm.Matrix = makehgtform('translate', [x, -0.5, 2.5], 'axisrotate', [0, -1, 0], t);
%     drawnow;
%     t = t + 0.05;
% end
