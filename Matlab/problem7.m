%% Author: Jack Lambert
% Chaotic Dynamics CSCI 4446
% Purpose: To create a fourth order Runge Kutta numerical differential
% equation solver
 close all; clear all;
%% Initial Conditons
theta_0 = 3;
omega_0 = 0.1;
x0 = [theta_0,omega_0];
t0 = 0;
n = 500;
h = 0.01; 
%% Constants for pendulum
b = 0; % Damping coefficient
l = 0.1; % Length of pendulum
m = 0.1; % Mass of pendulum
g = 9.81; % Gravitational Constant
A = 0; % Forcing
alpha = 0; % Natural Frequency of forcing
params = [b, l, m, g, A, alpha];
%% Call to 4th order Runge Kutta 
[x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);

% Part a.)
figure()
plot(x1(:,1),x1(:,2),'.')
title('State-Space Trajectory, [\theta,\omega] = [3, 0.1], \Deltat = 0.01(s)')
xlabel('\theta')
ylabel('\omega')
set(gca,'FontSize',14)

% Part b.)

theta_0 = 0.01;
omega_0 = 0;
x0 = [theta_0,omega_0];
[x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);

figure()
plot(x1(:,1),x1(:,2),'.')
title('State-Space Trajectory, [\theta,\omega] = [0.01, 0], \Deltat = 0.01(s)')
xlabel('\theta')
ylabel('\omega')
set(gca,'FontSize',14)