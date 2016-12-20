function [F,G] =  bond(direct_path)

    window = 4096;
    step = 2048;
    rank = 3;
    mew = 1;
    wav_des = '/*.wav';
    command = [direct_path,wav_des];
    listing = dir(command);
    
    if ismac
        file_name = listing(2).name;
    else
        file_name = listing.name;
    end
    
    path = [direct_path,'/',file_name];
    
   [Ham,Pas] = hpss(path, window, step, 0.6, 1.1, 1, 30);

    Y_Pas = abs(Pas);
    [F_drum,ins_drum] = makeLabeledData(direct_path,{'drum'});
    [G_drum,~,~] = psnmf2(Y_Pas,F_drum,rank,mew);
    midi(G_drum,ins_drum,step,window);

    Y_Ham = abs(Ham);
    [F_Ham,ins_Ham] = makeLabeledData(direct_path,{'bass';'piano'});
    [G_Ham,~,~] = psnmf2(Y_Ham,F_Ham,rank,mew);
    midi(G_Ham,ins_Ham,step,window);
%  H,U -> disposal
%  G -> time function?
return 