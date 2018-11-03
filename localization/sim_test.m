clear all, close all;

dol = .5;
lambda = 3e8/915e6;
d = dol*lambda;

M = 9;
m = [-1:1]*d;
[X,Y] = ndgrid(m);
x = reshape(X,1,[]);
y = reshape(Y,1,[]);
ant_locs = [x;y;zeros(size(x))];

tag_locs = [0;2;2];
SNR = 10;
grid_res = 100;

[AOA, AOA_hat, S_music] = sim_music(1e3, tag_locs, ant_locs, ...
    dol, SNR, grid_res);

AOA, AOA_hat

figure
subplot(1,2,1)
t = linspace(-180,180,grid_res);
p = linspace(0,90,grid_res);
[T,P] = ndgrid(t,p);
surfc(P,T,20*log10(abs(S_music)))

subplot(1,2,2)
scatter3(ant_locs(1,:), ant_locs(2,:), ant_locs(3,:))
hold on
scatter3(tag_locs(1,:), tag_locs(2,:), tag_locs(3,:))
xlim([-1 3])
ylim([-1 3])
zlim([0 3])
