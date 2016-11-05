function b = createLPF(fe,delta) 
    N = round(3.1 / delta) -1;
    N = N + mod(N,2); %N+1 is odd number
    b = (-N/2):(N/2);
    for i = 1:size(b,2)
       b(i) = 2 * fe * sinc(2*fe*b(i));
    end
    disp(size(hann(size(b,2))))
    b = b .* hann(size(b,2))';
    
return