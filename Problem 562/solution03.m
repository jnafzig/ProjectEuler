R = 1e7;
mx = [R];
my = [0];

x = R;
y = 0;
tic;
i = 2;
step = 0;
while x>step
    x = x-1;
    step = floor(sqrt(R^2-x^2));
    
    my(i) = step;
    mx(i) = x;
    i = i+1;
end
toc;

tic;

[~,ix]=sort((mx.^2+my.^2),'descend');
N = numel(mx);
bound = 30;
maxperimeter = 0;

for i = ix(1:2000)
    spread = [i-bound:i-1,i+1:i+bound];
    spread = spread(spread>0&spread<N);
    p = [mx(i)+mx(spread);my(i)+my(spread)]';
    [g,u,v] = gcd(p(:,1),p(:,2));

    msk = g == 1;
    p = p(msk,:);
    u = u(msk,:);
    v = v(msk,:);

    msk = u > 0 | v < 0;

    q = [v,-u] + repmat(msk,[1,2]).*p;

    a = sqrt(sum(p.^2,2));
    b = sqrt(sum(q.^2,2));
    c = sqrt(sum((p-q).^2,2));
    perimeter = a + b + c;

    [maxp,imin] = max(perimeter); 
    if maxp>maxperimeter
        T = a(imin).*b(imin).*c(imin)/(2*R);
        maxperimeter = maxp;
    end
end
    
    
    

toc;

int64(round(T))