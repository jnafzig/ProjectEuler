R = 0.999;
z0 = sqrt(1-R^2);
N = 3;

done = false;
while ~done
    theta = 2*pi/N;
    dz = @(z) sqrt(1-((1-z.^2).*cos(theta)+z.^2).^2)./((z - z.^3).*(1 - cos(theta)));

    if integral(dz,z0,1)>1000
        done = true;
    else
        N = N + 1;
    end
end

fprintf('%f\n',N*integral(dz,z0,1))