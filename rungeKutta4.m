function X_next = rungeKutta4(f,X_i,U_i,t_i,dt)
    K1 = f(X_i, U_i, t_i);
    K2 = f(X_i+ K1*(dt/2), U_i, t_i + dt/2);
    K3 = f(X_i+ K2*(dt/2), U_i, t_i + dt/2);
    K4 = f(X_i+ K3*(dt/2), U_i, t_i + dt);
    X_next = X_i + (dt/6)*(K1 + 2*K2 + 2*K3 + K4);
end

