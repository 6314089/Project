%**************************************************************************
% Plots spectrogram
%
% Pre:
%       spectrogram = n * m vector represents spectrogram
%       f           = n * 1 vector stores Hz range
%       t           = 1 * m vector stores time range
%       halfLength  = If true, plots only upto half of the maximum frequency
%**************************************************************************
function plotsp(spectrogram, f, t, halfLength)
    % Plot only half of given length if halfLength == true
    if (halfLength)
        f = f(1:length(f) / 2 + 1);
        spectrogram = spectrogram(1:length(spectrogram) / 2 + 1, :);
    end
    
    % Plot
    db = 20 * log10(spectrogram .* conj(spectrogram));
    surf(t, f, db, 'edgecolor', 'none');
    axis tight;
    view(0, 90);
end