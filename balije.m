clear;clc;
%Read the Interpolated Balije points
T = readmatrix('balije.csv');

%Perform an interpolated function ds = f(ns)
ns = T(:,1);
ds = T(:,2);
f = @(nsi) 10.^interp1(log10(ns), log10(ds), log10(nsi), 'pchip');

%Read the setpoints
setpoints

%Obtain the slope in the Ns Ds graph
rho01 = P01*1e5/(R*T01);
Q = mdot/rho01;
deltah0s = Cp*T01*(rc^((g-1)/g) - 1);
K = 2*ut/sqrt(deltah0s);             

%Plot the Balije line and the ns*ds line
nsi = logspace(log10(min(ns)),log10(max(ns)),1000);
dsi = f(nsi);
loglog(nsi,dsi,nsi,K./nsi,'LineWidth',2.5); grid on
grid on
xlabel('n_s'); ylabel('d_s');


%Intersection of both lines
ns_star = fzero(@(x) f(x) - K/x, [0.5 10]);
ds_star = f(ns_star);
hold on; loglog(ns_star,ds_star,'ko');
legend('Balije curve', 'Fan line','Intersect')
saveas(gcf,'Balije-Fan.png')

%Diameter and speed
D = ds_star*sqrt(Q)/deltah0s^0.25;    % [m]
omega = 2*ut/D;                       % [rad/s]
rpm = omega*30/pi;
fprintf('ns = %.3f, ds = %.3f, D = %.2f m, N = %.0f rpm\n',ns_star,ds_star,D,rpm);