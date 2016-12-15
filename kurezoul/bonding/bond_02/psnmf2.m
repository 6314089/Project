function [G,H,U,Z] = psnmf2(Y,F,rank,mew)
    [OMEGA,T] = size(Y);
    frank = size(F,2); % col counts of F which is traning data
    G = rand(frank,T);
    H = rand(OMEGA,rank);
    U = rand(rank,T);
    Z  = zeros(size(Y));
    avoidZero = 1e-27;
    mew2 = 2 * mew;
    for i = 1:100
        disp(i);
        %updating Z
        Z = F*G + H*U;
        yDivZ = Y ./ (Z + avoidZero);
        %disp(Z);
        %updating G
        G = bsxfun(@rdivide, G .* (F' * yDivZ), sum(F)' + avoidZero);
        % updating H
        H = H .* (yDivZ * U') ./ (bsxfun(@plus, sum(U, 2)', (F * (F' * H)) * mew2) + avoidZero);
        %updating U
        U = bsxfun(@rdivide, U .* (H' * yDivZ), sum(H)' + avoidZero);
    end    
return