t = (1:100) / 100;
X = zeros(length(t), 100);

for k = 1:100
    X(:, k) = abs(sin(pi * t * k/10)) +1;
end

hndl = imagesc(X);
im.Parent.YDir = 'normal';
colorbar;