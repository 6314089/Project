f = 440;
Fs = 44100;
T = 1;
t = 0:(1/Fs):T;


y1 = sin(2*pi*f*t);

audiowrite('sin.wav', y1, Fs)


y2 = sawtooth(2*pi*f*t);

audiowrite('saw.wav', y2, Fs)


%triangle wave
y3 = sawtooth(2*pi*f*t, 0.5)
plot(t,y3)
axis([0 0.01 -1 1])