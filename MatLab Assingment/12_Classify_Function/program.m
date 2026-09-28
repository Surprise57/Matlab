clear; clc;

seq_a = [12, -5, 0, 3, -6, 0, 9, 14];
seq_b = [-4, -8, 2, -12, 0, -7, 4, 6];

[p1, n1, z1, ev1, od1] = classifyArray(seq_a);
[p2, n2, z2, ev2, od2] = classifyArray(seq_b);

file_ptr = fopen('output.txt', 'w');

fprintf('Array 1: [ ');
fprintf(file_ptr, 'Array 1: [ ');
for idx = 1:length(seq_a)
    fprintf(file_ptr, '%d ', seq_a(idx));
end
fprintf(file_ptr, ']\n');

fprintf(file_ptr, 'Array 2: [ ');
for idx = 1:length(seq_b)
    fprintf(file_ptr, '%d ', seq_b(idx));
end

fprintf(file_ptr, ']\n\n');
fprintf(file_ptr, 'Metric | Array 1 | Array 2\n');
fprintf(file_ptr, 'Positive Count | %d | %d\n', p1, p2);
fprintf(file_ptr, 'Negative Count | %d | %d\n', n1, n2);
fprintf(file_ptr, 'Zero Count | %d | %d\n', z1, z2);
fprintf(file_ptr, 'Even Count | %d | %d\n', ev1, ev2);
fprintf(file_ptr, 'Odd Count | %d | %d\n', od1, od2);
fclose(file_ptr);
fprintf('\nSaved to classification_report.txt\n');
