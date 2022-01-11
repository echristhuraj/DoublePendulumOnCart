function grphcs = cylndr(dirctn, radius, height, wallThcknss, colr, mshDnsty)
    [X, Z] = meshgrid(linspace(-radius, radius, mshDnsty), linspace(-height / 2, height / 2, mshDnsty));
    Y = sqrt(radius^2 - X.^2);
    grphcs(1) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', colr);
    Y = -Y;
    grphcs(2) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', colr);

    [T, R] = meshgrid(linspace(0, 2*pi, mshDnsty), linspace((radius - wallThcknss), radius, 2));
    X = R .* cos(T);
    Y = R .* sin(T);
    Z = repmat(-height / 2, size(X, 1), size(X, 2));
    grphcs(3) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', colr);
    Z = -Z;
    grphcs(4) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', colr);

    rotate(grphcs, double([dirctn == 'y', dirctn == 'x', dirctn == 'z']), 90, [0, 0, 0]);
end