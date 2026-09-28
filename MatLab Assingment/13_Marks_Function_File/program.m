scores_in = input('Enter Student Scores: ');
[mean_score, peak_score, pass_tally, fail_tally] = analyzeMarks(scores_in);

file_ptr = fopen('result.txt', 'w');
fprintf('Input Marks: [ ');
fprintf(file_ptr, 'Input Marks: [ ');
for idx = 1:length(scores_in)
    fprintf('%g ', scores_in(idx));
    fprintf(file_ptr, '%g ', scores_in(idx));
end
fprintf(file_ptr, ']\n\n');
fprintf(file_ptr, 'Average Valid Mark : %.2f\n', mean_score);
fprintf(file_ptr, 'Highest Valid Mark : %g\n', peak_score);
fprintf(file_ptr, 'Pass Count : %d\n', pass_tally);
fprintf(file_ptr, 'Fail Count : %d\n', fail_tally);

fclose(file_ptr);
fprintf('\nSaved to score_report.txt\n');
