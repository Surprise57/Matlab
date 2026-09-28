function [v_cnt, accum_sum, mean_val, top_val, bottom_val, s_cnt, e_cnt, final_state] = resultSummary(arr)
    v_cnt = 0;
    accum_sum = 0;
    valid_list = [];

    for idx = 1:length(arr)
        val = arr(idx);
        if val >= 0 && val <= 100
            v_cnt = v_cnt + 1;
            accum_sum = accum_sum + val;
            valid_list = [valid_list, val];
        end
    end

    if v_cnt > 0
        mean_val = accum_sum / v_cnt;
        top_val = max(valid_list);
        bottom_val = min(valid_list);
    else
        mean_val = 0;
        top_val = 0;
        bottom_val = 0;
    end

    s_cnt = 0;
    e_cnt = 0;
    for idx = 1:length(valid_list)
        if valid_list(idx) >= 35
            s_cnt = s_cnt + 1;
        else
            e_cnt = e_cnt + 1;
        end
    end

    if s_cnt >= e_cnt
        final_state = 'PASS';
    else
        final_state = 'FAIL';
    end
end
