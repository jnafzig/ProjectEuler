n = 10^3;

an = ones(n,1);
i = 2;
tic;
while i < n+1
    an(i) = an(i-1) + sumdigits(an(i-1));
    i = i+1;
end
toc;
an

% solutions = [];
% ansatz = 31050000;
% for an = 31050000:31060000
%     if check(an,10^6)
%         solutions = [solutions,an];
%     end
% end