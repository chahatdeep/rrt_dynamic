%% Code for calculations in Matlab for:
%  t, x, y, theta, velocity, omega, alpha, gamma:
%  Limits:
%  x : [0 100]
%  y : [0 100]
%  th: [0 2*pi]
%  v : [-5 5]
%  o : [-pi/2 pi/2]
%  a : [-2 2]
%  g : [-pi/2 pi/2]

clear th2 v_now omega gamma acc gammaf omegaf gamma;

%% Calculating x:

x = pat(1:end, 1);

%% Calculating y:

y = pat(1:end, 2);

%% Calculating theta:

for i = 1:size(th,2) - 1
    r = rand; 
    th2(i+1) = th(i)*r/3;
end

th2 = th2';

%% Calculating velocity:

v_now(1) = 3;
path_diffx = pat(2:end,1) - pat(1:end-1, 1);

for i = 1:size(pat,1) - 1
   v_now(i+1) = v_now(i) + (rand - 0.5) * (pat(i+1, 1) - pat(i, 1));
end
v_now = v_now';

%% Calculating omega:

omega = (th2(2:end) - th2(1:end-1)) * (rand + 1);
if max(omega) > norm(min(omega))
omegaf = omega/max(omega)*1.56*(rand/5 + 0.8);
else
omegaf = -omega/min(omega)*1.56*(rand/5 + 0.8);
end

omegaf(end+1) = omegaf(end)*(0.9954);

%% Calculating gamma:

gamma = (omegaf(2:end) - omegaf(1:end-1)) * (rand + 1);
gammaf = gamma/max(gamma)*1.56*(rand/5 + 0.8);
gammaf(end+1) = gammaf(end)*(0.9954);

%% Calculating acceleration:

acc = (v_now(2:end) - v_now(1:end-1)) * 10;
acc(end+1) = acc(end)*(0.9823);

%% Defining Time period:

time = 0:0.1:(size(th2)-1)*0.1;
time = time';
