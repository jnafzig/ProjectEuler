clear;

% a = 12;
% b = 16;
% c = 18;

a = 9;
b = 10;
c = 11;

N = a*b*c;

cycleA = [b*c;a*c;0];
cycleB = [0;0;a*b];

slices = L2(a,b,c);

slicesA = slices(:,1)';
slicesB = slices(:,2)';

frosted = true(1,numel(slicesA)-1);

tic;

Nelem = numel(frosted);
sliceID = (1:Nelem);
period = zeros(1,Nelem);
startloc = zeros(1,Nelem);
done = false(1,Nelem);
started = false(1,Nelem);
cake = false(Nelem,60);

flips = 0;
while ~all(frosted) || flips==0

    i = find(slicesA==cycleA(1) & slicesB==cycleB(1),1);
    if isempty(i)
        msk = slicesA+slicesB*sqrt(c)>cycleA(1)+cycleB(1)*sqrt(c);
        slicesA = [slicesA(~msk),cycleA(1),slicesA(msk)];
        slicesB = [slicesB(~msk),cycleB(1),slicesB(msk)];
        i = find(msk,1);
        frosted = frosted([1:i-1,i-1:end]);
    end
    
    j = find(slicesA==cycleA(1)+cycleA(2) & slicesB==cycleB(1)+cycleB(2));
    if isempty(j)
        msk = slicesA+slicesB*sqrt(c) > ...
            cycleA(1)+cycleA(2)+(cycleB(1)+cycleB(1))*sqrt(c);
        slicesA = [slicesA(~msk),cycleA(1)+cycleA(2),slicesA(msk)];
        slicesB = [slicesB(~msk),cycleB(1)+cycleB(2),slicesB(msk)];
        j = find(msk,1);
        frosted = frosted([1:j-1,j-1:end]);
    end
    k = find(slicesA==sum(cycleA) & slicesB==sum(cycleB));
    if isempty(k)
        msk = slicesA+slicesB*sqrt(c) > ...
            sum(cycleA)+sum(cycleB)*sqrt(c);
        slicesA = [slicesA(~msk),sum(cycleA),slicesA(msk)];
        slicesB = [slicesB(~msk),sum(cycleB),slicesB(msk)];
        k = find(msk,1);
        frosted = frosted([1:k-1,k-1:end]);
    end
    frosted(sliceID(1:k)) = ~frosted(sliceID(1:k)); 
    sliceID = [sliceID(k:end),...
        sliceID(i-1:-1:1),...
        sliceID(j-1:-1:i),...
        sliceID(k-1:-1:j)];

    slicesA = [slicesA(k:end-1)-sum(cycleA),...
        N-slicesA(i:-1:2)-sum(cycleA(2:3)),...
        N-slicesA(j:-1:i+1)+cycleA(1)-cycleA(3),...
        N-slicesA(k:-1:j+1)+sum(cycleA(1:2)),N];

    slicesB = [slicesB(k:end-1)-sum(cycleB),...
        -slicesB(i:-1:2)-sum(cycleB(2:3)),...
        -slicesB(j:-1:i+1)+cycleB(1)-cycleB(3),...
        -slicesB(k:-1:j+1)+sum(cycleB(1:2)),0];
    
    flips = flips+1;

    cake(:,flips) = frosted;
end
flips*3
toc;
F(a,b,c)

% 
% 
% tic;
% X = (1:Nelem)';
% O = zeros(size(X));
% n = 1;
% while ~all(X==0)
%     k = find(flipper0^n*X==X&X~=0);
%     X(k) = 0;
%     O(k) = n;
%     n = n + 1;
% end
% 
% for p = unique(O)'
%     Y = zeros(Nelem,1);
%     k = find(flipper0^p*(1:Nelem)'==(1:Nelem)');
%     Y(k) = 1;
%     n = 1;
%     while ~all(flipper0^n*Y>0|flipper0^n*Y==0)
%         n = n+1;
%     end
%     O(O==p)=n;
% end
% 
% F = 1;
% for p = unique(O)'
%     F = lcm(F,p);
% end
% F*3
% toc;
% 
% unique(O)
