%for•¶
sampleMean = zeros(10, 1);

for k = 1:10
    data = rand (10, 1);
    sampleMean(k) = mean(data)
end
overallMean = mean(sampleMean)


%if•¶
if overallMean < .49
   disp('Mean is less than expected')
elseif overallMean > .51
   disp('Mean is greater than expected')
else
   disp('Mean is within the expected range')
end


%while•¶
n = 10;
f = n;
while n > 1
    n = n-1;
    f = f*n;
end
disp(['n! = ' num2str(f)])


%switch-case•¶‚Æwhile•¶‚Ìbreak
while true
    n = input('Enter a number: ');

    switch n
        case -1
            disp('negative one')
        case 0
            disp('zero')
        case 1
            disp('positive one')
        otherwise
            disp('other value')
            break
    end
end