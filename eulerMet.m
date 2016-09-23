function X_next = eulerMet(f,X_i,U_i,t_i,dt)

X_next = X_i + (f(X_i, U_i, t_i) * dt);

end

