% ant_match4
clc, clear all, close all

f = 915e6; w = 2*pi*f;

THRESH = 1.5; % VSWR threshold

L_arr = [0:0.1:10]*1e-9;
C_arr = [1:0.1:25]*1e-12;
Z_arr = [1j*w*L_arr, -1j./(w*C_arr)];
l0 = length(Z_arr);

ZS = 50; ZL = 1.5+7.4*1j;

lc = length(L_arr+1);

pi_config = {'CL'};
lc_bounds = containers.Map({'L','C'},{1:lc-1, lc:l0});

figure
m=0;
for config = pi_config
    l1=lc_bounds(config{1}(1)); l2=lc_bounds(config{1}(2));
    
    Gamma = nan(length(l1),length(l2));
    mymin = 2;
    for ii=1:length(l1)
        for jj=1:length(l2)
            Zin = ZS + par(Z_arr(ii), Z_arr(jj) + ZL);
            Gamma(ii,jj) = (Zin-ZS)/(Zin+ZS);
        end
    end

    I = abs(Gamma)<VSWRtoG(THRESH);

    [x, HFx] = ZtoLC(Z_arr(l1),f);
    [y, HFy] = ZtoLC(Z_arr(l2),f);
    [X,Y] = ndgrid(x,y);
    m=m+1;
    subplot(1,length(pi_config),m)
    scatter(X(I),Y(I),1,abs(Gamma(I)))
    xlabel("Z1 ("+HFx+")"); ylabel("Z2 ("+HFy+")");
    title(config)
    caxis([0,0.2]); colormap jet; colorbar; c=colorbar;
    c.Label.String = "|\Gamma|"; c.Label.Rotation = 0;
    c.Label.FontSize = 14;

end
sgtitle("PI-Network Matching")
