function [i,j] = brute_force(orgSpectrum,srcs1,srcs2)
    size1 = size(srcs1);
    size1 = size1(2);
    size2 = size(srcs2);
    size2 = size2(2);
    res = zeros([size1,size2]);
    for i = 1:size1
        for j = 1:size2
           [tmpSpectrum1,tmpSpectrum2] = atmSeparater(orgSpectrum,srcs1(:,i),srcs2(:,j)) ;
           res(i,j) =  (evalSpectrum(orgSpectrum,tmpSpectrum1)+...
               evalSpectrum(orgSpectrum,tmpSpectrum2))/2;
        end
    end
    [M1,I1] = min(res);
    [M2,I2] = min(M1);
    i = I1(I2);
    j = I2;
return 