function [ check ] = check( an, n )
    check = true;
    done = false;
    maxbackcheck = 100;
    i = 1;
    while i<maxbackcheck && ~done
        an = previous(an,n);
        n = n - 1;
        if an<0
            done = true;
            check = false;
        end
    end
end

