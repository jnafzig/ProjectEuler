numbers = 1:20161;

abundantnumbers = numbers(isabundant(numbers));
sums = unique(bsxfun(@plus,abundantnumbers',abundantnumbers));
sums = sums(sums<20161);

expressable = intersect(numbers,sums);
