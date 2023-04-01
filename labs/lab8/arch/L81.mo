model L81
  constant Real M10 = 4.2 * 1000000;
  constant Real M20 = 3.8* 1000000;

  constant Real pcr = 11.4 * 1000;
  constant Integer N = 26* 1000;
  constant Integer q = 1;

  constant Integer tau1 = 14;
  constant Integer tau2 = 22;

  constant Real p1 = 6.6 * 1000;
  constant Real p2 = 4.5* 1000;

  constant Real a1 = pcr / (tau1^2 * p1^2 * N * q);
  constant Real a2 = pcr / (tau2^2 * p2^2 * N * q);
  constant Real b = pcr / (tau1^2 * p1^2 * tau2^2 * p2^2 * N * q);
  constant Real c1 = (pcr - p1) / (tau1 * p1);
  constant Real c2 = (pcr - p2) / (tau2 * p2);
  
  Real t = time / c1;
  Real M1(t);
  Real M2(t);

initial equation
  M1 = M10;
  M2 = M20;
equation
  der(M1) = M1 - (b/c1) * M1 * M2 - (a1/c1) * M1^2;
  der(M2) = (c2/c1) * M2 - (b/c1) * M1 * M2 - (a2/c1) * M2^2;
  annotation(experiment(StartTime=0, StopTime=16, Interval=0.2));
end L81;