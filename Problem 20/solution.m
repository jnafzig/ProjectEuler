
N = 100;
prod = 1;
for i = 2:N
    prod = i*prod;
    for j = 2:numel(prod);
        prod(j) = prod(j) + floor(prod(j-1)/10);
        prod(j-1) = mod(prod(j-1),10);
    end
    while floor(prod(end)/10)~=0
        prod = [prod,floor(prod(end)/10)];
        prod(end-1) = mod(prod(end-1),10);
    end
end
sum(prod)


wolfstring = '93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000';



