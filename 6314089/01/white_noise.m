f = 440;        %信号の周波数（A2）
Fs = 44100;     %サンプリング周波数（44.1kHz）
T = 1;          %信号の長さ（秒）
t = 0:(1/Fs):T;

y = sin(2*pi*f*t);

y = y + 0.1 * randn(size(t));

sound(y, Fs);