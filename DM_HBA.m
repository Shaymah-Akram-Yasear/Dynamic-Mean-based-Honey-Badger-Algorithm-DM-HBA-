function [Food_Score, Xprey, Convergence_curve] = DM_HBA(options)
I_fno = options.CEC_fun_no;
objf = options.objf;
dim = options.nVar;
lb = options.lb;
ub = options.ub;
N = options.popSize;
lambda = options.lambda;
MaxGen = options.MaxGen; 
C       = 2;      
vec_flag=[1,-1];
%initialization
X=initialization(N,dim,ub,lb);

%Evaluation
fitness = objf(X', I_fno);
[Food_Score, gbest] = min(fitness);
Xprey = X(gbest,:);
Convergence_curve=zeros(1,MaxGen);
for iter = 1:MaxGen
    alpha=C*exp(-iter/MaxGen);   
    I=Intensity(N,Xprey,X);  
    % Dynamic beta
    beta = 6 * (1 - exp(-lambda * iter / MaxGen)); % Eq. (8)
    for i=1:N
        Xm = mean(X,1);
        di = Xprey - X(i,:); % direction toward best prey
        r =rand();
        F=vec_flag(floor(2*rand()+1));
        for j=1:1:dim
            if r< 0.5
                r3=rand;                r4=rand;                r5=rand;
                % mean-based guidence
                Xnew(i,j) = Xm(j) + F * beta * I(i) * Xm(j) + F * r3 * alpha* di(j) * abs(cos(2* pi * r4) * (1-cos(2 * pi * r5))); % Eq. (9)
            else
                r7=rand;
                Xnew(i,j) = Xprey(j) + F * r7 * alpha * di(j);
            end
        end
        
        Xnew(i,:) = max(min(Xnew(i,:), ub), lb);
        tempFitness = objf(Xnew(i,:)', I_fno);
        if tempFitness<fitness(i)
            fitness(i)=tempFitness;
            X(i,:)= Xnew(i,:);
        end

    end
    X(i,:) = max(min(X(i,:), ub), lb);
    [Ybest,index] = min(fitness);

    if Ybest<Food_Score
        Food_Score=Ybest;
        Xprey = X(index,:);
    end
    Convergence_curve(iter) = Food_Score;
end

end




function I=Intensity(N,Xprey,X)
for i=1:N-1
    di(i) =( norm((X(i,:)-Xprey+eps))).^2;
    S(i)=( norm((X(i,:)-X(i+1,:)+eps))).^2;
end
di(N)=( norm((X(N,:)-Xprey+eps))).^2;
S(N)=( norm((X(N,:)-X(1,:)+eps))).^2;
for i=1:N
    r2=rand;
    I(i)=r2*S(i)/(4*pi*di(i));
end
end
function [X]=initialization(N,dim,up,down)
if size(up,2)==1
    X=rand(N,dim).*(up-down)+down;
end
if size(up,2)>1
    for i=1:dim
        high=up(i);low=down(i);
        X(:,i)=rand(N,1).*(high-low)+low;
    end
end
end
