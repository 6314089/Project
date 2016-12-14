function [correctCounts,unnecessaryCount] =  evaluate(midi_data,test_data)
    error = 1000;
    responsible_table = zeros(1,size(midi_data,1));
    used_table = zeros(1,size(test_data,1));
    correctCounts = 0;
    unnecessaryCount = 0;
    %currentJ = 1;
    for i = 1:size(midi_data,1)
        div = abs(midi_data(i,1)-test_data(1,1))+abs(midi_data(i,2)-test_data(1,2));
        index = 1;
        for j = 2:size(test_data,1)
            tmpDiv = abs(midi_data(i,1)-test_data(j,1))+abs(midi_data(i,2)-test_data(j,2));
            if tmpDiv < div
                div = tmpDiv;
                index = j;
            end
            startDiv = abs(midi_data(i,1)-test_data(index,1));
            if startDiv < error 
                responsible_table(i) = index;
                correctCounts =correctCounts +1; 
                used_table(index) = used_table(index) + 1;
            end
        end
    end
    f = find(used_table==0);
    unnecessaryCount = size(f,2);
return