n = 1:100000;
Triangular = n.*(n+1)/2;
Pentagonal = Triangular(mod(sqrt(24*Triangular+1),6)==5);
Hexagonal = Pentagonal(mod(sqrt(8*Pentagonal+1),4)==3);
fprintf('%d\n',Hexagonal(3))