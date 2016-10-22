function bpm = bpm(data, Fs, frame)
    vol = vol_quantize(data, frame);
    vol_diff = diff_p(vol);
    bpmm = bpm_match(vol_diff, frame, Fs);
    [~, locs] = sort(bpmm, 'descend');
    bpm = locs(1:3) + 60 - 1;