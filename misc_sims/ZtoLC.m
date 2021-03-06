function [LC HF] = ZtoLC(Z,f)
    Z = imag(Z);
    if Z>=0
        HF = 'H'; LC = abs(Z)./(2*pi*f);
    else
        HF = 'F'; LC = (1./abs(Z))./(2*pi*f);
    end
end