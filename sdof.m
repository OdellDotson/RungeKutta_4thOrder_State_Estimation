function dx = sdof(x,u,t)
m = 1;
g = 9.81;
l = 1;
J_s = 0.2;
J_a = 0.1;
n = 10;
b = 0.25;
B_s = 0.01;
B_a = 0.01;
K_i = 1;
K_w = 1;
R = 1;
L = 1;
J = J_s + n*n*J_a + m*l*l;
B = B_s + n*n*B_a + b;

x1 = x(1,:);%Position
x2 = x(2,:);%Angular Velocity
x3 = x(3,:);%Current going through motor

x1dot = x2;
x2dot = -((x2*B + m*g*l*sin(x1) - K_i * x3 * n) / J);
x3dot = -(x3*R + K_w * n * x2 - u)/L;

dx = [x1dot; x2dot; x3dot];% fill this part, this is the derivative of each state



end

