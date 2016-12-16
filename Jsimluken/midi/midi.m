function midi(G,ins,step,length)
    directory = 'mori/';
    correct = 0;
    debug = true;
    if debug
        step = 2048;
        length = 4096;
    end
    %sampleG = convert(timedG,step,length);
    %testSE = findSE(sampleG);    
    s = 1;
    %ins_counts = 0;
    %count = 0;
    for i = 1:size(ins,1)
        names = ins{i};
        inst = names(1,:);
        ins_counts = size(names,1)-1;
        if inst == 'pi'
            inst = 'piano/';
            timedG = time(G(s:s+ins_counts-1,:));
        elseif inst == 'dr'
            inst = 'drum/';
            timedG = time2(G(s:s+ins_counts-1,:));
            %sampleG = 0;
            %isDrum = true;
        elseif inst == 'ba'
            inst = 'bass/';
            timedG = time(G(s:s+ins_counts-1,:));
        end
        sampleG = convert(timedG,step,length);
        
        s = s + ins_counts;
        %disp(s)
        %count = 0;
        for j = 2:size(names,1)
            file_m = [directory,inst,names(j,:),'.csv'];
            %disp(file_m)
            midi_data = csvread(file_m);
            %disp(midi_data)
            %midi_data = findSE(midi_data);
            %count = count + 1;
            test_data = findSE(sampleG(j-1,:));
            %disp(test_data)
            [cc,mc,uc] = evaluate(midi_data,test_data);
            %disp(inst);
            disp([' ',file_m]);            
            disp(['�m�[�g��: ',num2str(size(midi_data,1))]);
            disp(['�����Ă���: ',num2str(cc)]);
            disp(['����ł��Ȃ�������: ',num2str(mc)])
            disp(['�]���ɔ��肵����: ',num2str(uc)])
        end
        %instruments(i) = size(cell2mat(N(i)),1);       
    end    
return