% ant_match2
clc, clear all

f = 915e6; w = 2*pi*f;

L_arr = [0.1:0.1:10]*1e-9;
C_arr = [1:40]*1e-12;
Z_arr = [1j*w*L_arr, -1j./(w*C_arr)];
l0 = length(Z_arr);

ZS = 50; ZL = 50-1j*110;

lc = length(L_arr+1);

figure
m=0;
for LC1=[0,1]
    if LC1==0
        l1 = 1:lc-1;
    else
        l1 = lc:l0;
    end
for LC2=[0,1]
    if LC2==0
        l2 = 1:lc-1;
    else
        l2 = lc:l0;
    end
for LC3=[0,1]
    if LC3==0
        l3 = 1:lc-1;
    else
        l3 = lc:l0;
    end

    inds = nan(3,0);
    Gamma = nan(length(l1),length(l2),length(l3));
    Q = nan(length(l1),length(l2),length(l3));
    mymin = 2;
    for ii=1:length(l1)
        for jj=1:length(l2)
            for kk=1:length(l3)
                Zin = Zpi(ZS,Z_arr(l1(ii)),Z_arr(l2(jj)),Z_arr(l3(kk)),ZL);
                Q(ii,jj,kk) = Qpi(ZS,Z_arr(l1(ii)),Z_arr(l3(kk)),ZL);
                Gamma(ii,jj,kk) = (Zin-ZS)/(Zin+ZS);
                if abs(Gamma(ii,jj,kk)) < 0.2
                    inds = [inds [ii,jj,kk]'];
                end
            end
        end
    end

    I = abs(Gamma)>0.2;
    Gamma(I)=1;
    Q(I)=0.01; 

    [x, HFx] = ZtoLC(Z_arr(l1),f);
    [y, HFy] = ZtoLC(Z_arr(l2),f);
    [z, HFz] = ZtoLC(Z_arr(l3),f);
    [X,Y,Z] = ndgrid(x,y,z);
    m=m+1;
    subplot(4,2,m)
    scatter3(X(:),Y(:),Z(:),Q(:),log(abs(Gamma(:))))
    xlabel("Z1 ("+HFx+")"); ylabel("Z2 ("+HFy+")"); zlabel("Z3 ("+HFz+")")
    sLC = ["L" "C"];
    title(sLC(LC1+1)+sLC(LC2+1)+sLC(LC3+1))
    colorbar

end
end
end
