function [ an1 ] = previous( an , n )
    
    
    done = false;
    maxchk = 9*(floor(log10(n))+1);
    
    seq = [5 1 2 4 8 7];
    if seq(mod(n,6)+1) ~= sumdigits(sumdigits(sumdigits(an)))
        an1 = -1;
        done = true;
    else
        i = 1;

        while i < maxchk && ~done
            chk = an - i;
            if sumdigits(chk)+chk == an
                done = true;
                an1 = chk;
            end
            i = i+1;
        end

    end
    
    if ~done
        an1 = -2;
    end
    
end

