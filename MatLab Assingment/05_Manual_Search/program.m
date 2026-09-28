vector_data = input('Input the vector elements [ ]: ');
target_num = input('Provide target number to find: ');
initial_idx = 0;
frequency_sum = 0;

for idx = 1:length(vector_data)
    if vector_data(idx) == target_num
        initial_idx = idx;
        break;
    end
end

for idx = 1:length(vector_data)
    if vector_data(idx) == target_num
        frequency_sum = frequency_sum + 1;
    end
end

stream_out = fopen('output.txt', 'w');
if initial_idx > 0
    fprintf(stream_out, 'Value %d found at first position: %d\n', target_num, initial_idx);
    fprintf(stream_out, 'Total occurrences of %d: %d\n', target_num, frequency_sum);
else
    fprintf(stream_out, 'Value %d is absent in the array.\n', target_num);
end
fclose(stream_out);
disp('Results successfully saved to search_summary.txt');
