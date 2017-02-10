done = false;
conseq = 0;
integer = 644;
while ~done
    if numel(unique(factor(integer)))>=4
        conseq = conseq +1;
    else
        conseq = 0;
    end
    if conseq == 4
        done = true;
    end
    integer = integer +1;
end

integer-4
        