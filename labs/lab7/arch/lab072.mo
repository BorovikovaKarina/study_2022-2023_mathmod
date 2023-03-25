model lab072
    constant Real a = 0.000073;
    constant Real b = 0.073;
    constant Real N = 1224;
    Real n(start=14);

equation
    der(n) = (a+b*n)*(N-n);

end lab072;
