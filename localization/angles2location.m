%Takes antenna array locations and calculates the location of the tags
%based on the center of each array.

%Inputs
%ant1, ant2 = (3x_) antenna arrays
%theta1, theta2 = (1xN) Azimuthal anglse of tags realtive to each array
%   N tags. The rows of theta 1 and 2 correspond to the same tag
%phi1, phi2 = (1xN) Polar angles of tags relative to each array 
%   N tags. The rows of phi 1 and 2 correspond to the same tag
%graph = Boolean: True = Show Graph, False = Hide Graph

%Outputs
%location = (Nx3) coordinates of tag locations

function location = angles2location(ant1,theta1,phi1,ant2,theta2,phi2,graph)
    N = length(theta1);                     %Number of tags
    c1 = sum(ant1,2)/size(ant1,2);          %Center of array 1
    c2 = sum(ant2,2)/size(ant2,2);          %Center of array 2
    
    v1 = [cosd(phi1);sind(phi1);cotd(theta1)];      %Direction vectors for array 1
    v2 = [cosd(phi2);sind(phi2);cotd(theta2)];      %Direction vectors for array 2
    
    n1 = cross(v1,cross(v2,v1,1),1);
    n2 = cross(v2,cross(v1,v2,1),1);
    
    r1 = repmat(c1,1,N) + repmat(dot(repmat(c2-c1,1,N),n2,1)./(dot(v1,n2,1)),3,1).*v1;
    r2 = repmat(c2,1,N) + repmat(dot(repmat(c1-c2,1,N),n1,1)./(dot(v2,n1,1)),3,1).*v2;
    
    location = (r1+r2)/2;
    
    if graph
        figure
        for k = 1:N
            n = 1000;
            t = linspace(0,3,n);
            r1 = c1 + repmat(v1(:,k),1,n).*[t;t;t];
            r2 = c2 + repmat(v2(:,k),1,n).*[t;t;t];
            plot3(r1(1,:),r1(2,:),r1(3,:),'b')
            hold on
            plot3(r2(1,:),r2(2,:),r2(3,:),'r')
        end

        hold on
        scatter3(location(1,:),location(2,:),location(3,:))
        hold on
        xlabel('x')
        ylabel('y')
        zlabel('z')
        grid on
    end
    location = location';
end