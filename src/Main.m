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
%Initial Conditions
X = [0;
     0;
     0.1;
     0;
     0;
     0];
u = [0;
     0];

%Physical Properties
railLngth = 20;
g = 9.81;
m0 = 0.5;
m1 = 0.02;
m2 = 0.02;
l1 = 2.5;
l2 = 2.5;

%Graphics Parameters
mshDnsty = 20;
cartColr = [0.72, 0.45, 0.2];
pndulmBeamColr = [0.5, 0.5, 0.5];
m1Colr = [0.72, 0.45, 0.2];
m2Colr = [0.72, 0.45, 0.2];

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
cylndr('z', 0, 0.25, 2 * (l1 + l2) + 1, 0.25, 'none', mshDnsty);
cartTrnsfrm = hgtransform;
set(cart(cartColr, [0.5, 0.5, 0.5], mshDnsty), 'Parent', cartTrnsfrm);
cartTrnsfrm.Matrix = makehgtform('translate', [X(1), 0, 0]);
pndulm1Trnsfrm = hgtransform;
set(pndulm(l1, pndulmBeamColr, m1Colr, mshDnsty), 'Parent', pndulm1Trnsfrm);
pndulm1Trnsfrm.Matrix = makehgtform('translate', [X(1), -0.5, 0], 'axisrotate', [0, 1, 0], X(3));
pndulm2Trnsfrm = hgtransform;
set(pndulm(l2, pndulmBeamColr, m2Colr, mshDnsty), 'Parent', pndulm2Trnsfrm);
pndulm2Trnsfrm.Matrix = makehgtform('translate', [X(1) + l1 * sin(X(3)), -0.5, l1 * cos(X(3))], 'axisrotate', [0, 1, 0], X(5));
hold(axes, 'off');

%% Main Simulation
ti = 0;
tf = 30;
[tOut, XOut] = ode45(@(t, X) f(X, u, g, m0, m1, m2, l1, l2), [ti, tf], X);

pause(1);
for i = 2:size(tOut, 1)
    pause(tOut(i) - tOut(i - 1));
    cartTrnsfrm.Matrix = makehgtform('translate', [XOut(i, 1), 0, 0]);
    pndulm1Trnsfrm.Matrix = makehgtform('translate', [XOut(i, 1), -0.5, 0], 'axisrotate', [0, 1, 0], XOut(i, 3));
    pndulm2Trnsfrm.Matrix = makehgtform('translate', [XOut(i, 1) + l1 * sin(XOut(i, 3)), -0.5, l1 * cos(XOut(i, 3))], 'axisrotate', [0, 1, 0], XOut(i, 5));
end
