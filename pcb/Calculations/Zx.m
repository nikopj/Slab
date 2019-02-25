function Z = Zx(LC,type,f)
if type == 'L'
    Z = 1j*2*pi*f*LC;
elseif type == 'C'
    Z = -1j/(2*pi*f*LC);
else
    disp('incorrect type');
end
end