datasets = {[20, -10, 45, 5, -20, 50], [-15, -30, -5, -10, -180]};

file_ptr = fopen('output.txt', 'w');
for idx_c = 1:length(datasets)
    current_arr = datasets{idx_c};
    fprintf(file_ptr, 'Test Case %d Input Array: [ ', idx_c);
    for idx_i = 1:length(current_arr)
        fprintf('%d ', current_arr(idx_i));
        fprintf(file_ptr, '%d ', current_arr(idx_i));
    end
    fprintf(file_ptr, ']\n');
    [sum_tot, mean_val, lowest_v, highest_v] = arraySummary(current_arr);

    fprintf(file_ptr, 'Total   : %d\n', sum_tot);
    fprintf(file_ptr, 'Average : %.2f\n', mean_val);
    fprintf(file_ptr, 'Minimum : %d\n', lowest_v);
    fprintf(file_ptr, 'Maximum : %d\n\n', highest_v);
end
fclose(file_ptr);
fprintf('\nSaved to summary_results.txt\n');
