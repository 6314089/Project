[y0, Fs] = audioread('../Audio/A4_sin.wav');
[y1, Fs] = audioread('../Audio/A4_tri.wav');
[y2, Fs] = audioread('../Audio/A4_sin_A4_saw.wav');
[y3, Fs] = audioread('../Audio/A4_tri_F4_tri.wav');

subplot(2, 2, 1)
plot(y0(1:300))

subplot(2, 2, 2)
plot(y1(1:300))

subplot(2, 2, 3)
plot(y2(1:300))

subplot(2, 2, 4)
plot(y3(1:300))

sound(y0, Fs)
pause(2.5)
sound(y1, Fs)
pause(2.5)
sound(y2, Fs)
pause(2.5)
sound(y3, Fs)