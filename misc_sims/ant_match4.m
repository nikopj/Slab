% ant_match4
clc, clear all, close all

f = 915e6; w = 2*pi*f;

THRESH = 1.5; % VSWR threshold

L_arr = [0:0.1:10]*1e-9;
C_arr = [10:0.1:25]*1e-12;
Z_arr = [1j*w*L_arr, -1j./(w*C_arr)];
l0 = length(Z_arr);

ZS = 50; ZL = 50-1j*110;

lc = length(L_arr+1);

pi_config = {'LLC', 'LCL', 'CCL'};
lc_bounds = containers.Map({'L','C'},{1:lc-1, lc:l0});

figure
m=0;
for config = pi_config
    l1=lc_bounds(config{1}(1)); l2=lc_bounds(config{1}(2)); l3=lc_bounds(config{1}(3));

    Gamma = nan(length(l1),length(l2),length(l3));
    Q = nan(length(l1),length(l2),length(l3));
    mymin = 2;
    for ii=1:length(l1)
        for jj=1:length(l2)
            for kk=1:length(l3)
                Zin = Zpi(ZS,Z_arr(l1(ii)),Z_arr(l2(jj)),Z_arr(l3(kk)),ZL);
                Q(ii,jj,kk) = Qpi(ZS,Z_arr(l1(ii)),Z_arr(l3(kk)),ZL);
                Gamma(ii,jj,kk) = (Zin-ZS)/(Zin+ZS);
            end
        end
    end

    I = abs(Gamma)<VSWRtoG(THRESH);

    [x, HFx] = ZtoLC(Z_arr(l1),f);
    [y, HFy] = ZtoLC(Z_arr(l2),f);
    [z, HFz] = ZtoLC(Z_arr(l3),f);
    [X,Y,Z] = ndgrid(x,y,z);
    m=m+1;
    subplot(1,3,m)
    scatter3(X(I),Y(I),Z(I),Q(I).^2,abs(Gamma(I)))
    xlabel("Z1 ("+HFx+")"); ylabel("Z2 ("+HFy+")"); zlabel("Z3 ("+HFz+")")
    title(config)
    caxis([0,0.2]); colormap jet; colorbar; c=colorbar;
    c.Label.String = "|\Gamma|"; c.Label.Rotation = 0;
    c.Label.FontSize = 14;

end
sgtitle("PI-Network Matching")
