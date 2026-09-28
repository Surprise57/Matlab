function [sum_tot, mean_val, lowest_v, highest_v] = arraySummary(current_arr)
    sum_tot = 0;
    sz = length(current_arr);

    for k_idx = 1:sz
        sum_tot = sum_tot + current_arr(k_idx);
    end
    mean_val = sum_tot / sz;
    lowest_v = current_arr(1);
    highest_v = current_arr(1);

    for k_idx = 2:sz
        if current_arr(k_idx) < lowest_v
            lowest_v = current_arr(k_idx);
        end
        if current_arr(k_idx) > highest_v
            highest_v = current_arr(k_idx);
        end
    end
end
