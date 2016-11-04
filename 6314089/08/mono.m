function mono = mono(data)
if size(data, 2) == 2
    mono = (data(:, 1) + data(:, 2)) / 2;
else
    mono = data;
end