function Z = LCtoZ(LC,HF,f)
    if HF == 'H'
        Z = 1j*2*pi*f*LC;
    elseif HF == 'F'
        Z = -1j/(2*pi*f*LC);
    end
end