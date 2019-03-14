


%%
f = 915e6; w = 2*pi*f;

ZL = 50-110*1j;
ZS = 50;

Larr = [1 3 6.8 10 18 30 36 75 330]*1e-9; ZLarr = 1j*w*Larr;
Carr = [0.5 1 4 4.4 8 11 15 100 180 47 1e5 10000 1e6 2.2e6]*1e-12; ZCarr = 1./(1j*w*Carr);
Zarr = [ZLarr ZCarr];
l = length(Zarr);

Gamma1 = nan(l,l,l);
x=0; y=0; z=0;
M = 2;
% PI MATCH
for ii=1:l
    for jj=1:l
        for kk=1:l
            Zin = par( par(ZL,Zarr(ii)) + Zarr(jj) , Zarr(kk) );
            Gamma1(ii,jj,kk) = (Zin-ZS)/(Zin+ZS);
            if abs(Gamma1(ii,jj,kk)) < M
                M = abs(Gamma1(ii,jj,kk));
                x=ii; y=jj; z=kk;
            end
        end
    end
end

x,y,z
abs(Gamma1(x,y,z))

x=0; y=0; z=0;
M = 2;
Gamma2 = nan(l,l);
% L-MATCH
for ii=1:l
    for jj=1:l
        Zin = par(ZL,Zarr(ii)) + Zarr(jj);
        Gamma2(ii,jj) = (Zin-ZS)/(Zin+ZS);
         if abs(Gamma2(ii,jj)) < M
                M = abs(Gamma2(ii,jj));
                x=ii; y=jj;
         end
    end
end

x,y
abs(Gamma2(x,y))

ZL = 30-1j*100;
ZS = 50;

Gamma3 = nan(l,l);
M = 2;
for ii=1:l
    for jj=1:l
        Zin = par(ZL+Zarr(jj),Zarr(ii));
        Gamma3(ii,jj) = (Zin-ZS)/(Zin+ZS);
        if abs(Gamma3(ii,jj)) < M
                M = abs(Gamma3(ii,jj));
                x=ii; y=jj;
        end
    end
end

x,y
abs(Gamma3(x,y))

ZL = 42.7 + 81.8*1j;

Gamma4 = nan(1,l);
M = 2;
for ii=1:l
    Zin = par(ZL,Zarr(ii));
    Gamma4(ii) = (Zin-ZS)/(Zin+ZS);
    if abs(Gamma4(ii))<M
        M = abs(Gamma4(ii));
        x = ii;
    end
end

x
abs(Gamma4(x))