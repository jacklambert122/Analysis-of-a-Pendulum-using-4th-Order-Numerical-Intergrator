close all; clear all;
%% Initial Conditons
t0 = 0;
h = 0.005; 
%% Constants for pendulum
b = 0.25; % Damping coefficient
l = 0.1; % Length of pendulum
m = 0.1; % Mass of pendulum
g = 9.81; % Gravitational Constant
A = 0; % Forcing
alpha = 0; % Natural Frequency of forcing
params = [b, l, m, g, A, alpha];
%% Plots
% Part a.)
figure()
hold on 


n = 300;
theta_0 = 2*pi;
unstab_arr = [0:5:30];
for i = 1:length(unstab_arr)
    omega_0 = unstab_arr(i);
    x0 = [theta_0,-omega_0];
    % Positve omega
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    x1(:,1) = mod( x1(:,1), 2*pi);
    plot(x1(:,1),x1(:,2),'.')
     % negative omega
    x0 = [-theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    x1(:,1) = mod( x1(:,1), 2*pi);
    plot(x1(:,1),x1(:,2),'.')
end

n = 300;
theta_0 = 2*pi;
unstab_arr = [30:10:50];
for i = 1:length(unstab_arr)
    omega_0 = unstab_arr(i);
    x0 = [theta_0,-omega_0];
    % Positve omega
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    x1(:,1) = mod( x1(:,1), 2*pi);
    plot(x1(:,1),x1(:,2),'.')
     % negative omega
    x0 = [-theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    x1(:,1) = mod( x1(:,1), 2*pi);
    plot(x1(:,1),x1(:,2),'.')
end

title('State-Space Trajectory, \beta = 0.25')
xlabel('\theta modulo 2\pi')
ylabel('\omega')
set(gca,'FontSize',14)
axis([0 2*pi -30 30])