scores = input('Enter your scores vector [ ]: ');
correct_scores = [];
wrong_scores = [];
total_sum = 0;
fail_tally = 0;
pass_tally = 0;

for idx = 1:length(scores)
    if scores(idx) >= 0 && scores(idx) <= 100
        correct_scores = [correct_scores, scores(idx)];
    else
        wrong_scores = [wrong_scores, scores(idx)];
    end
end

max_val = correct_scores(1);
min_val = correct_scores(1);

for idx = 1:length(correct_scores)
    if correct_scores(idx) >= 35
        pass_tally = pass_tally + 1;
    else
        fail_tally = fail_tally + 1;
    end

    if correct_scores(idx) > max_val
        max_val = correct_scores(idx);
    end

    if correct_scores(idx) < min_val
        min_val = correct_scores(idx);
    end

    total_sum = total_sum + correct_scores(idx);
end

mean_val = total_sum / length(correct_scores);

file_id = fopen('output.txt', 'w');

fprintf(file_id, 'Sum: %d \n', total_sum);
fprintf(file_id, 'Average: %d \n', mean_val);
fprintf(file_id, 'Highest: %d \n', max_val);
fprintf(file_id, 'Lowest: %d \n', min_val);
fprintf(file_id, 'Total Pass Student: %d \n', pass_tally);
fprintf(file_id, 'Total Fail Student: %d', fail_tally);
fclose(file_id);
disp('File created and saved all Summary');
