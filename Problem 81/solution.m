matrix = dlmread('p081_matrix.txt');
[M,N] = size(matrix);


for j = 1:(N-1)
    row = matrix(sub2ind(size(matrix),M-(1:j)+1,M+(1:j)-j));
    matrix(sub2ind(size(matrix),M-(1:j+1)+1,M+(1:j+1)-(j+1))) = ...
        matrix(sub2ind(size(matrix),M-(1:j+1)+1,M+(1:j+1)-(j+1))) + ...
        [row(1),min([row(1:end-1);row(2:end)]),row(end)];
end

for j = M:-1:2
    row = matrix(sub2ind(size(matrix),(1:j),(j:-1:1)));
    matrix(sub2ind(size(matrix),(1:j-1),(j-1:-1:1))) = ...
        matrix(sub2ind(size(matrix),(1:j-1),(j-1:-1:1))) + ...
        [min([row(1:end-1);row(2:end)])];
end

matrix(1,1)

