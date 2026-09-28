mat_a = input('Enter Matrix 1 (e.g.: [1 2; 3 4]): ');
mat_b = input('Enter Matrix 2 (e.g.: [5 6; 7 8]): ');

[rows_a, cols_a] = size(mat_a);
[rows_b, cols_b] = size(mat_b);

stream_out = fopen('output.txt', 'w');

if cols_a ~= rows_b
    fprintf(stream_out, 'Multiplication not possible: Columns of Matrix 1 (%d) must equal Rows of Matrix 2 (%d).\n', cols_a, rows_b);
else
    for idx_i = 1:rows_a
        for idx_j = 1:cols_b
            accum_val = 0;
            for idx_k = 1:cols_a
                accum_val = accum_val + mat_a(idx_i, idx_k) * mat_b(idx_k, idx_j);
            end
            computed_mat(idx_i, idx_j) = accum_val;
        end
    end

    native_prod = mat_a * mat_b;

    match_flag = 1;
    for idx_i = 1:rows_a
        for idx_j = 1:cols_b
            if computed_mat(idx_i, idx_j) ~= native_prod(idx_i, idx_j)
                match_flag = 0;
            end
        end
    end

    fprintf(stream_out, 'Manual Result:\n');
    for idx_i = 1:rows_a
        for idx_j = 1:cols_b
            fprintf(stream_out, '%d\t', computed_mat(idx_i, idx_j));
        end
        fprintf(stream_out, '\n');
    end

    fprintf(stream_out, '\nMATLAB Built-in Result:\n');
    for idx_i = 1:rows_a
        for idx_j = 1:cols_b
            fprintf(stream_out, '%d\t', native_prod(idx_i, idx_j));
        end
        fprintf(stream_out, '\n');
    end

    if match_flag == 1
        fprintf(stream_out, '\nMatch Status: Both results MATCH perfectly!\n');
    else
        fprintf(stream_out, '\nMatch Status: Results DO NOT match.\n');
    end
end

fclose(stream_out);
disp('Saved to matrix_mult_report.txt');
