
% M = 120147;

M = 12017639147;
% M =  101;
N = (M+3)/2;
% N = 1001;
% 
% % N = 200*2^4*5;
% 

% for j = 1:100
%     N = j;
%     % tic;
%     i = (3-mod(N,3)):3:(N-1);
%     % % i = 1:3:(N-1);
%     % % i = 1:(N-1);
%     tot1(j) = sum(gcd(i,N)==1);
% end

% toc;
% % 
% tot1
% 
% 
tic;
tot2 = round(prod(1-1./unique(factor(N)))*N);
toc;

tot2
uint64(floor(floor(tot2/3)-mod(tot2,3)))
% tic;
% factors = factor(N);
% tot3 = 1;
% for p = unique(factors)
%     k = sum(p==factors);
%     tot3 = tot3*p^(k-1)*(p-1);
% end
% toc;
% 
% % floor(floor(tot3/3)-mod(tot3,3))
