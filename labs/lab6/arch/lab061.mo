model lab061
    constant Integer N = 10400;
    constant Integer I0 = 144;
    constant Integer R0 = 28;
    constant Integer S0 = N - I0 - R0;
    constant Real alpha = 0.01;
    constant Real beta = 0.02;
    Real s(start=S0);
    Real i(start=I0);
    Real r(start=R0);
    Real t = time;
equation
    der(s) = 0;
    der(i) = -beta*i;
    der(r) = beta*i;
    annotation(experiment(StartTime = 0, StopTime = 200.0), Documentation);
end lab061;
