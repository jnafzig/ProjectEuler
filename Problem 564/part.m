function p = part( sum,largestnumber)
    if largestnumber == 0
        p = 0;
        return;
    end
    if sum == 0
        p = 1;
        return;
    end
    if sum < 0
        p = 0;
        return;
    end
    
    p = part(sum,largestnumber-1) ...
        + part(sum-largestnumber,largestnumber);    
       
end

