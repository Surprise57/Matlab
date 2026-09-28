function [pc, nc, zc, ec, oc] = classifyArray(seq)
    pc = 0;
    nc = 0;
    zc = 0;
    ec = 0;
    oc = 0;

    for idx = 1:length(seq)
        item = seq(idx);
        if item > 0
            pc = pc + 1;
        elseif item < 0
            nc = nc + 1;
        else
            zc = zc + 1;
        end
        if mod(item, 1) == 0
            if mod(item, 2) == 0
                ec = ec + 1;
            else
                oc = oc + 1;
            end
        end
    end
end
