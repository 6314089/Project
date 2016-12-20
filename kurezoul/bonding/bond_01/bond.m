function[Pas,G,ins] = bond(direct_path)

    window = 4096;
    step = 2048;
    wav_des = '/*.wav';
    command = [direct_path,wav_des];
    listing = dir(command);
    file_name = listing.name;
    path = [direct_path,'/',file_name];

    [Ham,Pas] = hpss(path, window, step, 0.6, 1.1, 1, 30);

    % Pas -> izac 

      Y = abs(Ham);
      [F,ins] = makeLabeledData(direct_path,['base','piano']);
    
      rank = 3;
      mew = 1;
      [G,~,~] = psnmf2(Y,F,rank,mew);
    
%  H,U -> disposal
%  G -> time function?
return
end