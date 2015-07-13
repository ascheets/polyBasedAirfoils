function numberNodes = generateMesh(attackAngle)

%GENERATE 2D MESH FOR CAMBER OF A VULTURE WING, FIRST SECTION

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%GRID PARAMETERS
L = 0.1; %Length of computational domain (m) 
FineGrid = 512; %Number of points on finest grid
ds = L/(FineGrid*1.75); %Distance between grid points on finest grid

%CAMBER UPPER SURFACE COEFFICIENTS
a5 = 5879707.6;
a4 = -502013.31;
a3 = 15987.7717;
a2 = -238.34514;
a1 = 1.48783595;
a0 = 0.00208393;

%LOWER SURFACE COEFFICIENTS
b5 = 42894.1084;
b4 = -23249.862;
b3 = 1812.43721;
b2 = -58.911833;
b1 = 0.69002492;
b0 = 0.0011343;

lengthUpper = 0.03;
lengthLower = 0.03;

c = 0.03; %chord length

aoa = attackAngle * pi/180; %angle of attack of the airfoil
R = [cos(aoa) -sin(aoa); sin(aoa) cos(aoa)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%WRITE .VERTEX FILE
vertex_fid = fopen(['naca2D_' num2str(512) '.vertex'], 'w');

numberNodes = (2*(ceil(c/ds)));

%first line is the number of vertices in the file
fprintf(vertex_fid, '%d\n', numberNodes - 4);
hold on
%remaining lines are the initial coordinates of each vertex

initialX = 0;

%WRITE VERTICES FOR UPPER SURFACE
for i = 0:(lengthUpper/ds)
    %determine x and y coordinates of point along lower surface
    
    in = i*ds; %position along the x axis
    
    %EQUATION FOR POLYNOMIAL DEFINING UPPER SURFACE
    y = a5*in^5 + a4*in^4 + a3*in^3 + a2*in^2 + a1*in + a0;
    
    %UPPER SURFACE OF AIRFOIL
    X(1) = initialX + in; %x coordinates of upper surface
    X(2) = y; %y coordinates of upper surface
    
    centerPoint(1) = c/2;
    centerPoint(2) = 0;
    
    X = X-centerPoint;
    X = X*R;
    
    %plot this point
    plot(X(1),X(2),'*r')
    
    if i == 2
        XoUpper(1) = X(1);
        XoUpper(2) = X(2);
    end
    
    axis([-0.05,0.15,-.05,.05]);
    
    %write the coordinates to the vertex file
    fprintf(vertex_fid, '%1.16e %1.16e\n', X(1), X(2));
end

%WRITE VERTICES FOR LOWER SURFACE
for i = 0:((lengthLower/ds)-1)
    %determine x and y coordinates of point along lower surface
    
    in = i*ds; %position along the x axis
        
    %POLYNOMIAL FOR LOWER SURFACE OF WING CROSS SECTION
    y = b5*in^5 + b4*in^4 + b3*in^3 + b2*in^2 + b1*in + b0;
    
    %LOWER SURFACE OF AIRFOIL
    X(1) = initialX + in; %x coordinates of lower surface
    X(2) = y; %y coordinates of lower surface
    
    centerPoint(1) = c/2;
    centerPoint(2) = 0;
    
    X = X-centerPoint;
    
    X = X*R;
    
    %plot this point
    plot(X(1),X(2), '*b')
    
    if i == 2
        XoLower(1) = X(1);
        XoLower(2) = X(2);
    end
    
    %write the coordinates to the vertex file
    fprintf(vertex_fid, '%1.16e %1.16e\n', X(1), X(2));
end

%WRITE VERTICES FOR UPPER TIP


%WRITE VERTICES FOR LOWER TIP


hold off
fclose(vertex_fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%WRITE .TARGET FILE

targetForce = 1.0e2;

target_fid = fopen(['naca2D_' num2str(512) '.target'], 'w');

fprintf(target_fid, '%d\n', numberNodes - 4);

for s = 0:numberNodes - 5
   
    fprintf(target_fid, '%d %1.16e\n', s, targetForce);
    
end

fclose(target_fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


