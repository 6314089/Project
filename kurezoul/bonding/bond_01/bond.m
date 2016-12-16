function[piano,bass,drum] = bond(data_path,direct_path)

    [Ham,Pas] = hpss(data_path, 4096, 2048, 0.6, 1.1, 1, 30);

    % Pas -> izac 

    Y = abs(Ham);
    path_base = '/base';
    path_piano = '/piano';
    path_base = [direct_path,path_base];
    path_piano = [direct_path,path_piano];
    F_1 = makeLabeledData(path_base);
    F_2 = makeLabeledData(path_piano);
    base_len = size(F_1);
    piano_len = size(F_2); 
    
    F = [F_1,F_2];
    rank = 3;
    mew = 1;
    [G,~,~] = psnmf(Y,F,rank,mew);
    
    G_base = G(1:base_len,:); 
    G_piano = G(base_len:base_len+piano_len,:);
%  H,U -> disposal
%  G -> time function?
end