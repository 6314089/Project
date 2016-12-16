function midi(G,N,step,length)
    directory = 'sakura';
    correct = 0;
    debug = true;
    if debug
        step = 2048;
        length = 4096;
    end
    timedG = time(G);
    sampleG = convert(timedG,step,length);
    %testSE = findSE(sampleG);
    
    instruments = zeros(size(N));
    count = 0;
    for i = 1:size(N,1)
        %tmpN = N(i);
        names = cell2mat(N(i));
        inst = names(1);
        if inst == 'pi'
            inst = 'piano/';
        elseif inst == 'dr'
            inst = 'drum/';
        elseif inst == 'ba'
            inst = 'bass/';
        end
        for j = 2:size(names,1)
            file_m = [directory,inst,names(j),'.csv'];
            midi_data = csvread(file_m);
            %midi_data = findSE(midi_data);
            count = count + 1;
            test_data = findSE(sampleG(count,:));
            [cc,uc] = evaluate(midi_data,test_data);
            disp(inst);
            disp([' ',file_m]);
            disp(['‡‚Á‚Ä‚½”:',cc]);
            disp(['—]•ª‚É”»’è‚µ‚½”',uc])
        end
        %instruments(i) = size(cell2mat(N(i)),1);       
    end    
return