[data, Fs] = audioread('../Audio/drums_120bpm.wav');
vol = vol_quantize(data, 4410);

plot(vol)