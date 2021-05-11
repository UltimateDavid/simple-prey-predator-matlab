% MATLAB implementation of Lotka-Volterra Prey-predator model
% Variables
a = 1; % Growth factor of predator population
b = 1; % Decay factor of predator with interactions
c = 1; % Decay factor of prey population
d = 1; % Growth factor of prey with interactions
fishing = 0; % External decay factor

% Initial values
prey0 = 1.5;
pred0 = 1.5;
y0 = [prey0; pred0];

% Timespan
t0 = 0;
tfinal = 30;
tspan = [t0:0.001:tfinal];

% Solve model
[t,y] = ode23(@(t,y) lotka(t,y,a,b,c,d,fishing),tspan,y0);

plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Predators','Location','North')

function yp = lotka(t,y,a,b,c,d,fishing)
%LOTKA  Lotka-Volterra predator-prey model.
yp = diag([a - b*y(2)-fishing, -c + d*y(1) - fishing])*y;
end
