% linear array AOA by XSBS
% 1 source
clc; clear all; close all;

% ------------------
% --- Parameters ---
% ------------------

M = 17;
K = 32;
nn = 1000;
N = nn*(K+1);
phi = [23 100]*pi/180; % actual AOA in radians
dol = 0.5; % antenna separation, d, over lambda
beta = 2*pi*dol;
SNR = 10; % dB
num_sources = length(phi);
Ra = eye(num_sources); % correlation matrix

% -------------------------
% --- Signal Generation ---
% -------------------------

% steering matrix
S = zeros(M,length(phi));
S(1:M,:) = [exp(-1j*beta*cos(phi).*([1:M]'-1))]/sqrt(M);

Rx = S*Ra*S'+10^(-SNR/10)*eye(M);
% signal vector
% constant amplitude random phase
% alpha = exp(2*pi*1j*rand(num_sources,N));
alpha = 1-2*randi([0 1],num_sources,N);
% noise vector
v = 10^(-SNR/20)*(1/sqrt(2))*(randn(M,N)+1j*randn(M,N));
% received vector
x = S*sqrtm(Ra)*alpha + v;

% correlation estimation
Rhat=zeros(M,M);
for ii=1:nn
Rhat = Rhat+x(:,ii)*x(:,ii)';
end
Rhat=Rhat/nn;
lambda=eig(Rhat);

%% 
% -------------
% --- MUSIC ---
% -------------

% physical angle (deg)
p = linspace(0,180,nn); 

s = zeros(M,nn);
s(1:M,:) = exp(-1j*beta*cos(p*pi/180).*([1:M]'-1));

[V, ~] = eig(Rhat);
G = V(:,1:end-num_sources);
S_music=zeros(nn,1);
for ii=1:nn
  S_music(ii)= 1./(s(:,ii)'*(G*G')*s(:,ii));
end

plot(p, 10*log10(abs(S_music)))
title("MUSIC")
xlim([0,180])

%%
% -------------
% --- XSBS ---
% ------------- 

% phase 1: x0
W = eye(M);
Rk0 = zeros(1,K);
for j=1
    w0 = W(j,:);
    n = 1:nn;
    x0 = sum( w0*S*sqrtm(Ra)*alpha(:,n) + v(:,n), 1);

    % phase 2:
    phik = linspace(0,180,K);
    R = 30; % dB antenna mainlobe to sidelobe ratio

    for i=1:K
       n = nn*(i) + [1:nn];
       wk = dolph(dol, phik(i), M, R).';
       xk = sum( wk'*S*sqrtm(Ra)*alpha(:,n) + v(:,n), 1);
       Rk0(i) = Rk0(i) + xk*x0'/nn;
    end
end
Rk0 = Rk0/M;
figure
plot(phik, 10*log10(abs(Rk0)))

%%
% ------------------------------
% --- Antenna Array Patterns ---
% ------------------------------
figure
min_res = 100;
for i=1:K
    [w, dph] = dolph(dol, phik(i), M, R);
    [g, phi] = array(dol, w, K);
    if i==1
        dbz(phi,g);
    else
        dbadd(2, '-b', phi, g);
    end
    if dph < min_res
        min_res = dph;
    end
end
min_res
