[y, Fs] = audioread('../Audio/A4_saw.wav');

m = length(y); %window length
n = 2^nextpow2(m);
Y = fft(y, n);
f = (0:n-1)*(Fs/n);

plot(f, abs(Y))
axis([0, 22050, 0, 30000])
