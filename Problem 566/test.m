clear;

a = 9;
b = 10;
c = 13;

slices = [L(a,b,c,0);L(a,b,c,1);L(a,b,c,2)];
slices = (unique(slices,'rows'));
[val,ix] = sort(slices(:,1)+sqrt(c)*slices(:,2));
slices = slices(ix,:);

N = a*b*c;

cycleA = [b*c;a*c;0];
cycleB = [0;0;a*b];

slicesA = slices(:,1);
slicesB = slices(:,2);

frosted = true(size(slicesA));
Nelem = numel(frosted);

flipper = cell(3,1);

for i = 1:3
    nextA = cycleA(mod(i-1,3)+1);
    nextB = cycleB(mod(i-1,3)+1);

    j = find(slicesA==nextA & slicesB==nextB); 

%     flipper{i} = sparse(1:Nelem,[j:Nelem,j-1:-1:1],[ones(1,Nelem-j+1),-ones(1,j-1)],Nelem,Nelem);
    flipper{i} = sparse(1:Nelem,[j+1:Nelem,j:-1:1],[ones(1,Nelem-j),-ones(1,j)],Nelem,Nelem);

%     frosted = [frosted(j+1:end);~frosted(j:-1:1)];

end

flips = 0;
while ~(all(frosted==1)&&flips~=0)

    frosted = flipper{mod(flips,3)+1}*frosted;
    
%     plot(val,frosted,'.');
%     pause;
    flips = flips + 1;
end
flips

F(a,b,c)
plot(diff(val))