function nmin = avals( L, ai, i, nmin,plist,amax)
    
    if nargin == 1
        N = ceil(log(2*L)/log(3));
        ai = zeros(N,1);
        i = 1;
        nmin = inf;
        plist = primes(100);
        plist = plist(1:N)';
        amax = 4;
    end
    
    if prod(2*ai+1)>2*L
        ai(i:end) = 0;
        nmin = min(nmin,prod(plist.^ai));
        return;
    end
    
    
    a = 1;
    while prod(2*ai+1)<=2*L && a <= amax
        ai(i) = a;
        nmin = avals(L,ai,i+1,nmin,plist,amax);
        a = a + 1;
    end
end

