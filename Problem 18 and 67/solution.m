
triangle = dlmread('triangle18.dat');

N = length(triangle);

for i = N-1:-1:1
    for j = 1:i
        triangle(i,j) = triangle(i,j)+max(triangle(i+1,j),triangle(i+1,j+1));
    end
end

triangle(1,1)