function generateMeshExp(attackAngle, coeffsMatrix)

%GRID PARAMETERS

c = 0.03; %chord length

aoa = attackAngle * pi/180; %angle of attack

%at this point we have access to an array of arrays of coefficients

%for each element of the array coeffsMatrix call writePoly
writePoly(coeffsMatrix(1), lowerBound, upperBound)

function writePoly(coeffs, lowerBound, upperBound

%best way to set the coefficients?
a0 = coeffs(1);
a1 = coeffs(2);
a2 = ceoffs(3);
a3 = coeffs(4);
a4 = coeffs(5);
a5 = ceoffs(6);

x = lowerBound;

while x < upperBound
   
    %find coords according to equation...
    y = a5*x^5 + a4*x^4 + a3*x^3 + a2*x^2 + a1*x + a0;
    
    %transform according to angle of attack
   
    %plot vertices
    
    %write the coords to the vertex file
    
    %update x according to globalStep
    
end
