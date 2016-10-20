function res = brute_force(orgSpectrum,srcs1,srcs2)
    size1 = size(srcs1);
    size2 = size(srcs2);
    res = zeros([size1,size2]);
    for i = 1:size1
        for j = 1:size2
           [tmpSpectrum1,tmpSpectrum2] = atmseparater(orgSpectrum,srcs1(i),srcs2(j)) ;
           res(i,j) =  (evalSpectrum(orgSpectrum,tmpSpectrum1)+...
               evalSpectrum(orgSpectrum,tmpSpectrum2));
        end
    end
return 