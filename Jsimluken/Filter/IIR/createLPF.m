function [a,b] = createLPF(fc)
    a = zeros(1,3);
    b = zeros(1,3);
    denom = 1 + (2*sqrt(2)*pi*fc) + 4*pi^2*fc^2;
    b(1) = (4*pi^2*fc^2)/denom;
    b(2) = (8*pi^2*fc^2)/denom;
    b(3) = (4*pi^2*fc^2)/denom;
    a(1) = 1.0;
    a(2) = (8*pi^2*fc^2-2)/denom;
    a(3) = (1 - (2*sqrt(2)*pi*fc) + 4*pi^2*fc^2)/denom;
return