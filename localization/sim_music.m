%{
This function simulates AOA estimation from a phased array antenna.
We consider the effects of the sources being a finite distance from the
array.

inputs:
    num_samples: # samples used for auto-correlation matrix
    tag_locs = (3xN) x,y,z location of tags (meters)
    dol: fractional wavelength spacing between antenna elements
    SNR: signal to noise ratio (dB)
    grid_res: resolution of music spectrum (grid_res x grid_res)
    ant_locs = (3xM) x,y,z location of antennas (meters)

outputs:
    AOA = (2xN) actual (average) AOAs of tags
    AOA_hat = (2xN) estimated AOAs of tags
    S_music: generated music spectrum
%}

function [AOA,AOA_hat,S_music] = ...
    sim_music(num_samples, tag_locs, ant_locs, dol, SNR, grid_res)

% 1: if eigen values are in ascending order, 0 else
% on Senior15, use 0, else use 1
EIG_SWITCH = 1;

% freq dependent info
lambda = 3e8/915e6;
d = dol*lambda;

% constants
M = size(ant_locs,2); % number of antennas
N = size(tag_locs,2); % number of sources

% -----------------------------------------------------------
% -------------------- SIGNAL GENERATION --------------------
% -------------------- (for simulation)  --------------------

% perform sim relative to center of array
center = mean(ant_locs, 2);
ant_locs = ant_locs - center;
tag_locs = tag_locs - center;

% returns AOAs from each tag to each antenna, each (MxN)
[theta_act, phi_act] = relativeAngle(ant_locs,tag_locs);
AOA = [sum(theta_act,1) ; sum(phi_act,1)] / M;

% unit wave number vector components, each (MxN)
ax = sind(phi_act).*cosd(theta_act);
ay = sind(phi_act).*sind(theta_act);
az = cosd(phi_act);
% antenna location vector components, each (MxN)
rx = repmat(ant_locs(1,:)',1,N);
ry = repmat(ant_locs(2,:)',1,N);
rz = repmat(ant_locs(3,:)',1,N);

% steering vectors (M,N)
S = exp(2*pi*1j*dol*( rx.*ax + ry.*ay + rz.*az )) / sqrt(M);
% cplx noise (M,num_samples)
v = 10^(-SNR/20)*sqrt(1/2)*( randn(M,num_samples) + 1j*randn(M,num_samples) );
% msg matrix (random phase constant amplitude)
msg = exp(2*pi*1j*rand(N,num_samples));
% received signal matrix (M,num_samples)
A = S*msg + v;

% ----------------------------------------------------------
% -------------------- AOA ESTIMATION ----------------------
% ----------------------------------------------------------

% correlation matrix generation
Rhat = zeros(M);
for ii=1:num_samples
    Rhat = Rhat + A(:,ii)*A(:,ii)';
end

% meshgrid variables
theta_vec = linspace(-180,180,grid_res);
phi_vec   = linspace(0,90,grid_res);
[THETA_GRID, PHI_GRID] = meshgrid(theta_vec, phi_vec);
ak = zeros(grid_res,grid_res,3);
ak(:,:,1) = sind(PHI_GRID).*cosd(THETA_GRID);
ak(:,:,2) = sind(PHI_GRID).*sind(THETA_GRID);
ak(:,:,3) = cosd(PHI_GRID);
S_music = nan(grid_res);

% finds G, the noise subspace matrix of Rhat
[V, ~] = eig(Rhat);
if EIG_SWITCH
    G = V(:,1:end-N);
else
    G = V(:,1+N:end);
end

% music spectrum 
for ii=1:grid_res
    for jj=1:grid_res
        dir_vec = reshape( ak(ii,jj,:), 1, 3);
        s = exp(-2*pi*1j*ant_locs.'*dir_vec.');
        S_music(ii,jj) = 1./(s'*(G*G')*s);
    end
end

AOA_hat = peak2angles(S_music, N, theta_vec, phi_vec);
end