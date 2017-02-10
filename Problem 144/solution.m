t = linspace(0,1,1000);
x = linspace(-5,5,1000);

a = [0.0;10.1];
b = [1.4;-9.6];

c = b*t+a*(1-t);

y = sqrt(100-4*x.^2); 

Ref = @(theta) [[cos(2*theta),sin(2*theta)];[sin(2*theta),-cos(2*theta)]];

p0 = a;
p1 = b;

n = 0;

N = 3;
p = zeros(N,2);
p(1,:) = p0';
while p1(2)<0 || abs(p1(1)) > 0.01

    m = p1(2)./p1(1)/4;
    theta = atan(m);
    p0r = Ref(theta)*(p0-p1)+p1;

    pvec = p0r - p1;

    a = pvec(2).^2+4*pvec(1).^2;
    b = 2*p1(2)*pvec(2) + 8*p1(1)*pvec(1);
    c = p1(2).^2+4*p1(1).^2-100;

    t1 = (-b + sqrt(b^2-4*a*c))/(2*a);
    t2 = (-b - sqrt(b^2-4*a*c))/(2*a);

    if t1>t2
        t = t1;
    else
        t = t2;
    end

    p0 = p1;
    p1 = pvec*t+p1;
    n = n+1;
end

% plot([p0(1),p1(1),p2(1)],[p0(2),p1(2),p2(2)],p0(1),p0(2),'+',p0r(1),p0r(2),'+',x,[-y;y],x+p1(1),-1./m*x+p1(2));xlim([-15,15]);ylim([-15 15]); axis square

