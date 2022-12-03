close all; clear all;
%% Initial Conditons
t0 = 0;
h = 0.005; 
%% Constants for pendulum
b = 0.25; % Damping coefficient
l = 0.1; % Length of pendulum
m = 0.1; % Mass of pendulum
g = 9.81; % Gravitational Constant
A = 50; %73.6; % Forcing
nat_freq = (g/l)^(1/2);
alpha =  nat_freq * (3/4); % Natural Frequency of forcing
params = [b, l, m, g, A, alpha];
%% Plots
% Part a.)
figure()
hold on 

% Condition 1
n = 1000;
theta_0 = 3;
omega_0 = 0;
x0 = [theta_0,omega_0];

[x1] = RK4(@(x,t) odeCall_t(x,t,params),t0,h,n,x0);

x1(:,1) = mod( x1(:,1), 2*pi);
plot(x1(:,1),x1(:,2),'.')



%Condition 2
n = 1000;
theta_0 = pi-0.1;
omega_0 = 0;
x0 = [theta_0,omega_0];
[x1] = RK4(@(x,t) odeCall(x,t,params),t0,h,n,x0);
x1(:,1) = mod( x1(:,1), 2*pi);
plot(x1(:,1),x1(:,2),'.')


title('State-Space Trajectory, \beta = 0.25, Forced')
xlabel('\theta modulo 2\pi')
ylabel('\omega')
set(gca,'FontSize',14)
axis([0 2*pi -30 30])

