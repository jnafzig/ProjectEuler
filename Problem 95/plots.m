cap = 10000;
numbers = 1:cap;
chain = ones(size(numbers));
for i = 2:cap/2
    chain(2*i:i:cap) = chain(2*i:i:cap) + i;
end 

C = sparse(numbers,chain,1);
[N,M] = size(C);

% Cprime = sparse(numbers(isprime(numbers)),chain(isprime(numbers)),1,N,M); 
Ctwo = sparse(numbers(mod(numbers,2)==0),chain(mod(numbers,2)==0),1,N,M); 
Cthree = sparse(numbers(mod(numbers,3)==0),chain(mod(numbers,3)==0),1,N,M); 
Cfour = sparse(numbers(mod(numbers,4)==0),chain(mod(numbers,4)==0),1,N,M); 
Csix = sparse(numbers(mod(numbers,6)==0),chain(mod(numbers,6)==0),1,N,M); 
Ctwelve = sparse(numbers(mod(numbers,12)==0),chain(mod(numbers,12)==0),1,N,M); 

Ctwopower = sparse(numbers(2.^(0:floor(log2(cap)))),chain(2.^(0:floor(log2(cap)))),1,N,M); 
Cthreepower = sparse(numbers(3.^(0:floor(log(cap)/log(3)))),chain(3.^(0:floor(log(cap)/log(3)))),1,N,M); 
Cabundant = sparse(numbers(chain>numbers),chain(chain>numbers),1,N,M); 
Cperfect = sparse(numbers(chain==numbers),chain(chain==numbers),1,N,M); 
Calmost = sparse(numbers(chain-numbers==12),chain(chain-numbers==12),1,N,M); 
Csuperabundant = sparse(numbers(chain>2*numbers),chain(chain>2*numbers),1,N,M); 
C2prime = sparse(numbers(isprime(numbers/2)),chain(isprime(numbers(2:2:end)/2)),1,N,M); 

% Calmost = sparse(numbers(abs(chain-numbers)<=12),chain(abs(chain-numbers)<=12),1,N,M); 


spy(flipud(C),'k');hold on;
% spy(flipud(Cprime),'b');
% spy(flipud(Ctwo),'b');
% spy(flipud(Cthree),'r');
% spy(flipud(Ctwelve),'m');
% spy(flipud(Cperfect),'r',14);
% spy(flipud(Ctwopower),'m',14);
% spy(flipud(Cthreepower),'g',14);
spy(flipud(C2prime),'g');
% spy(flipud(Csuperabundant),'b');


% set(findobj(gcf, 'type','axes'), 'Visible','off'); hold off;

% set(findobj(gcf, 'type','axes'), 'YScale','log');

% difference = chain-numbers;
% semilogy(sum(bsxfun(@eq,difference',1:200)),'*')
% 
% f = 1001;
% reducedmat = accumarray([ceil(numbers'/f),ceil(chain'/f)],1,[ceil(N/f),ceil(M/f)]);
% 
% imshow(1-reducedmat/mean(max(reducedmat)))