#max関数
https://jp.mathworks.com/help/matlab/ref/max.html

##1

    v = randn(1, 20);

    disp('max value in v is')
    max(v)

max関数にベクトルを与えると最大要素を返す．

出力結果

    max value in v is

    ans =

        1.6821

##2

    v = randn(20, 1)

    disp('max value in v is')
    max(v)

列ベクトルでも同じ．

出力結果

    v =

       -0.3268
        0.8123
        0.5455
       -1.0516
        0.3975
       -0.7519
        1.5163
       -0.0326
        1.6360
       -0.4251
        0.5894
       -0.0628
       -2.0220
       -0.9821
        0.6125
       -0.0549
       -1.1187
       -0.6264
        0.2495
       -0.9930

    max value in v is

    ans =

        1.6360

##3
行列に対してmaxを掛けてみる．

    A = [1 2 3; 4 5 6; 7 8 9]

    disp('max values is')
    max(A)

出力結果

    A =

         1     2     3
         4     5     6
         7     8     9

    max values is

    ans =

         7     8     9

各列の最大値を取った行ベクトルが出力される．
