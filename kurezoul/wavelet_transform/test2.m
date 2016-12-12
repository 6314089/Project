[data, Fs] = audioread('Twinkle_Twinkle_Little_Star_all.wav');
data = (data(:, 1) + data(:, 2)) / 2;

start = 1;en = 88200;fs = 44100;

[spec,scale] = wavelet_base(1,data,fs,start,en);
[x,scale] = wavelet_base(2,spec,fs,start,en);

data = data(start:en,1);
div = zeros(length(scale),1);
for size = 1:length(scale)
    div(size,1) = abs(data(size,1) - x(size,1));
end
med = mean(div);
high = max(div);

z = 1:1:(en - start + 1);


figure
subplot(2,1,1)
plot(z,data,z,x)
subplot(2,1,2)
plot(z,x,z,data)