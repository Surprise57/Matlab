stream_in = fopen('student_marks.txt', 'r');
if stream_in == -1
    fprintf('Error: student_marks.txt file can not open!\n');
else
    scores_arr = fscanf(stream_in, '%f');
    fclose(stream_in);

    count_total = length(scores_arr);

    [v_cnt, accum_sum, mean_val, top_val, bottom_val, s_cnt, e_cnt, final_state] = resultSummary(scores_arr);

    stream_out = fopen('final_report.txt', 'w');

    if stream_out == -1
        fprintf('Error: summary_output.txt file not create/write!\n');
    else
        fprintf(stream_out, '\nRaw Input Marks:\n');

        for idx = 1:count_total
            fprintf('%g ', scores_arr(idx));
            fprintf(stream_out, '%g ', scores_arr(idx));
        end
        fprintf(stream_out, 'Total Entries Read : %d\n', count_total);
        fprintf(stream_out, 'Valid Marks Count  : %d\n', v_cnt);
        fprintf(stream_out, 'Invalid Entries    : %d\n', count_total - v_cnt);
        fprintf(stream_out, 'Total Valid Marks  : %g\n', accum_sum);
        fprintf(stream_out, 'Average Mark       : %.2f\n', mean_val);
        fprintf(stream_out, 'Highest Mark       : %g\n', top_val);
        fprintf(stream_out, 'Lowest Mark        : %g\n', bottom_val);
        fprintf(stream_out, 'Pass Count         : %d\n', s_cnt);
        fprintf(stream_out, 'Fail Count         : %d\n', e_cnt);
        fprintf(stream_out, 'Overall Status     : %s\n', final_state);
        fclose(stream_out);
        fprintf('\nReport successfully generated and saved to summary_output.txt\n');
    end
end
