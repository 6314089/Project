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
    
   % [Ham,Pas] = hpss(path, window, step, 0.6, 1.1, 1, 30);

   [data, Fs] = audioread(path);
    X = stft(mono(data), @hann, step, window, Fs);
   
    %Y_Pas = abs(Pas);
    %[F_drum,ins_drum] = makeLabeledData(direct_path,{'drum'});
    %[G_drum,~,~] = psnmf2(Y_Pas,F_drum,rank,mew);
    %midi(G_drum,ins_drum,step,window);

    Y = abs(X);
    [F,ins] = makeLabeledData(direct_path,{'bass';'piano';'drum'});
    [G,~,~] = psnmf2(Y,F,rank,mew);
    midi(G,ins,step,window);
%  H,U -> disposal
%  G -> time function?
return 