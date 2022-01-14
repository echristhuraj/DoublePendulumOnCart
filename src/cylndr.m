function grphcs = cylndr(dirctn, trnslatn, rdius, height, wallThcknss, colr, mshDnsty)
    [X, Z] = meshgrid(linspace(-rdius, rdius, mshDnsty), linspace(-height / 2, height / 2, mshDnsty));
    Y = sqrt(rdius^2 - X.^2);
    Z = Z + trnslatn;
    grphcs(1) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', colr);
    Y = -Y;
    grphcs(2) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', colr);

    [T, R] = meshgrid(linspace(0, 2*pi, mshDnsty), linspace((rdius - wallThcknss), rdius, 2));
    X = R .* cos(T);
    Y = R .* sin(T);
    Z = repmat(-height / 2, size(X, 1), size(X, 2)) + trnslatn;
    grphcs(3) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', colr);
    Z = -Z + trnslatn;
    grphcs(4) = surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', colr);

    rotate(grphcs, double([dirctn == 'y', dirctn == 'x', dirctn == 'z']), 90 - 180 * double(dirctn == 'y'), [0, 0, 0]);
end