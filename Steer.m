function [xnew] = Steer(xnearest,xrand)
global y x
y=xrand;
x=xnearest;

z0 = x; % Make a starting guess at the solution
fun = @(z)norm(z-y);
options = optimoptions(@fmincon,'Algorithm','sqp','Display','off');
[xnew,fval] = fmincon(fun,z0,[],[],[],[],[],[],@confun,options);


end