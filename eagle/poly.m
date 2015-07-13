classdef poly
    properties
                
        a0
        a1
        a2
        a3
        
        lowerBound
        upperBound
        
        step
    
        initialX
        
        aoa
        
        c
        
        %perhaps include property for data?
        %should the polynomial know about the angle of attack?
        
        
    end
    
    methods
        function this = poly(coeffs, lowerBound, upperBound, step, initialX, aoa)
            
            this.a0 = coeffs(1);
            this.a1 = coeffs(2);
            this.a2 = coeffs(3);
            this.a3 = coeffs(4);
            
            this.lowerBound = lowerBound;
            this.upperBound = upperBound;
            
            this.step = step;
            
            this.initialX = initialX;
    
            this.aoa = aoa;
            
            this.c = 0.03;
        end
        
        function this = writeVertices(this)
            
            R = [cos(this.aoa) -sin(this.aoa); sin(this.aoa) cos(this.aoa)]; %transformation 
                                                         %matrix
            
            %open the file to write to
            vertex_fid = fopen(['naca2D_' num2str(512) '.vertex'], 'w');
            
            %first line is the number of vertices in the file
            fprintf(vertex_fid, '%d\n', 512);
            
            x = this.lowerBound;
            
            while x < this.upperBound + this.initialX
               
                 %EQUATION FOR POLYNOMIAL DEFINING UPPER SURFACE
                 y = this.a3*x^3 + this.a2*x^2 + this.a1*x + this.a0;
                 
                 %COORDINATES
                 X(1) = this.initialX + x;
                 X(2) = y;
                 
                 %TRANSFORM FOR ANGLE OF ATTACK
                 centerPoint = this.c/2;
                 centerPoint(2) = 0;
                 
                 X = X-centerPoint;
                 X = X*R;
                
                 %PLOT THE POINT
                 plot(X(1),X(2),'*r')
                 
                 %WRITE THE COORDINATES TO THE VERTEX FILE
                 fprintf(vertex_fid, '%1.16e %1.16e\n', X(1), X(2));
                 
                 x = x + this.step;

            end  
            
            %probably should close the file writing to at this point
            fclose(vertex_fid);
            
        end
    end
end