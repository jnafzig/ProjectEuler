v = [ones(1,33);2:2:66;ones(1,33)];
v = [2;v(:)];
v = sym(v(1:100));

p = v(end);
q = sym(1);

for i = numel(v)-1:-1:1
    [p,q] = deal(q,p);
    p = p + v(i)*q;
end


sumdigits(p)