primelist = primes(1000000);
truncatablelist = [];

for p = primelist(5:end)
    x = p;
    chkL = true;
    while x>=10
        x = floor(x/10);
        if ~any(x==primelist)
            chkL = false;
            break;
        end
    end
    
    x = p;
    chkR = true;
    Ndigits = floor(log10(x))+1;
    while Ndigits > 1
        x = mod(x,10^(Ndigits-1));
        if ~any(x==primelist)
            chkR = false;
            break;
        end
        Ndigits = Ndigits-1;
    end
    
    if chkR && chkL
        truncatablelist = [truncatablelist,p];
    end
end

 sum(truncatablelist)
    
    
    