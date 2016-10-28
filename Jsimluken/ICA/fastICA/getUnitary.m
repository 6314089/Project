function U = getUnitary(Z)
    %Z == k*n matrix; k is channels;Z is whited;
    y = Z;
    len = size(Z);
    channel = len(1);
    %n = len(2);
    U = eye(channel); 
    for index = 1:channel
        for count = 1:10
            y(index,:) = U(index,:) * Z;
            tmp = y(index,:);
            U(index,:) = expectedValue(G_(tmp),tmp)*U(index,:)...
                         - expectedValue(G(tmp)*(Z(index,:))',tmp);
            su = zeros(1,channel);
            for k = 1:index-1
                su = su + (U(k,:)*U(index,:)')*U(k,:);
            end
            disp(size(su));
            
            U(index,:) = U(index,:) - su;
            U(index,:) = U(index,:)/ norm(U(index,:));
        end
    end
return 