vector_in = input('Enter a numeric vector in []: ');
p_cnt = 0;
n_cnt = 0;
z_cnt = 0;
ev_cnt = 0;
od_cnt = 0;
p_sum = 0;
n_sum = 0;

for k = 1:length(vector_in)
    if vector_in(k) > 0
        p_cnt = p_cnt + 1;
        p_sum = p_sum + vector_in(k);
    elseif vector_in(k) < 0
        n_cnt = n_cnt + 1;
        n_sum = n_sum + vector_in(k);
    else
        z_cnt = z_cnt + 1;
    end

    if vector_in(k) >= 0
        if mod(vector_in(k), 2) == 0
            ev_cnt = ev_cnt + 1;
        else
            od_cnt = od_cnt + 1;
        end
    end
end

if p_cnt >= n_cnt && p_cnt >= z_cnt
    top_cat = 'Positive';
elseif n_cnt >= p_cnt && n_cnt >= z_cnt
    top_cat = 'Negative';
else
    top_cat = 'Zero';
end
f_ptr = fopen('output.txt', 'w');
fprintf(f_ptr, 'Positive Values Count: %d\n', p_cnt);
fprintf(f_ptr, 'Negative Values Count: %d\n', n_cnt);
fprintf(f_ptr, 'Zero Values Count    : %d\n', z_cnt);
fprintf(f_ptr, 'Even Integers Count  : %d\n', ev_cnt);
fprintf(f_ptr, 'Odd Integers Count   : %d\n', od_cnt);
fprintf(f_ptr, 'Sum of Positive Values: %g\n', p_sum);
fprintf(f_ptr, 'Sum of Negative Values: %g\n', n_sum);
fprintf(f_ptr, 'Highest Count Category: %s\n', top_cat);

fclose(f_ptr);

disp('Results successfully saved to summary_report.txt');
