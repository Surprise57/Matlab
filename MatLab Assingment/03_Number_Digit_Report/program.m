val = input('Provide an Integer: ');
curr = val;
len_digits = 0;
total_sum = 0;
even_tally = 0;
odd_tally = 0;
flipped_val = 0;

if val < 0
  disp('Value is Negative');
  file_h = fopen('result_summary.txt', 'w');
  fprintf(file_h, 'Value is Negative');
  fclose(file_h);
else
  while curr > 0
    rem_dig = mod(curr, 10);
    len_digits = len_digits + 1;
    total_sum = total_sum + rem_dig;
    if mod(rem_dig, 2) == 0
        even_tally = even_tally + 1;
    else
        odd_tally = odd_tally + 1;
    end
    flipped_val = (flipped_val * 10) + rem_dig;
    curr = fix(curr / 10);
  end

  if val == flipped_val
    palindrome_flag = 'Yes';
  else
    palindrome_flag = 'No';
  end

  file_h = fopen('output.txt', 'w');
  fprintf(file_h, 'Original Number: %d\n', val);
  fprintf(file_h, 'Number of Digits: %d\n', len_digits);
  fprintf(file_h, 'Sum of Digits: %d\n', total_sum);
  fprintf(file_h, 'Count of Even Digits: %d\n', even_tally);
  fprintf(file_h, 'Count of Odd Digits: %d\n', odd_tally);
  fprintf(file_h, 'Reversed Number: %d\n', flipped_val);
  fprintf(file_h, 'Is Palindrome: %s\n', palindrome_flag);
  fclose(file_h);
  disp('Results successfully written to result_summary.txt');
end
