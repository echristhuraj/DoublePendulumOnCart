function grphcs = pndulm(beamLngth, beamColr, massColr, mshDnsty)
    grphcs(1:4) = cylndr('z', beamLngth / 2, 0.1, beamLngth, 0.1, beamColr, mshDnsty);

    [azmth, elvtn] = meshgrid(linspace(0, 2 * pi, mshDnsty), linspace(0, -pi, mshDnsty));
    [X, Y, Z] = sph2cart(azmth, elvtn, 0.1);
    grphcs(5) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', beamColr);

    [azmth, elvtn] = meshgrid(linspace(0, 2 * pi, mshDnsty), linspace(0, 2 * pi, mshDnsty));
    [X, Y, Z] = sph2cart(azmth, elvtn, 0.25);
    Z = Z + beamLngth;
    grphcs(6) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', massColr);
end