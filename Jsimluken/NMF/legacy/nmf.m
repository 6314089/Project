
function [H, U] = nmf(Y, rank, h0, u0)
p = 0.9;
gamma = 30;
[O,T] = size(Y);
H = rand(O, rank) + 0.1;
U = rand(rank, T) + 0.1;
if (exist('h0', 'var'))
    H(1:size(h0, 1), 1:size(h0, 2)) = h0;
end
if (exist('u0', 'var'))
    U(1:size(u0, 1), 1:size(u0, 2)) = u0;
end
avoidZero = 1e-27;
congestedH = false;
congestedU = false;
while(~(congestedH && congestedU))
%for i = 1:1000    
    tmpH = H .* (Y*U'./(H*(U*U')+avoidZero));
    congestedH = congested(tmpH,H);
    H = tmpH;
    tmpU = U.*(H'*Y./(H'*H*U+gamma*p.*abs(U.^(p-2))+avoidZero));
    congestedU = congested(tmpU,U);
    U = tmpU;
    %for o = (1:O)
     %   for d1 = (1:rank)
      %      tmp = H(o,d1) * (Y*U'./(H*(U*U')+avoidZero));
       %     disp(size(tmp));
        %    H(o,d1) = tmp;
        %end
    %end
   % for d2 = (1:rank)
    %   for t = 1:T
          % U(d2,t) = U(d2,t)*(H'*Y./(H'*H*U+gamma*p*abs(u(d2,t)^(p-2))+avoidZero));
     %  end
end
    
    
    
    
    
    % Eu dist ... seems legit
    %H = H .* (Y * U') ./ ((H * U) * U' + avoidZero);
    %U = U .* (H' * Y) ./ (H' * H * U + avoidZero);
    
    % IS divergence ... not sure if this is correct
    %hui = (H * U) .^ -1;
    %yhui2 = (hui .^ 2) .* Y;
    %H = H .* sqrt((yhui2 *  U') ./ (hui * U' + avoidZero));  
    %U = U .* sqrt((H' * yhui2) ./ (H' * hui + avoidZero));
end