function [wave,scale] = wavelet_cwt(Y,dt,dj,s0,J1,mother)

n1 = length(Y); 
x(1:n1) = Y - mean(Y);
n = length(x);

%....construct wavenumber array used in transform [Eqn(5)]
k = [1:fix(n/2)];
k = k.*((2.*pi)/(n*dt));
k = [0., k, -k(fix((n-1)/2):-1:1)];

%....compute FFT of the (padded) time series
f = fft(x);    % [Eqn(3)]

%....construct SCALE array & empty PERIOD & WAVE arrays
scale = s0*2.^((0:J1)*dj);
wave = zeros(J1+1,n);  % define the wavelet array
wave = wave + i*wave;  % make it complex

% loop through all scales and compute transform
for a1 = 1:J1+1
	[daughter,~,~,~]=wave_bases(mother,k,(1/scale(a1)));	
	wave(a1,:) = ifft(f.*daughter);  % wavelet transform[Eqn(4)]
end

return