list_vals = [41, 72, 85, 94, 60, 94, 33, 21, 55];

len_arr = length(list_vals);
peak_elem = -Inf;
next_peak = -Inf;

for idx = 1:len_arr
    if list_vals(idx) > peak_elem
        peak_elem = list_vals(idx);
    end
end

for idx = 1:len_arr
    if list_vals(idx) > next_peak && list_vals(idx) < peak_elem
        next_peak = list_vals(idx);
    end
end

file_ptr = fopen('output.txt', 'w');

fprintf(file_ptr, 'Input Array: [ ');
for idx = 1:len_arr
    fprintf('%d ', list_vals(idx));
    fprintf(file_ptr, '%d ', list_vals(idx));
end
fprintf(file_ptr, ']\n\n');

fprintf(file_ptr, 'Maximum Value        : %d\n', peak_elem);

if next_peak == -Inf
    fprintf(file_ptr, 'Second Distinct Value: Does not exist (All elements are same)\n');
else
    fprintf(file_ptr, 'Second Largest Value : %d\n', next_peak);
end

fclose(file_ptr);
fprintf('\nResult saved to peak_output.txt\n');
