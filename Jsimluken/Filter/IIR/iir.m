function y = iir(x,a,b)
    y = zeros(size(x));
    disp(size())
    %Q = size(a,2) - 1;
    %P = size(b,2) - 1;
    for n = 1:size(x,1)
        for i = 1:size(b,2)
            if n-i+1 >0
                y(n) = y(n) + b(i)*x(n-i+1);
            end
        end
        for j = 1:size(a,2)
            if n-j+1>0
               y(n) = y(n) -a(j) * y(n-j+1);  
            end
        end
    end
return