function [c, ceq] = confun(z) % Nonlinear inequality constraints
global x eta

c = norm(z-x) - eta; % Nonlinear equality constraints
ceq = [];
end