#ステレオ音源に限定したICA
##実行方法
    X = audioread('hoge.wav');
    Y = stereoICA(X);
##stereoICA.m
メイン関数
##getWhitener.m
白色化行列を求める。
観測信号Xの分散共分散行列を単位行列にする変換を求めることで実現。
##TRolling.m
回転行列を求める。
##maxKurtosis.m
白色化された観測信号から尖度を最大とする回転角度を求める。
