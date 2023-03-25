model lab073
    constant Real a = 0.7;
    constant Real b = 0.6;
    constant Real N = 1224;
    Real n(start=14);

equation
    der(n) = (a*time+b*cos(time)*n)*(N-n);

end lab073;
