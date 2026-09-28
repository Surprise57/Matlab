file_ptr = fopen('attendance.txt', 'a');

for idx = 1:4
    student_name = input('Enter Student Name: ', 's');
    fprintf('Select Status: 1. Present  2. Absent  3. Late\n');
    opt_val = input('Enter choice (1-3): ');
    if opt_val == 1
        att_status = 'Present';
    elseif opt_val == 2
        att_status = 'Absent';
    elseif opt_val == 3
        att_status = 'Late';
    else
        fprintf('Invalid choice! Setting to Absent.\n');
        att_status = 'Absent';
    end

    fprintf(file_ptr, 'Name: %s | Status: %s\n', student_name, att_status);
    fprintf('Record saved!\n\n');
end

fclose(file_ptr);
fprintf('All 4 records saved to student_attendance.txt\n');
