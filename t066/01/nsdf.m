%***********************************************************
% Returns NSDF of input signal if successful / [] if failed
% Pre:
%       signal = Windowed monophobic signal
%***********************************************************
function ret = nsdf(signal)
    % Set the window size
    W = length(signal);
    % Maximum delay amount is half the window size (maybe lol)
    w = W / 2;
    
    % Expand signal and get ACF (AutocorrelationFunction)  part
    paddingLength = 2 ^ nextpow2(2 * (W + w) - 1);
    ffted = fft(signal, paddingLength);
    acf = ifft(ffted .* conj(ffted));
    % Arrange acf to lag-based-symmetry order
    % Start index is "-(w-1)" index w is where lag = 0
    % ** seems there's something I don't understand
    %    I decided to take another way, thus, this got commented **
    % acf = [acf(end - w + 2: end); acf(1:w)];
    
    %-----
    % maybe the process till here can be replaced by xcorr()
    %-----
    
    % Get summation part
    % Set m
    signalPow2 = signal .* signal;

    m = zeros(w + 1, 1); % m(index) where index-1 = tau
    m(1) = sum(signalPow2) * 2;
    for j = 1 : w
        m(j + 1) = m(j) - signalPow2(j) - signalPow2(W - j + 1); % + signalPow2(W + j) which is always 0
    end
    % Get nsdf
    r2 = acf * 2;
    ret = zeros(w, 1);
    for tauPlusOne = 1 : w
        ret(tauPlusOne) = r2(tauPlusOne) / m(tauPlusOne);
    end
    %ret = [r2(1:w + 1) m];
    return;
end