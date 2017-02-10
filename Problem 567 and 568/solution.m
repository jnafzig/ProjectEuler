% pt = arrayfun(@(x) nchoosek(6,x),1:6);


N = 12345;
a = zeros(N/2,1);
a(1) = 1;
tic;
for i = 2:2:N
    [1;a(1:i-1)] + [a(1:i-1);0];
end
toc;


% Ea = sum(1./(1:N)'.*a)/2^N;
% Eb = sum(1./(1:N)'.*1./a);