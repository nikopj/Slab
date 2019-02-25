%% MIXER OUTPUT
f = 15e6;

R = 245;
C1 = 0.4e-12; ZC1 = Zx(C1,'C',f);
C2 = 0.2e-12; ZC2 = Zx(C2,'C',f);
L1 = 1.2e-9; ZL1 = Zx(L1,'L',f);
L2 = L1; ZL2 = Zx(L2,'L',f);

Z = par(par(R,ZC1)+ZL1+ZL2,ZC2)
%Z = 201-1j*169;

L3 = 6.8e-9; 
L3 = linspace(0,10e-6,500);
ZL3 = Zx(L3,'L',f);
ZL4 = ZL3;
ZL = ZL3;


Zout = 2./((1./ZL) + (2/Z));

plot(L3,imag(Zout))


%% MIXER INPUT
f = 1.75e9;
ZC = Zx(200e-12,'C',f);
R1 = 75;
R2 = 450;

Zout = 2*R2*(ZC+R1)/(ZC+R1+2*R2)

par(Zout, Zx(0.7e-12,'C',f))