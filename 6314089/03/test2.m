%path = '../Audio/A4_sin.wav';
%path = '../Audio/A4_saw.wav';
%path = '../Audio/A4_tri.wav';
%path = '../Audio/A4_squ.wav';
path = '../Audio/A4_tri_F4_tri.wav';

[input, Fs] = audioread(path);
    
%fft
m = length(input);
%n = 1024;
%n = 2048;
%n = 4096;
n = 8192;
Y = fft(input, n);


T = 2;
t = 0:(1/Fs):T;
y = zeros(1, length(t));

nY = length(Y);
for k = 1:nY
    %y = y + abs(Y(k))*sin((2*pi*( k*(Fs/n) )*t) + angle(Y(k)));
    y = y + abs(Y(k) / n)*sin((2*pi*( k*(Fs/n) )*t) + angle(Y(k)));
end

sound(input, Fs);
pause(2.1)
sound(y, Fs);