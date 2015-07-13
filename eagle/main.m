function main(attackAngle)

%poly1

a1 = 0.0011623;
a2 = 0.58440583;
a3 = -38.215532;
a4 = 587.250803;

coeffs1(1) = a1;
coeffs1(2) = a2;
coeffs1(3) = a3;
coeffs1(4) = a4;

%poly2

a1 = 0.00274959;
a2 = 0.6297824;
a3 = -48.058399;
a4 = 813.480322;

coeffs2(1) = a1;
coeffs2(2) = a2;
coeffs2(3) = a3;
coeffs2(4) = a4;

%poly3

a1 = 0.00101549;
a2 = 0.53652211;
a3 = 45.8653851;
a4 = -12518.758;

coeffs3(1) = a1;
coeffs3(2) = a2;
coeffs3(3) = a3;
coeffs3(4) = a4;

%poly4
a1 = 0.00205288;
a2 = 1.36481185;
a3 = -206.91772;
a4 = 10132.6482;

coeffs4(1) = a1;
coeffs4(2) = a2;
coeffs4(3) = a3;
coeffs4(4) = a4;

%poly5
a1 = 0.00173061;
a2 = -2.462876;
a3 = 3597.01671;
a4 = -1335505.7;

coeffs5(1) = a1;
coeffs5(2) = a2;
coeffs5(3) = a3;
coeffs5(4) = a4;

coeffsMatrix(1) = coeffs1;
coeffsMatrix(2) = coeffs2;
coeffsMatrix(3) = coeffs3;
coeffsMatrix(4) = coeffs4;
coeffsMatrix(5) = coeffs5;

generateMeshExp(attackAngle, coeffsMatrix);

