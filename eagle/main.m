function main(attackAngle) 

%generates .vertex, .target, etc files

%probably want to initialize .vertex, .target, etc files somewhere in here
%how to know how many nodes though, not sure...
%at this point, poly.writeVertices is taking the place of generateMesh
%call main to generate structure files

%general information
step = 0.0005;
initialX = 0;
aoa = attackAngle;

hold on; %for plotting polynomials
axis([-0.05,0.15,-.05,.05]);

%poly1

a1 = 0.0011623;
a2 = 0.58440583;
a3 = -38.215532;
a4 = 587.250803;

coeffs(1) = a1;
coeffs(2) = a2;
coeffs(3) = a3;
coeffs(4) = a4;

lowerBound = 0.003;
upperBound = 0.03;

poly1 = poly(coeffs, lowerBound, upperBound, step, initialX, aoa);
%poly1.writeVertices(); %lower major curve

%poly2

a1 = 0.00274959;
a2 = 0.6297824;
a3 = -48.058399;
a4 = 813.480322;

coeffs(1) = a1;
coeffs(2) = a2;
coeffs(3) = a3;
coeffs(4) = a4;

lowerBound = 0.0013;
upperBound = 0.03;

poly2 = poly(coeffs, lowerBound, upperBound, step, initialX, aoa);
poly2.writeVertices(); %upper major curve

%poly3

a1 = 0.00101549;
a2 = 0.53652211;
a3 = 45.8653851;
a4 = -12518.758;

coeffs(1) = a1;
coeffs(2) = a2;
coeffs(3) = a3;
coeffs(4) = a4;

lowerBound = 0;
upperBound = 0.003;

poly3 = poly(coeffs, lowerBound, upperBound, step, initialX, aoa);
poly3.writeVertices(); %lower minor curve

%poly4
a1 = 0.00205288;
a2 = 1.36481185;
a3 = -206.91772;
a4 = 10132.6482;

coeffs(1) = a1;
coeffs(2) = a2;
coeffs(3) = a3;
coeffs(4) = a4;

lowerBound = 0;
upperBound = 0.0013;

poly4 = poly(coeffs, lowerBound, upperBound, step/2, initialX, aoa);
poly4.writeVertices(); %upper minor curve

%poly5
a1 = 0.00173061;
a2 = -2.462876;
a3 = 3597.01671;
a4 = -1335505.7;

coeffs(1) = a1;
coeffs(2) = a2;
coeffs(3) = a3;
coeffs(4) = a4;

lowerBound = 0;
upperBound = 0.0005;

poly5 = poly(coeffs, lowerBound, upperBound, step/2, initialX, aoa);
poly5.writeVertices(); %curve for the tip

hold off;

