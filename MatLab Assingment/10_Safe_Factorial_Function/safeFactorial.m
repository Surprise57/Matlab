function output_val = safeFactorial(val)
    if val < 0 || mod(val, 1) ~= 0
        fprintf('Error: Input %d is invalid (must be a non-negative integer).\n', val);
        output_val = 0;
        return;
    end
    output_val = 1;
    for counter = 1:val
        output_val = output_val * counter;
    end
end
