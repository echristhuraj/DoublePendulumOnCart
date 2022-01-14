function nonlnrDynmcs = f(X, u, g, m0, m1, m2, l1, l2)
    dTh = X(5) - X(3);
    massTrm1 = sum([m1, m2 * (sin(dTh))^2]);
    massTrm2 = sum([m1 * cos(X(3)), m2 * sin(X(5)) * sin(dTh)]);
    massTrm3 = sum([m1, m2]) * sin(X(3)) * sin(dTh);
    massTrm2_3 = sum([sum([m1, m2]) * sin(X(3)) * cos(X(3)), -m0 * cos(dTh)]);
    massDenmntr = m0 * m1 + m0 * m2 * (sin(dTh))^2 + m1 * sum([m1, m2]) * sin(X(3))^2;

    nonlnrDynmcs(1, :) = X(2);
    nonlnrDynmcs(2, :) = (sum([m1, m2]) * massTrm1 * l1 * sin(X(3)) * (X(4))^2 + m2 * massTrm1 * l2 * sin(X(5)) * (X(6))^2 + massTrm1 * u(1) + m1 * sum([m1, m2]) * g * sin(X(3)) * cos(X(3))) ...
                         / massDenmntr;
    nonlnrDynmcs(3, :) = X(4);
    nonlnrDynmcs(4, :) = (-sum([m1, m2]) * massTrm2 * l1 * sin(X(3)) * (X(4))^2 - m2 * massTrm2 * l2 * sin(X(5)) * (X(6))^2 - massTrm2 * u(1) + sum([m1, m2]) * sum([m0, m1, m2 * (sin(X(5)))^2]) * g * sin(X(3)) + m2 * massTrm2_3 * g * sin(X(5))) ...
                         / (massDenmntr * l1);
    nonlnrDynmcs(5, :) = X(6);
    nonlnrDynmcs(6, :) = (sum([m1, m2]) * massTrm3 * l1 * sin(X(3)) * (X(4))^2 + m2 * massTrm3 * l2 * sin(X(5)) * (X(6))^2 + massTrm3 * u(1) + sum([m1, m2]) * massTrm2_3 * g * sin(X(3)) + sum([m1, m2]) * sum([m0, sum([m1, m2]) * (sin(X(3)))^2]) * g * sin(X(5))) ...
                         / (massDenmntr * l2);
end