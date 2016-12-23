function midi(G,ins,step,length,path,f_name)
    
    directory = path;
    
    if exist('f_name','var')
       f_name = 'tmp.csv'; 
    end
    fileID = fopen('tmp.csv','w');
    %sampleG = convert(timedG,step,length);
    %testSE = findSE(sampleG);    
    s = 1;
    %ins_counts = 0;
    %count = 0;
    s_NoteCounts = 0;
    s_Corrects = 0;
    
    fprintf(fileID,'Instrument,Chroma,Note,Corrects!!,Miss!!,Daburi,Rate\n');
    for i = 1:size(ins,1)
        m_noteCounts = 0;
        t_noteCounts = 0;
        corrects = 0;
        missCounts = 0;
        uCounts = 0;
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
        %disp(inst)
        %count = 0;
        for j = 2:size(names,1)
            file_m = [directory,inst,names(j,:),'.csv'];
            disp(file_m)
            midi_data = csvread(file_m);
            %disp(midi_data)
            %midi_data = findSE(midi_data);
            %count = count + 1;
            test_data = findSE(sampleG(j-1,:));
            %disp(test_data)
            [cc,mc,uc] = evaluate(midi_data,test_data,step);
            nc =  size(midi_data,1);
            %disp(inst);
            %disp([' ',file_m]);            
            %disp(['ノート数: ',num2str(nc)]);
            %disp(['合ってた数: ',num2str(cc)]);
            %disp(['判定できなかった数: ',num2str(mc)])
            %disp(['余分に判定した数: ',num2str(uc)])
            chroma = strsplit(file_m,'/');
            chroma = char(chroma(size(chroma)));
            chroma = names(j,:);
           
            fprintf(fileID,[inst,',',chroma,',',num2str(nc),',',num2str(cc),',',num2str(mc),',',num2str(uc),',',num2str(100*cc/nc),'\n']);
            m_noteCounts = m_noteCounts + size(midi_data,1);
            t_noteCounts = t_noteCounts + size(test_data,1);
            corrects = corrects + cc;
            missCounts = missCounts + mc;
            uCounts = uCounts + uc;
        end
        s_NoteCounts = s_NoteCounts + m_noteCounts;
        s_Corrects = s_Corrects + corrects;
        cp = 100*(corrects)/m_noteCounts;
        up = 100*(uCounts)/t_noteCounts;
        %disp(['正答率: ',num2str(cp)]);
        %disp(['ノイズ率: ',num2str(up)]);
        %instruments(i) = size(cell2mat(N(i)),1);
        fprintf(fileID,['_,Sum,',num2str(m_noteCounts),',',num2str(corrects),',',num2str(m_noteCounts-corrects),',',num2str(uCounts),',',num2str(100*corrects/m_noteCounts),'\n']);
    end
    fprintf(fileID,['Sum,Sum,',num2str(s_NoteCounts),',',num2str(s_Corrects),',',num2str(s_NoteCounts-s_Corrects),',_,',num2str(100*s_Corrects/s_NoteCounts),'\n']);
    fclose(fileID);
return