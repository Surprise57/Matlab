test_list = [7, 2, -7, 7.2];

file_ptr = fopen('output.txt', 'w');
for idx = 1:length(test_list)
    val = test_list(idx);
    fprintf(file_ptr, 'Testing Input: %d\n', val);
    res_fact = safeFactorial(val);
    if val >= 0 && mod(val, 1) == 0
        fprintf(file_ptr, 'Result: Factorial of %d is: %d\n\n', val, res_fact);
    else
        fprintf(file_ptr, 'Result: Invalid Input (Rejected)\n\n');
    end
end

fclose(file_ptr);
disp('Saved to fact_output.txt');
