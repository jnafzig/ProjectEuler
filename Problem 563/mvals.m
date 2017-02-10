function N = mvals(L,ai,plist,i)
    
    if nargin == 1
        i = 1;
        L = log(L);
        plist = primes(25)';
        ai = zeros(size(plist));
    end
    
    if L<0 || i>numel(plist);
        N = prod(plist.^ai);
        return;
    end
    
    aval = 0;
    aexp = 0;
    step = log(plist(i));
    N = [];
    
    while aval<=L
        ai(i) = aexp;
        N = [N , mvals(L-aval,ai,plist,i+1)];
        aval = aval + step;
        aexp = aexp + 1;
    end
end

