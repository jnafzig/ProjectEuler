function [ area ] = maxarea( sides )
    %MAXAREA 
    
    r0 = max(sides)/2;
    angle = @(r) sum(acos(1-sides.^2/(2*r.^2)))-2*pi;
    
    if angle(r0)>=0
        r1 = sum(sides)/4;
        r = fzero(angle,[r0,r1]);
        area  = sum(1/2*r.^2.*sin(acos(1-sides.^2/(2*r.^2))));
    else    
        angle = @(r) sum(acos(1-sides(1:end-1).^2/(2*r.^2)))...
            -acos(1-sides(end).^2/(2*r.^2));
        r1 = sum(sides(1:end-1))^2/(sqrt(12)*sqrt(sum(sides(1:end-1))^2 ...
            -sides(end)^2));
        r = fzero(angle,[r0,r1]);
        area  = sum(1/2*r.^2.*sin(acos(1-sides(1:end-1).^2/(2*r.^2)))) ...
            -sum(1/2*r.^2.*sin(acos(1-sides(end).^2/(2*r.^2))));
    end
end

