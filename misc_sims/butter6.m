function y = butter6(b,a,x)
x = [x zeros(1,6)];
y = zeros(size(x));
z = zeros(6,1);

for ii=1:length(x)
    y(ii) = b(1)*x(ii)+z(1);
    z(1) = b(2)*x(ii)+z(2)-y(ii)*a(2);
    z(2) = b(3)*x(ii) + z(3) - y(ii)*a(3);
    z(3) = b(4)*x(ii) + z(4) - y(ii)*a(4);
    z(4) = b(5)*x(ii) + z(5) - y(ii)*a(5);
    z(5) = b(6)*x(ii) + z(6) - y(ii)*a(6);
    z(6) = b(7)*x(ii) - y(ii)*a(7);
end

end