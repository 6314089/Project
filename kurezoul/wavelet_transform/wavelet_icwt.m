function [data,scale] = wavelet_icwt(spectrogram,size,dt,dj,s0,J1,mother)

mother = upper(mother);
if (strcmp(mother,'MORLET'))
    Cd = 0.776;
    pow = pi.^(-0.25);
elseif (strcmp(mother,'PAUL')) 
    Cd = 1.132;
    pow = 1.079;
elseif (strcmp(mother,'DOG'))
    Cd = 1.966;
    pow = 0.884;
else
    error('Mother must be one of MORLET,PAUL,DOG')
end

scale = s0*2.^((0:J1)*dj);

data = zeros(size,1);
co = sqrt(scale);
for len = 1:size
    reX = co * real(spectrogram(:,len));
    data(len,1) = (dj*sqrt(dt))/(Cd*pow)*reX;
end
return