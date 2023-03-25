model lab071
    constant Real a = 0.61;
    constant Real b = 0.000061;
    constant Real N = 1224;
    Real n(start=14);

equation
    der(n) = (a+b*n)*(N-n);

end lab071;
