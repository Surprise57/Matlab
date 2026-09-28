file_in = fopen('matrix.txt', 'r');

if file_in == -1
    fprintf('Error: matrix.txt file can not open!\n');
else
    r_sz = 3;
    c_sz = 4;

    raw_data = fscanf(file_in, '%f', [c_sz, r_sz]);
    fclose(file_in);

    matrix_m = raw_data';

    low_val = matrix_m(1, 1);
    low_r = 1;
    low_c = 1;

    peak_val = matrix_m(1, 1);
    peak_r = 1;
    peak_c = 1;

    for idx_i = 1:r_sz
        for idx_j = 1:c_sz
            item = matrix_m(idx_i, idx_j);
            if item < low_val
                low_val = item;
                low_r = idx_i;
                low_c = idx_j;
            end

            if item > peak_val
                peak_val = item;
                peak_r = idx_i;
                peak_c = idx_j;
            end
        end
    end

    r_totals = zeros(r_sz, 1);
    max_tot = -Inf;
    top_row = 1;

    for idx_i = 1:r_sz
        accum = 0;
        for idx_j = 1:c_sz
            accum = accum + matrix_m(idx_i, idx_j);
        end
        r_totals(idx_i) = accum;

        if accum > max_tot
            max_tot = accum;
            top_row = idx_i;
        end
    end

    file_out = fopen('output.txt', 'w');

    for idx_i = 1:r_sz
        for idx_j = 1:c_sz
            fprintf('%g\t', matrix_m(idx_i, idx_j));
            fprintf(file_out, '%g\t', matrix_m(idx_i, idx_j));
        end
        fprintf('\n');
        fprintf(file_out, '\n');
    end

    fprintf(file_out, 'Minimum Value : %g at Position (%d, %d)\n', low_val, low_r, low_c);
    fprintf(file_out, 'Maximum Value : %g at Position (%d, %d)\n', peak_val, peak_r, peak_c);

    for idx_i = 1:r_sz
        fprintf(file_out, 'Row %d Sum : %g\n', idx_i, r_totals(idx_i));
    end

    fprintf(file_out, '\nHighest Row Sum : %g (Row %d)\n', max_tot, top_row);

    fclose(file_out);
    fprintf('\nAnalysis saved to matrix_summary.txt\n');
end
