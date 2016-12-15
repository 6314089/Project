function[piano,bass,drum] = bond(direct_path)

    window = 4096;
    step = 2048;
    wav_des = '/*.wav';
    command = [direct_path,wav_des];
    listing = dir(command);
    file_name = listing.name;
    path = [direct_path,'/',file_name];
    
    [Ham,Pas] = hpss(path, window, step, 0.6, 1.1, 1, 30);

    Y_Pas = abs(Pas);
    F_drum = makeLabeledData(direct_path,['drum']);
    rank = 3;
    mew = 1;
    [G_drum,~,~] = psnmf2(Y_Pas,F_drum,rank,mew);
    

    Y_Ham = abs(Ham);
    F_Ham = makeLabeledData(direct_path,['base','piano']);
    rank = 3;
    mew = 1;
    [G,~,~] = psnmf(Y_Ham,F_Ham,rank,mew);
    
%  H,U -> disposal
%  G -> time function?
end