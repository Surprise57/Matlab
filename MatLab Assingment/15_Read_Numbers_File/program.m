file_h1 = fopen('input.txt', 'r');

if file_h1 == -1
    fprintf('Error: input.txt file can not open!\n');
else
    dataset = fscanf(file_h1, '%f');
    fclose(file_h1);

    elem_count = length(dataset);

    accum_sum = 0;
    lowest = dataset(1);
    highest = dataset(1);
    p_tally = 0;
    n_tally = 0;
    z_tally = 0;

    for idx = 1:elem_count
        current_val = dataset(idx);

        accum_sum = accum_sum + current_val;

        if current_val > lowest
        else
            lowest = current_val;
        end

        if current_val > highest
            highest = current_val;
        end

        if current_val > 0
            p_tally = p_tally + 1;
        elseif current_val < 0
            n_tally = n_tally + 1;
        else
            z_tally = z_tally + 1;
        end
    end

    mean_val = accum_sum / elem_count;

    file_h2 = fopen('output.txt', 'w');

    for idx = 1:elem_count
        fprintf(file_h2, '%d \n', dataset(idx));
    end
    fprintf(file_h2, 'Total Elements : %d\n', elem_count);
    fprintf(file_h2, 'Positive Count : %d\n', p_tally);
    fprintf(file_h2, 'Negative Count : %d\n', n_tally);
    fprintf(file_h2, 'Zero Count     : %d\n', z_tally);
    fprintf(file_h2, 'Sum            : %d\n', accum_sum);
    fprintf(file_h2, 'Average        : %.2f\n', mean_val);
    fprintf(file_h2, 'Minimum        : %d\n', lowest);
    fprintf(file_h2, 'Maximum        : %d\n', highest);
    fclose(file_h2);
    fprintf('\nAnalysis successfully saved to summary_report.txt\n');
end
