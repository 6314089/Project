function [G,H,U,Z] = psnmf2(Y,F,rank,mew)
    [OMEGA,T] = size(Y);
    frank = size(F,2); % col counts of F which is traning data
    G = rand(frank,T);
    H = rand(OMEGA,rank);
    U = rand(rank,T);
    Z  = zeros(size(Y));
    avoidZero = 1e-27;
    mew2 = 2 * mew;
    isCongested = false;
    count = 0;
    %while~(isCongested)
    for i = 1:1000
        count = count +1;
        %disp(count);
        %updating Z
        Z = F*G + H*U;
        
        yDivZ = Y ./ (Z + avoidZero);
        %updating G
        tmpG = bsxfun(@rdivide, G .* (F' * yDivZ), sum(F)' + avoidZero);
        isCongested = isCongested &congested(tmpG,G);
        G = tmpG;
        % updating H
        tmpH = H .* (yDivZ * U') ./ (bsxfun(@plus, sum(U, 2)', (F * (F' * H)) * mew2) + avoidZero);
        isCongested = isCongested &congested(tmpH,H);
        H = tmpH;
        %updating U
        tmpU = bsxfun(@rdivide, U .* (H' * yDivZ), sum(H)' + avoidZero);
        isCongested = isCongested &congested(tmpU,U);
        U = tmpU;
    end    
return