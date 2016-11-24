function b = createLPF(fe,delta) 
    N = round(3.1 / delta) -1;
    N = N + mod(N,2); %N+1 is odd number
    b = (-N/2):(N/2);
    for i = 1:size(b,2)
       b(i) = 2 * fe * mySinc(2*pi*fe*b(i));
    end
    disp(size(hann(size(b,2))))
    b = b .* hann(size(b,2))';
    
return

function res = mySinc(x)
    if x == 0
        res = 1;
    else
        res = sin(x)/x;
    end
return