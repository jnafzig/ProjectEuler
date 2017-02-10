R = 10;

% mx = zeros(R+2,1);
% my = zeros(R+2,1);
% mx(1) = [R];
% my(1) = [0];
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
% 
% o = zeros(4*R^2,2);
% i = 1;
% for p = [mx,my]'
%     for q = [mx,my]'
%         o(i,:) = p+q;
%         i = i + 1;
%     end
% end
% o = unique(o,'rows');
% 
% maxperimeter = 0;
% 
% for p = o'
%     [g,u,v] = gcd(p(1),p(2));
%     if g == 1
%         if u > 0 || v < 0
%             pointc = p+[v;-u];
%         else
%             pointc = [v;-u];
%         end
%         plot(o(:,1),o(:,2),'.',...
%             [0,p(1),pointc(1),0],[0,p(2),pointc(2),0],'-o')
%         
%         assert(abs(p(2)*pointc(1)-p(1)*pointc(2))==1)
%         
%         a = sqrt(p(1)^2+p(2)^2);
%         b = sqrt(pointc(1)^2+pointc(2)^2);
%         c = sqrt((p(1)-pointc(1))^2+(p(2)-pointc(2))^2);
%         perimeter = a + b + c;
%         
%         if perimeter > maxperimeter
%             maxperimeter = perimeter;
%             T = a*b*c/(2*R);
%             maxp = p;
%             maxc = pointc;
%         end
%     end
% end
% 
% T