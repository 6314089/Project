function y = fir(x,b)
    x = x';
    l = size(x,2);
    y = zeros(1,l);
    for n = 1:size(x,1)
        for i = 1:size(b,2)
            %disp(i)
            if (n-i)>0
                y(n) = y(n) + b(i)*x(n-i+1);
            end
        end
    end
return 