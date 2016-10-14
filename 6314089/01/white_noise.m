f = 440;
Fs = 44100;
T = 1;
t = 0:(1/Fs):T;

y = sin(2*pi*f*t);

y = y + 0.1 * randn(size(t));

sound(y, Fs);