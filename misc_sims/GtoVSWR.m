function vswr = GtoVSWR(G)
vswr = (1+abs(G))/(1-abs(G));
end