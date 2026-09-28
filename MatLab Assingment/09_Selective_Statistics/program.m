vector_input = input('Enter a numeric array in []: ');
tally_pos = 0;
total_pos = 0;

for idx = 1:length(vector_input)
    if vector_input(idx) <= 0
        continue;
    end
    tally_pos = tally_pos + 1;
    total_pos = total_pos + vector_input(idx);
end

stream_id = fopen('output.txt', 'w');
if tally_pos > 0
    mean_pos = total_pos / tally_pos;
    fprintf(stream_id, 'Count of Positive Values: %d\n', tally_pos);
    fprintf(stream_id, 'Sum of Positive Values  : %d\n', total_pos);
    fprintf(stream_id, 'Average of Positive Values: %.2f\n', mean_pos);
else
    notice_msg = 'No positive values exist in the given array.';
    fprintf('%s\n', notice_msg);
    fprintf(stream_id, '%s\n', notice_msg);
end
fclose(stream_id);
disp('Saved to positive_summary.txt');
