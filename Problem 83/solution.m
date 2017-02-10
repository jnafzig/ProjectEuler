matrix = dlmread('p083_matrix.txt');
[M,N] = size(matrix);
matrix = matrix(:);

ind = reshape(1:M*N,[M,N]);

iright = ind(1:M,1:N-1);
jright = ind(1:M,2:N);

ileft = ind(1:M,2:N);
jleft = ind(1:M,1:N-1);

idown = ind(1:M-1,1:N);
jdown = ind(2:M,1:N);

iup = ind(2:M,1:N);
jup = ind(1:M-1,1:N);

A = sparse([iright(:),ileft(:),idown(:),iup(:)],...
    [jright(:),jleft(:),jdown(:),jup(:)],...
    matrix([jright(:),jleft(:),jdown(:),jup(:)]),M*N+2,M*N+2);

current = 1;
ind = 1:M*N;
visited = false(M*N,1);
tentative = inf*ones(M*N,1);
tentative(current) = matrix(current);
visited(current) = true;
    
i = 0;
while ~visited(end)
    unvisitedset = ind(~visited);
    
    neighbors = find(A(current,:));

    tentative(neighbors) = min(tentative(neighbors),...
        tentative(current)+matrix(neighbors));

    [~,ix] = min(tentative(~visited));
    current = unvisitedset(ix);
    visited(current) = true;
    
    i = i +1;
    if mod(i,10)==0
        spy(reshape(visited(1:end),M,N));
        pause;
    end
end
    

tentative(end)
