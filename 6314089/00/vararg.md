#vararginとvarargoutについて

##セル配列について
https://jp.mathworks.com/help/matlab/cell-arrays.html

セル配列とはなんでも入る配列みたいなもん？
Object型のリストみたいな．

要素には`{}`でアクセスするみたい．
普通の配列のアクセスは`()`だったけど．


##vararginについて
https://jp.mathworks.com/help/matlab/ref/varargin.html

可変長引数を受け取れる．
javaで言う可変引数`戻り値型 func(型... args)`みたいな？

普通の引数の後に与えた引数は`varargin`で受け取る．

`varargin`はなんでも入るセル配列というものになっているみたい．
Javaの配列で可変長引数を受け取るのとは違ってデータ型は何でもありのようだ．


    function varlist(X, Y, varargin)
        fprintf('Total number of inputs = %d\n',nargin);

        nVarargs = length(varargin);
        fprintf('Inputs in varargin(%d):\n',nVarargs)
        for k = 1:nVarargs
            fprintf('   %d\n', varargin{k})
        end

`nargin`と言うのは普通の引数とか変の引数の両方を合わせた全体の引数の数が渡されるよう．

`varargin`の長さを調べてその長さだけ`for`文で回している．

出力結果

    >> varlist(10, 20, 30, 40, 50, 60)
    Total number of inputs = 6
    Inputs in varargin(4):
       30
       40
       50
       60


MATLABの関数には関数のオーバーロードは存在しない．

オーバーロードされた関数のようなものを作りたいときは，`varargin`で対応する必要がある．
