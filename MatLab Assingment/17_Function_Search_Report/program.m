file_in = fopen('numbers.txt', 'r');

if file_in == -1
    fprintf('Error: numbers.txt file can not open!\n');
else
    dataset = fscanf(file_in, '%f');
    fclose(file_in);

    target_val = 35;

    [first_pos, freq_count] = findValue(dataset, target_val);

    file_out = fopen('output.txt', 'w');

    fprintf('Array: [ ');
    fprintf(file_out, 'Array: [ ');
    for idx = 1:length(dataset)
        fprintf(file_out, '%g ', dataset(idx));
    end
    fprintf(file_out, ']\n\n');

    fprintf(file_out, 'Target Value     : %g\n', target_val);
    fprintf(file_out, 'First Index      : %d\n', first_pos);
    fprintf(file_out, 'Total Occurrence : %d\n', freq_count);

    fclose(file_out);
    fprintf('\nSearch results saved to search_report.txt\n');
end
