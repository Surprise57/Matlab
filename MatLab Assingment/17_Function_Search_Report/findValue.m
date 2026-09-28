function [first_pos, freq_count] = findValue(seq, goal)
    first_pos = -1;
    freq_count = 0;

    for idx_k = 1:length(seq)
        if seq(idx_k) == goal
            freq_count = freq_count + 1;

            if first_pos == -1
                first_pos = idx_k;
            end
        end
    end
end
