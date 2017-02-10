clear;

a = sym(9);
b = sym(10);
c = sym(11);

N = a*b*c;

cycle = [b*c,a*c,a*b*sqrt(c)];

slices = N;
frosted = true;

tic;
flips = 0;
while ~all(frosted) || flips==0
    next = cycle(mod(flips,3)+1);
    i = find(slices==next); 
    if isempty(i)
        i = find(slices>next,1,'first');
        frosted = [frosted(i:end),~frosted(i:-1:1)];
        slices = [slices(i:end)-next,N-slices(i-1:-1:1),N];
    else
        frosted = [frosted(i+1:end),~frosted(i:-1:1)];
        slices = [slices(i+1:end)-next,N-slices(i-1:-1:1),N];
    end
    flips = flips+1;
end
toc;

