stream_in = fopen('marks.txt', 'r');
if stream_in == -1
    fprintf('Error: marks.txt file nahi khul saki!\n');
else
    grades_matrix = fscanf(stream_in, '%f', [3, Inf]);
    fclose(stream_in);
    grades_matrix = grades_matrix';
    row_count = size(grades_matrix, 1);
    stream_out = fopen('result.txt', 'w');

    fprintf(stream_out, 'Student | Sub1 | Sub2 | Sub3 | Total | Average | Status\n');

    for idx = 1:row_count
        s1 = grades_matrix(idx, 1);
        s2 = grades_matrix(idx, 2);
        s3 = grades_matrix(idx, 3);

        sum_val = s1 + s2 + s3;
        mean_val = sum_val / 3;

        if mean_val >= 38
            res_status = 'Pass';
        else
            res_status = 'Fail';
        end

        fprintf(stream_out, 'Student %d | %g | %g | %g | %g | %.2f | %s\n', idx, s1, s2, s3, sum_val, mean_val, res_status);
    end
    fclose(stream_out);
    fprintf('\nReport successfully written to final_report.txt\n');
end
