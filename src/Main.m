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
%Physical Properties
railLngth = 20;
pndulm1Lngth = 2.5;
pndulm2Lngth = 2.5;

%Graphics Parameters
mshDnsty = 20;
cartColr = [0.72, 0.45, 0.2];
pndulmBeamColr = [0.5, 0.5, 0.5];
mass1Colr = [0.72, 0.45, 0.2];
mass2Colr = [0.72, 0.45, 0.2];

%Simulation UI Parameters
viewSettng = "2D";

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
view(double(viewSettng == "3D") * [-37.5, 30] + double(viewSettng == "2D") * [0, 0]);
axis equal;
box on;
grid on;
camlight;
cylndr('x', 0, 0.25, railLngth, 0.25, [0.5, 0.5, 0.5], mshDnsty);
cylndr('z', 0, 0.25, 2 * (pndulm1Lngth + pndulm2Lngth) + 1, 0.25, 'none', mshDnsty);
cartTrnsfrm = hgtransform;
set(cart(cartColr, [0.5, 0.5, 0.5], mshDnsty), 'Parent', cartTrnsfrm);
pndulm1Trnsfrm = hgtransform;
set(pndulm(pndulm1Lngth, pndulmBeamColr, mass1Colr, mshDnsty), 'Parent', pndulm1Trnsfrm);
pndulm1Trnsfrm.Matrix = makehgtform('translate', [0, -0.5, 0]);
pndulm2Trnsfrm = hgtransform;
set(pndulm(pndulm2Lngth, pndulmBeamColr, mass2Colr, mshDnsty), 'Parent', pndulm2Trnsfrm);
pndulm2Trnsfrm.Matrix = makehgtform('translate', [0, -0.5, pndulm1Lngth]);
hold(axes, 'off');

%% Main Simulation
% pause(1);
% t = 0;
% x = 0;
% while (t <= 4*pi)
%     cartTrnsfrm.Matrix = makehgtform('translate', [-x, 0, 0]);
%     pndulm1Trnsfrm.Matrix = makehgtform('translate', [-x, 0.5, 0]);
%     pndulm2Trnsfrm.Matrix = makehgtform('translate', [-x + pndulm1Lngth * sin(t), 0.5, -pndulm1Lngth * cos(t)]);
%     x = 5 * sin(t);
%     cartTrnsfrm.Matrix = makehgtform('translate', [x, 0, 0]);
%     pndulm1Trnsfrm.Matrix = makehgtform('translate', [x, -0.5, 0], 'axisrotate', [0, -1, 0], t);
%     pndulm2Trnsfrm.Matrix = makehgtform('translate', [x - pndulm1Lngth * sin(t), -0.5, pndulm1Lngth * cos(t)], 'axisrotate', [0, -1, 0], 2 * t);
%     drawnow;
%     t = t + 0.01;
% end
