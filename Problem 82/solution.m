matrix = dlmread('p082_matrix.txt');
[M,N] = size(matrix);
matrix = matrix(:);

ind = reshape(1:M*N,[M,N]);
iright = ind(1:M,1:N-1);
jright = ind(1:M,2:N);

idown = ind(1:M-1,1:N);
jdown = ind(2:M,1:N);

iup = ind(2:M,1:N);
jup = ind(1:M-1,1:N);

A = sparse([iright(:),idown(:),iup(:)],...
    [jright(:),jdown(:),jup(:)],...
    matrix([jright(:),jdown(:),jup(:)]),M*N+2,M*N+2);

% connector nodes
initialnodes = ind(1:end,1);
finalnodes = ind(1:end,end);
A(end-1,initialnodes(:)) = true;
A(finalnodes(:),end) = true;
matrix = [matrix;0;0];


current = M*N+1;
ind = 1:M*N+2;
visited = false(M*N+2,1);
tentative = inf*ones(M*N+2,1);
tentative(current) = 0;
visited(current) = true;
    

while ~visited(end)
% for i = 1:100
    unvisitedset = ind(~visited);
    
    neighbors = find(A(current,:));

    tentative(neighbors) = min(tentative(neighbors),...
        tentative(current)+matrix(neighbors));

    [~,ix] = min(tentative(~visited));
    current = unvisitedset(ix);
    visited(current) = true;
%     spy(reshape(visited(1:end-2),M,N));
%     pause;
end

tentative(end)
