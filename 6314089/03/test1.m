%path = '../Audio/A4_sin.wav';
%path = '../Audio/A4_saw.wav';
%path = '../Audio/A4_tri.wav';
path = '../Audio/A4_squ.wav';
%path = '../Audio/A4_tri_F4_tri.wav';

[audio, Fs] = audioread(path);
a4saw = A_frequencies(path);


sound(audio, Fs);
pause(2.2);
play_a(a4saw, Fs, 2);
