stream_in = fopen('transactions.txt', 'r');

if stream_in == -1
    fprintf('Error: transactions.txt file nahi khul saki!\n');
else
    records = fscanf(stream_in, '%f');
    fclose(stream_in);

    cnt_total = length(records);

    sum_credits = 0;
    sum_debits = 0;
    c_tally = 0;
    d_tally = 0;
    z_tally = 0;
    peak_credit = 0;
    peak_debit_mag = 0;

    for idx = 1:cnt_total
        val = records(idx);

        if val > 0
            sum_credits = sum_credits + val;
            c_tally = c_tally + 1;

            if val > peak_credit
                peak_credit = val;
            end

        elseif val < 0
            sum_debits = sum_debits + val;
            d_tally = d_tally + 1;

            magnitude = -val;
            if magnitude > peak_debit_mag
                peak_debit_mag = magnitude;
            end

        else
            z_tally = z_tally + 1;
        end
    end

    net_amount = sum_credits + sum_debits;

    stream_out = fopen('output.txt', 'w');
    fprintf(stream_out, 'Total Transactions      : %d\n', cnt_total);
    fprintf(stream_out, 'Credit Transactions     : %d\n', c_tally);
    fprintf(stream_out, 'Debit Transactions      : %d\n', d_tally);
    fprintf(stream_out, 'Zero Transactions       : %d\n', z_tally);
    fprintf(stream_out, 'Total Credits Amount    : %g\n', sum_credits);
    fprintf(stream_out, 'Total Debits Amount     : %g\n', sum_debits);
    fprintf(stream_out, 'Net Balance             : %g\n', net_amount);
    fprintf(stream_out, 'Largest Credit          : %g\n', peak_credit);
    fprintf(stream_out, 'Largest Debit Magnitude : %g\n', peak_debit_mag);
    fclose(stream_out);
    fprintf('\nSummary saved to ledger_summary.txt\n');
end
