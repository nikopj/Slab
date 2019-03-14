function Q = Qpi(ZS,Z1,Z3,ZL)
Q = 0.5*( real(ZS)/abs(imag(Z1)) + real(ZL)/abs(imag(Z3)) );
end