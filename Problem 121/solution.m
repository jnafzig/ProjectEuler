N = 15;
maxred = 7;
count = 0;
for k = 0:maxred
    count = count + sum(prod(nchoosek(1:N,k),2));
end
P = count/factorial(N+1);
ceil((1-P)/P)
