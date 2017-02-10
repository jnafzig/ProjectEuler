p = [13,11,7,5,3,2];
n = reshape(sprintf('%03d',(17:17:999)),3,floor(999/17))';

for j = 1:numel(p)
    n = [num2str(kron((0:9)',ones(size(n,1),1))),repmat(n,[10,1])];
    [Nrows,Ndigits] = size(n);
    msk = true(Nrows,1);
    for i = 1:Nrows;
        msk(i) = sum(sum(bsxfun(@eq,n(i,:)',n(i,:))))==Ndigits;
    end

    n = n(msk,:);

    msk = mod(str2num(n(:,1:3)),p(j))==0;

    n = n(msk,:);
end

n = [num2str(kron((0:9)',ones(size(n,1),1))),repmat(n,[10,1])];
[Nrows,Ndigits] = size(n);
msk = true(Nrows,1);
for i = 1:Nrows;
    msk(i) = sum(sum(bsxfun(@eq,n(i,:)',n(i,:))))==Ndigits;
end

n = n(msk,:);

num2str(sum(str2num(n)))
