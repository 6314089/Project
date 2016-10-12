#test4.m
制御構文について．

    %for文
    sampleMean = zeros(10, 1);

    for k = 1:10
        data = rand (10, 1);
        sampleMean(k) = mean(data)
    end
    overallMean = mean(sampleMean)


    %if文
    if overallMean < .49
       disp('Mean is less than expected')
    elseif overallMean > .51
       disp('Mean is greater than expected')
    else
       disp('Mean is within the expected range')
    end


    %while文
    n = 10;
    f = n;
    while n > 1
        n = n-1;
        f = f*n;
    end
    disp(['n! = ' num2str(f)])


    %switch-case文とwhile文のbreak
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

全部大体見たまんま．

switchは各caseごとにbreakは必要ない．

switchの最後はdefaultではなくてotherwise．

whileとかでbreakやcontinueも使える．

whileやifでつかえる関係演算子については https://jp.mathworks.com/help/matlab/matlab_prog/array-comparison-with-relational-operators.html
