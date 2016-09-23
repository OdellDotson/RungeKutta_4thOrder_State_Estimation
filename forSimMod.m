function [X,t] = forSimMod(f,x0,u,T,N,update)

X = zeros(numel(x0), N+1);
X(:,1) = x0;
t = linspace(0, T, N+1);

for i= 1:N,
    X(:,i+1)=update(f,X(:,i),u(X(:,i)),t(:,i), T/N); 
end

figure
plot(t,u(X))
title('Runge Kutta 4 method')
ylabel('State trajectory X')
xlabel('Time t')

end


