f = 440;        %�M���̎��g���iA4�j
Fs = 44100;     %�T���v�����O���g���i44.1kHz�j
T = 1;          %�M���̒����i�b�j
t = 0:(1/Fs):T;

y = sin(2*pi*f*t);

sound(y, Fs);