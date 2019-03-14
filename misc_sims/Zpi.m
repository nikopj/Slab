function Zin = Zpi(ZS,Z1,Z2,Z3,ZL)
Zin = par(Z1, Z2 + par(Z3,ZL) );
end