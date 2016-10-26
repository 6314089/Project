
function [H, U] = nmf(Y, rank)
H = rand(size(Y, 1), rank);
U = rand(rank, size(Y, 2));
avoidZero = 1e-27;

for r = 1:100
    % H = H .* (Y * U') ./ ((H * U) * U' + avoidZero);
    % U = U .* (H' * Y) ./ (H' * H * U + avoidZero);
    hui = (H * U) .^ -1;
    yhui2 = (hui .^ 2) .* Y;
    H = H .* sqrt((yhui2 *  U') ./ (hui * U' + avoidZero));  
    U = U .* sqrt((H' * yhui2) ./ (H' * hui + avoidZero));
end