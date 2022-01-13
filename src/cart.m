function grphcs = cart(cartColr, axleColr, mshDnsty)
    grphcs(1:4) = cylndr('x', 0, 0.35, 0.75, 0.1, cartColr, mshDnsty);
    grphcs(5:8) = cylndr('y', -0.25, 0.05, 0.4, 0.05, axleColr, mshDnsty);
end