S = 0;
for N = 3:50;
    total = N-3;
    purse = zeros(1,N);
    purse(end) = total;
    Z = 0;
    E = 0;
    F = 0;
    done  = false;
    tic;
    while ~done
        A = maxarea(purse+1);
        n = hist(purse,0:total);
        Nelem = N;
        p = factorial(N)/(prod(factorial(n))*prod(factorial(N-sum(n))));
        E = E + A*p;
        Z = Z + p;
        F = F + 1;

        newpurse = makechange(purse);
        if all(newpurse==purse)
            done = true;
        else
            purse = newpurse;
        end
    end
    
    toc;
    S = S+E/Z;
    N
end
S