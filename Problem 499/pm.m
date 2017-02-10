function [ p ] = pm( m,s,tol,iter )
    if s<m
        p = 0;
        return;
    elseif s>10*m
        p = 1;
        return
    elseif iter>10
        p = 1;
        return;
    end
    s
    iter
    n = 1;
    p = 0;
    while 2^(-n)>tol
        p = p + 1/2^n*pm(m,s-m+2^(n-1),tol,iter+1);
        n = n + 1;
    end
    
end

