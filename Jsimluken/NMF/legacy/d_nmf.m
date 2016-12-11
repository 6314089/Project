
function [H, U] = d_nmf(Y, rank, h0, u0)
H = rand(size(Y, 1), rank) + 0.1;
U = rand(rank, size(Y, 2)) + 0.1;
if (exist('h0', 'var'))
    H(1:size(h0, 1), 1:size(h0, 2)) = h0;
end
if (exist('u0', 'var'))
    U(1:size(u0, 1), 1:size(u0, 2)) = u0;
end
avoidZero = 1e-27;

congestedH = false;
congestedU = false;
%while(~(congestedH && congestedU))
for r = 1:1000
    % Eu dist ... seems legit
    tmpH = H .* (Y * U') ./ ((H * U) * U' + avoidZero);
    congestedH = congested(tmpH,H);
    H = tmpH;
    tmpU = U .* (H' * Y) ./ (H' * H * U + avoidZero);
    congestedU = congested(tmpU,U);
    U = tmpU;
    
    % IS divergence ... not sure if this is correct
    %hui = (H * U) .^ -1;
    %yhui2 = (hui .^ 2) .* Y;
    %H = H .* sqrt((yhui2 *  U') ./ (hui * U' + avoidZero));  
    %U = U .* sqrt((H' * yhui2) ./ (H' * hui + avoidZero));
end