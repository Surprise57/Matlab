mat_in = input('Enter a matrix (e.g., [1 2 3; 4 5 6; 7 8 9]): ');
[r_cnt, c_cnt] = size(mat_in);
peak_total = -inf;
top_row_idx = 0;

stream_out = fopen('output.txt', 'w');
for r_idx = 1:r_cnt
    current_sum = 0;
    current_peak = mat_in(r_idx, 1);

    for c_idx = 1:c_cnt
        element_val = mat_in(r_idx, c_idx);
        current_sum = current_sum + element_val;

        if element_val > current_peak
            current_peak = element_val;
        end
    end

    current_mean = current_sum / c_cnt;
    fprintf(stream_out, 'Row %d: Sum: %d, Average: %d, Maximum: %d\n', r_idx, current_sum, current_mean, current_peak);

    if current_sum > peak_total
        peak_total = current_sum;
        top_row_idx = r_idx;
    end
end

fprintf(stream_out, '\nRow with Highest Row-Sum is Row: %d\n', top_row_idx);

fclose(stream_out);
disp('Results successfully saved to matrix_summary.txt');
