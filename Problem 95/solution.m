cap = 1000000;
numbers = 2:cap;
chain = ones(size(numbers));
for i = 2:cap/2
    chain((2*i:i:cap)-1) = chain((2*i:i:cap)-1) + i;
end

C = sparse(numbers,chain,1);
C = C(1:cap,1:cap);

step0 = (1:cap)';
step = step0;
i = 1;
j = 1;
X = 0;
while nnz(step)~=0
    step = C*step;
    X(i) = nnz(step);
    Y(i) = nnz(step==step0);
    if any(step==step0)
        first{j} = step(step==step0);
        step(step==step0)=0;
        j = j+1;
    end
    i = i+1;
end

