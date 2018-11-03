m = 3;  %3^2 antennas per array

co  = 0:(m-1);
[X,Y]=meshgrid(co,co);
x=reshape(X,1,[]); y=reshape(Y,1,[]);
% columns represent different position vectors
r1=[x;y;zeros(size(x))];     %Antenna locationa
r2 = r1;
r2(1:2,:) = r2(1:2,:) + 50;

tags = [15,15,1000];
[theta1, phi1] = relativeAngle(r1', tags);
[theta2, phi2] = relativeAngle(r2', tags);

avTh1 = mean(theta1,1);
avTh2 = mean(theta2,1);
avPhi1 = mean(phi1,1);
avPhi2 = mean(phi2,1);

location = angles2location(r1,avTh1,avPhi1,r2,avTh2,avPhi2,true)
