grid_in = input('Provide a matrix dataset (e.g.: [-10 -5 -8; -20 -3 -15]): ');
[r_sz, c_sz] = size(grid_in);
peak_val = grid_in(1, 1);
peak_r = 1;
peak_c = 1;

for r_idx = 1:r_sz
    for c_idx = 1:c_sz
        if grid_in(r_idx, c_idx) > peak_val
            peak_val = grid_in(r_idx, c_idx);
            peak_r = r_idx;
            peak_c = c_idx;
        end
    end
end

file_ptr = fopen('output.txt', 'w');
fprintf(file_ptr, 'Maximum Element: %d\n', peak_val);
fprintf(file_ptr, '1-Based Position: Row %d, Column %d\n', peak_r, peak_c);
fclose(file_ptr);

disp('Results successfully saved to max_element_report.txt');
