clear; clc;close all;
dol = 0.5;
lambda = 3e8/915e6;
d = dol*lambda;

num_samples = 1e3;
num_antennas = 9;
tags = [.5,.5,1]
SNR = 20;
grid_res = 200;

m = 3;  %3^2 antennas per array

co  = -1:(m-2);
co = co*d;
[X,Y]=meshgrid(co,co);
x=reshape(X,1,[]); y=reshape(Y,1,[]);
% columns represent different position vectors
r1=[x;y;zeros(size(x))];     %Antenna locationa
r2 = r1;
r2(1,:) = r2(1,:) + 1;

[theta1, phi1] = relativeAngle(r1', tags);
[theta2, phi2] = relativeAngle(r2', tags);
avth1 = mean(theta1);
avphi1 = mean(phi1);
avth2 = mean(theta2);
avphi2 = mean(phi2);

[~, pangles1, ~, ~,ant1,Rhat1] = func_musicboi(num_samples, , tags, dol, SNR, grid_res,r1);
[~, pangles2, ~, ~,ant2,Rhat2] = func_musicboi(num_samples, num_antennas, tags, dol, SNR, grid_res,r2);
%[~, pangles3, ~, ~,~,Rhat3] = func_musicboi(num_samples, num_antennas, tags-[50,50,0], dol, SNR, grid_res,r1);


%tags = tags*d
%ant2 = r2*d;
figure
scatter3(ant1(1,:),ant1(2,:),ant1(3,:))
hold on
scatter3(ant2(1,:),ant2(2,:),ant2(3,:))
hold on
scatter3(tags(:,1),tags(:,2),tags(:,3))

angles2location(ant1,pangles1(1,:),pangles1(2,:),ant2,pangles2(1,:),pangles2(2,:),true)
