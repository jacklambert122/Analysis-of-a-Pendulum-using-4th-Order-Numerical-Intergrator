close all; clear all;
%% Initial Conditons
t0 = 0;
n = 400;
h = 0.005; 
%% Constants for pendulum
b = 0.0; % Damping coefficient
l = 0.1; % Length of pendulum
m = 0.1; % Mass of pendulum
g = 9.81; % Gravitational Constant
A = 0; % Forcing
alpha = 0; % Natural Frequency of forcing
params = [b, l, m, g, A, alpha];
%% Plotting
figure()
hold on
%% For hyperbolic trajectories
theta_0 = 3*pi;
unstab_arr = [0:2:20];
for i = 1:length(unstab_arr)
    omega_0 = unstab_arr(i);
    x0 = [theta_0,-omega_0];
    % Positve omega
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
     % negative omega
    x0 = [-theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
end

%% For elliptical trajectories
n = 400;
theta_0 = 3*pi;
unstab_arr = [0:0.1:0.5];
for i = 1:length(unstab_arr)
    omega_0 = unstab_arr(i);
    x0 = [theta_0,-omega_0];
    % Positve omega
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
     % negative omega
    x0 = [-theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
end

n = 135;
theta_0 = 0;
unstab_arr = [0:2:10];
for i = 1:length(unstab_arr)
    omega_0 = unstab_arr(i);
    x0 = [theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
    n = n+1;
end

n = 135;
theta_0 = 0;
unstab_arr = [10:2:18];
for i = 1:length(unstab_arr)
    omega_0 = unstab_arr(i);
    x0 = [theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
    n = n+15;
end

n = 135;
theta_0 = 2*pi;
unstab_arr = [0:2:10];
for i = 1:length(unstab_arr)
    omega_0 = unstab_arr(i);
    x0 = [theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
    x0 = [-theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
    n = n+1;
end

n = 135;
theta_0 = 2*pi;
unstab_arr = [10:2:22];
for i = 1:length(unstab_arr)
    omega_0 = unstab_arr(i);
    x0 = [theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
    x0 = [-theta_0,omega_0];
    [x1] = ode4(@(x) odeCall(x,params),t0,h,n,x0);
    plot(x1(:,1),x1(:,2),'.')
    n = n+15;
end

% Fixed points
plot(pi,0,'*k')
plot(-pi,0,'*k')
plot(0,0,'*k')




title('State-Space Trajectory, \beta = 0')
xlabel('\theta')
ylabel('\omega')
axis([-2*pi 2*pi -30 30])
set(gca,'FontSize',14)