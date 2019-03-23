% ant_match4
clc, clear all, close all

f = 915e6; w = 2*pi*f;

THRESH = 1.5; % VSWR threshold

L_arr = [0:0.1:10]*1e-9;
C_arr = [0.5:0.1:25]*1e-12;
Z_arr = [1j*w*L_arr, -1j./(w*C_arr)];
l0 = length(Z_arr);

ZS = 50; ZL = 4.5+39.6*1j;

lc = length(L_arr+1);

pi_config = {'C'};
lc_bounds = containers.Map({'L','C'},{1:lc-1, lc:l0});

figure
m=0;
for config = pi_config
    l1=lc_bounds(config{1}(1));
    
    Gamma = nan(length(l1));
    mymin = 2;
    for ii=1:length(l1)
        Zin = par(Z_arr(ii), ZL);
        Gamma(ii) = (Zin-ZS)/(Zin+ZS);
    end

    I = abs(Gamma)<VSWRtoG(THRESH);

    [x, HFx] = ZtoLC(Z_arr(l1),f);
    %[X,Y] = ndgrid(x,y);
    m=m+1;
    subplot(1,length(pi_config),m)
    scatter(x(I),abs(Gamma(I)))
    xlabel("Z1 ("+HFx+")"); ylabel('\Gamma');
    title(config)

end
sgtitle("PI-Network Matching")