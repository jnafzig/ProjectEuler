N = 10000000;
numbers = (1:N)';
square = sumdigits(numbers,2);

finished = numbers==1 | numbers==89;

while ~all(finished)
    numbers(~finished) = square(numbers(~finished));
    finished = numbers==1 | numbers==89;
end

sum(numbers==89)