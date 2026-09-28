function [mean_score, peak_score, pass_tally, fail_tally] = analyzeMarks(scores_in)
    valid_list = [];
    for idx = 1:length(scores_in)
        if scores_in(idx) >= 0 && scores_in(idx) <= 100
            valid_list = [valid_list, scores_in(idx)];
        end
    end

    if isempty(valid_list)
        mean_score = 0;
        peak_score = 0;
        pass_tally = 0;
        fail_tally = 0;
        return;
    end

    total_sum = sum(valid_list);
    mean_score = total_sum / length(valid_list);
    peak_score = max(valid_list);

    pass_tally = 0;
    fail_tally = 0;
    for idx = 1:length(valid_list)
        if valid_list(idx) >= 35
            pass_tally = pass_tally + 1;
        else
            fail_tally = fail_tally + 1;
        end
    end
end
