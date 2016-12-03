function [F,G,H,U] = psnmf(Y,F,rank,mew)
    [OMEGA,T] = size(Y);
    frank = size(F,2); % col counts of F which is traning data
    G = rand(frank,T);
    H = rand(OMEGA,rank);
    U = rand(rank,T);
    Z = rand(size(Y));
    
    
    for i = 1:100
        %updating G
        for k = 1:frank
            for t = 1:T
                tmpGN = 0; 
                tmpGD = 0;
                for omega = 1:OMEGA
                    tmpGN = tmpGN + F(omega,k)*Y(omega,t)*Z(omega,t)^(-1);
                    tmpGD = tmpGD + F(omega,k);
                end
                G(k,t) = G(k,t) * tmpGN/tmpGD;
            end
        end    
        % updating H
        for omega = 1:OMEGA
            for l = 1:rank
                tmpHN = 0;
                tmpHD1 = 0;
                tmpHD2 = 0;
                tmpHD3 = 0;
                for t = 1:T
                   tmpHN = tmpHN + Y(omega,t)*U(l,t)*(Z(omega,t)^(-1));
                   tmpHD1 = tmpHD1 + U(l,t);
                end
                for k = 1:frank
                    tmpHD2 = tmpHD2+F(omega,k);
                    for omega_ = 1:OMEGA
                        tmpHD3 = tmpHD3 + F(omega_,k)*H(OMEGA_,l);
                    end
                end
                H(omega,l) = H(omega,l)*(tmpHN/(tmpHD1*2*mew*tmpHD2*tmpHD3));
            end
        end
        %updating U
        for l = 1:rank
            for t = 1:T
               tmpUN = 0;
               tmpUD = 0;
               for omega = 1:OMEGA
                   tmpUN = tmpUN + H(omega,l)*Y(omega,t)*(Z(omega,t)^(-1));
                   tmpUD = tmpUD + H(omega,l);
               end
               U(l.t) = tmpUN/tmpUD;
            end
        end
    end    
return