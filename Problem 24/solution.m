clear;
N = 1000000;
digits = 0:9;
Ndigits = numel(digits);
permutation = zeros(Ndigits,1);

for i = 1:Ndigits
    R = mod(N-1,factorial(Ndigits-i));
    Q = (N-R-1)/factorial(Ndigits-i);
 
  
    permutation(i) = digits(Q+1);
    digits = setdiff(digits,digits(Q+1));
    
    N = R+1;
end

permutation'


  