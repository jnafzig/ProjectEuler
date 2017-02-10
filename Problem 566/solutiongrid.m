clear;

% a = 12;
% b = 16;
% c = 18;

a = 9;
b = 11;
c = 17;

tic;
N = a*b*c;

cycleA = [b*c;a*c;0];
cycleB = [0;0;a*b];

slices = L2(a,b,c);

slicesA = slices(:,1)';
slicesB = slices(:,2)';

frosted = true(1,numel(slicesA)-1);
Nelem = numel(frosted);

i = find(slicesA==cycleA(1) & slicesB==cycleB(1),1);
j = find(slicesA==cycleA(1)+cycleA(2) & slicesB==cycleB(1)+cycleB(2));
k = find(slicesA==sum(cycleA) & slicesB==sum(cycleB));

K = 1:k-1;
P = [k:Nelem,i-1:-1:1,j-1:-1:i,k-1:-1:j];

% flipper{i} = sparse(1:Nelem,[j(i)+1:Nelem,j(i):-1:1],[ones(1,Nelem-j(i)),-ones(1,j(i))],Nelem,Nelem)



sliceID = (1:Nelem)';
sliceID0 = (1:Nelem)';
period = zeros(Nelem,1);
n = 1;
while ~all(sliceID==0)
    sliceID(K) = -sliceID(K);
    sliceID = sliceID(P);
    
    msk = sliceID==sliceID0 & sliceID~=0;
    sliceID(msk) = 0;
    period(msk) = n;
    n = n + 1;
end


for p = unique(period)'
    Y = zeros(Nelem,1);
    Y(period==p) = 1;    
    Y(K) = -Y(K);
    Y = Y(P);
    
    n = 1;
    while ~all(Y>=0)
        Y(K) = -Y(K);
        Y = Y(P);
        n = n+1;
    end
    period(period==p)=n;
end


flips = 1;
for p = unique(period)'
    flips = lcm(flips,p);
end
flips = flips*3
toc;

tic;
F(a,b,c)
toc;