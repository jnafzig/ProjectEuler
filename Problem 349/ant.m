clear;

N = 640;
M = 480;
Board = ones(M,N);

AntDirection = 0; % 0 -> up, 1 -> right, 2 -> down, 3 -> left
AntLocation = [1,1]*floor(N/2);


NumSteps = 20000;
% NumSteps = 10^5;
NumBlackSquares = zeros(NumSteps,1);
NBS = 0;

FrameNumber = 0;
for i = 1:NumSteps
    if Board(AntLocation(1),AntLocation(2))==0
        Board(AntLocation(1),AntLocation(2))=1;
        AntDirection = mod(AntDirection+1,4);
        NBS = NBS - 1;
    else 
        Board(AntLocation(1),AntLocation(2))=0;
        AntDirection = mod(AntDirection-1,4);
        NBS = NBS + 1;
    end
    switch AntDirection
        case 0
            AntLocation = AntLocation + [0,1];
        case 1
            AntLocation = AntLocation + [1,0];
        case 2
            AntLocation = AntLocation + [0,-1];
        case 3
            AntLocation = AntLocation + [-1,0];
    end
    AntLocation = mod(AntLocation-1,[M,N])+1;
    NumBlackSquares(i) = NBS;
end

DBS = diff(NumBlackSquares);
for i = 1:150
    if all(DBS(end-1-2*i:end-1-i)==DBS(end-i:end))
        T = i+1;
    end
end

cycle = diff(NumBlackSquares((1:T)+NumSteps-12*T));

Ntarget = int64(10^18);
NumSteps = int64(NumSteps);
T = int64(T);
NBS = int64(NBS);
NBS + idivide(Ntarget-NumSteps,T)*(sum(cycle)+1) + sum(cycle(1:mod(Ntarget-NumSteps,T)))
