function [ flips] = Fmod(a,b,c)

    N = a*b*c;

    cycleA = [b*c;a*c;0];
    cycleB = [0;0;a*b];

    hz = gcd(a,b)*c;
    hv = a*b;

    [x,y]=ndgrid(hz*(fix(-N/hz):fix(2*N/hz)),hv*(-fix(N/(hv*sqrt(c))):fix(N/(hv*sqrt(c))))');

    val = x+sqrt(c)*y;
    x = x(val<=N&val>0);
    y = y(val<=N&val>0);
    val = val(val<=N&val>0);

    [val,ix] = sort(val);
    x = x(ix);
    y = y(ix);

    Nelem = numel(val);
    frosted = ones(Nelem,1);

    flipper = cell(3,1);
    for i = 1:3
        j(i) = find(x==cycleA(i) & y==cycleB(i));
        flipper{i} = sparse(1:Nelem,[j(i)+1:Nelem,j(i):-1:1],[ones(1,Nelem-j(i)),-ones(1,j(i))],Nelem,Nelem);

    end

    flips = 0;
    while ~(all(frosted==1)&&flips~=0)

        frosted = flipper{mod(flips,3)+1}*frosted;
        flips = flips + 1;
    end

end

