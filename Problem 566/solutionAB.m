clear;

a = 12;
b = 16;
c = 18;


N = a*b*c;

cycleA = [b*c;a*c;0];
cycleB = [0;0;a*b];

slicesA = N;
slicesB = 0;

frosted = true;

flips = 0;
while ~all(frosted) || flips==0
    nextA = cycleA(mod(flips,3)+1);
    nextB = cycleB(mod(flips,3)+1);

    i = find(slicesA==nextA & slicesB==nextB); 
    if isempty(i)
        i = find(slicesA+slicesB*sqrt(c)>nextA+nextB*sqrt(c),1,'first');
        frosted = [frosted(i:end);~frosted(i:-1:1)];
        slicesA = [slicesA(i:end)-nextA;N-slicesA(i-1:-1:1);N];
        slicesB = [slicesB(i:end)-nextB;-slicesB(i-1:-1:1);0];
    else
        frosted = [frosted(i+1:end);~frosted(i:-1:1)];

        slicesA = [slicesA(i+1:end)-nextA;N-slicesA(i-1:-1:1);N];
        slicesB = [slicesB(i+1:end)-nextB;-slicesB(i-1:-1:1);0];

    end
    flips = flips+1;
    
    plot(slicesA,slicesB,'o');
    
    
%     xlim([0,N]);

%     line([N,0],[-N/(sqrt(c)),0]+cycleA(mod(flips,3)+1)/(sqrt(c)),'LineStyle','-','Color','red');
%     line([N,0],[-N/(sqrt(c)),0]+N/sqrt(c)-cycleA(mod(flips,3)+1)/(sqrt(c)),'LineStyle','-','Color','red');

    line([2*N,0],[-N/(sqrt(c)),N/(sqrt(c))],'LineStyle','-');
    line([N,-N],[-N/(sqrt(c)),N/(sqrt(c))],'LineStyle','-');
    
%     line([0,0],[0,N/(sqrt(c))],'LineStyle','-');
%     line([N,N],[0,-N/(sqrt(c))],'LineStyle','-');
    
    hz = gcd(a,b)*c;
    line(hz*[[fix(-N/hz):fix(2*N/hz)]',...
        [fix(-N/hz):fix(2*N/hz)]']',...
        repmat(ylim,[fix(3*N/hz)+1,1])',...
        'LineStyle',':')
    
    hv = a*b;
    line(repmat(xlim,[2*fix(N/(hv*sqrt(c)))+1,1])',...
        hv*[[-fix(N/(hv*sqrt(c))):fix(N/(hv*sqrt(c)))]',...
        [-fix(N/(hv*sqrt(c))):fix(N/(hv*sqrt(c)))]']',...
        'LineStyle',':');
    
%     [x,y]=ndgrid(hz*(fix(-N/hz):fix(2*N/hz)),hv*(-fix(N/(hv*sqrt(c))):fix(N/(hv*sqrt(c))))');
%     
%     
%     val = x+sqrt(c)*y;
%     x = x(val<=N&val>0);
%     y = y(val<=N&val>0);
%     val = val(val<=N&val>0);
%     
%     [val,ix] = sort(val);
%     x = x(ix);
%     y = y(ix);
% %     hold on;
% %     plot(x(val<=N&val>0),y(val<=N&val>0),'+');
% %     hold off;
% %     xlim([-N/2,1.5*N]);
% %     
% %     xlim([-N/2,1.5*N]);
%     Nelem = numel(val);
% 
%     j = find(x==nextA & y==nextB); 
% %     flipper = sparse(1:Nelem,[j+1:Nelem,j-1:-1:1],[ones(1,Nelem-j),-ones(1,j)],Nelem,Nelem);

    

end