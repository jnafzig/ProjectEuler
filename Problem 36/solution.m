N = 1:10^6;
N = N(arrayfun(@ispalindrome,N));
sum(N(arrayfun(@isbinpalindrome,N)))

